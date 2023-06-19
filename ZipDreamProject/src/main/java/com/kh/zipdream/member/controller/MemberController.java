package com.kh.zipdream.member.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.zipdream.mail.model.service.MailSendService;
import com.kh.zipdream.mail.model.vo.MailAuth;
import com.kh.zipdream.member.model.service.MemberService;
import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.member.model.vo.userSelectList;

@SessionAttributes({ "loginUser" })
@Controller
@RequestMapping("/member")
public class MemberController {

	@GetMapping("/login")
	public String login() {
		return "member/memberLogin";
	}

	@GetMapping("/join")
	public String memberJoin() {
		return "member/memberJoin";
	}
	
	@GetMapping("/bkjoin")
	public String bkmemerJoin() {
		return "member/bkmemberJoin";
	}
	
	@GetMapping("/updatemember")
	public String updatemember() {
		return "mypage/myInfo";
	}
	
	

	// 이메일
	@Autowired
	MailSendService mailSendService; 
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	// 로그인 회원가입
	@Autowired
	private MemberService memberService;
	
	
	private BCryptPasswordEncoder bcryptPasswordEncoder; 
	
	@Autowired
	public MemberController(MemberService memberService, BCryptPasswordEncoder bcryptPasswordEncoder) {
		this.memberService = memberService;
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
		
	}

	public MemberController() {

	}

	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@PostMapping("/memberLogin")
	   public ModelAndView loginMember(Model model, Member m, HttpSession session, RedirectAttributes ra,
	         HttpServletResponse resp, HttpServletRequest req, ModelAndView mv,
	         @RequestParam(value = "saveId", required = false) String saveId) {
			
			int emailcheck = memberService.emailCheck(m.getUserId());
			if(emailcheck == 1) {
		      Member loginUser = memberService.loginMember(m);
		      if (loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) { 
		    	  	session.setAttribute("loginUser", loginUser);
		    	  	Cookie cookie = new Cookie("saveId",loginUser.getUserId());
					
					if(saveId != null) { //아이디 저장이 체크 되었을때
						cookie.setMaxAge(60 * 60 * 24 * 365);// 초단위지정(1년)
					}else { // 아이디저장 체크하지 않았을때
						cookie.setMaxAge(0); // 유효시간 0초 -> 생성되자마자 소멸
					}
						
					cookie.setPath("/memberLogin");
					resp.addCookie(cookie);
					
			         if(loginUser.getUserLevel() == 3) {
			            mv.setViewName("redirect:/admin/main");
			         }else {            
			            mv.setViewName("redirect:/");
			         }
						/* System.out.println(session.getAttribute("loginUser")); */
		      } else { 

					Map<String, String> alertMsg = new HashMap<String, String>();
					alertMsg.put("message", "로그인에 실패했습니다.");
					alertMsg.put("type", "error");
					session.setAttribute("alertMsg", alertMsg);
					mv.addObject("errorMsg", "로그인 실패");
					mv.setViewName("redirect:/member/login");

					 
		         
		      }
			}else if(emailcheck >1) {
				
				boolean isEnrolled = false;

				for(int i = 1; i<= emailcheck; i++) {
					Map<String,String> map = new HashMap<String,String>();
					
					map.put("rowNum", i+"");
					map.put("userId", m.getUserId());
					
					Member loginUser = memberService.loginCheckMember(map);
					System.out.println(loginUser);
					if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) { 
						isEnrolled = true;
						session.setAttribute("loginUser", loginUser);
			    	  	Cookie cookie = new Cookie("saveId",loginUser.getUserId());
						
						if(saveId != null) { //아이디 저장이 체크 되었을때
							cookie.setMaxAge(60 * 60 * 24 * 365);// 초단위지정(1년)
						}else { // 아이디저장 체크하지 않았을때
							cookie.setMaxAge(0); // 유효시간 0초 -> 생성되자마자 소멸
						}
							
						cookie.setPath("/memberLogin");
						resp.addCookie(cookie);
				         if(loginUser.getUserLevel() == 3) {
				            mv.setViewName("redirect:/admin/main");
				         }else {            
				            mv.setViewName("redirect:/");
				         }
						
					}
				}
				if(! isEnrolled) { 

					Map<String, String> alertMsg = new HashMap<String, String>();
					alertMsg.put("message", "로그인에 실패했습니다.");
					alertMsg.put("type", "error");
					session.setAttribute("alertMsg", alertMsg);
					mv.addObject("errorMsg", "로그인 실패");
					mv.setViewName("redirect:/member/login");
				 

				}
		    }
	      return mv;  
	   }
	
	//회원가입
	@GetMapping("/insert") // /spring/member/insert
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	//일반회원가입
	@PostMapping("/insert")
	public String insertMember( 
			Member m, HttpSession session, Model model) {
		String address = m.getAddress()+m.getAddr2()+m.getAddr3();
		
		m.setAddress(address);
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		// 암호화된 pwd를 m의 userPwd다시 대입
		
		m.setUserPwd(encPwd);
		
		System.out.println("암호화 후 비밀번호 : "+m.getUserPwd());
		System.out.println(m.getUserId());
		
		int result = memberService.insertMember(m);
		Map<String,String> alertMsg = new HashMap<String,String>();
		String url = "";
		if (result > 0) { // 성공시 - 메인페이지로
			alertMsg.put("message", "회원가입에 성공했습니다.");
			alertMsg.put("type", "success");
			url = "redirect:/";
		} else { // 실패 - 에러페이지
			alertMsg.put("message", "회원가입에 실패했습니다.");
			alertMsg.put("type", "error");
			url = "redirect:/";
		}
		session.setAttribute("alertMsg", alertMsg);
		
		return url;
	}
	
	//중개사회원가입
		@PostMapping("/bkinsert")
		public String insertbkMember( 
				Member m, HttpSession session, Model model,
				 @RequestParam(value="imges", required=false) List<MultipartFile> imgList
				 ){
			String address = m.getAddress()+m.getAddr2()+m.getAddr3();
		
			m.setAddress(address);
			
			String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
			String webPath = "resources/bkupfiles/";
			String serverFolderPath = session.getServletContext().getRealPath(webPath);
			Map<String,String> alertMsg = new HashMap<String,String>();
			// 암호화된 pwd를 m의 userPwd다시 대입
			
			m.setUserPwd(encPwd);
			int result =0;
			
			try {
				result = memberService.insertbkMember(m, webPath, serverFolderPath,imgList);
				System.out.println(result);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("업로드 에러");
			}
	
			String url = "";
		if(result >0) {
			alertMsg.put("message", "회원가입에 성공했습니다. 관리자의 승인을 기다리세요.");
			alertMsg.put("type", "success");
			url = "redirect:/";
			
			
		}else {
			alertMsg.put("message", "회원가입에 실패했습니다.");
			alertMsg.put("type", "error");
			url = "redirect:/";
			
		}
		session.setAttribute("alertMsg", alertMsg);
		return url;
		}

	
	/*이메일*/
	@RequestMapping("/mailAuth")
	@ResponseBody
	public String mailAuth(MailAuth mailAuth, HttpServletResponse resp) throws Exception {
		String authKey = mailSendService.sendAuthMail(mailAuth.getMail()); //사용자가 입력한 메일주소로 메일을 보냄
		mailAuth.setAuthKey(authKey);
		memberService.registMailAuth(mailAuth);	//메일보냄과 동시에 DB저장	
		return authKey;
	}
	

	// 자식창 생성
	@RequestMapping("/join/mailWindow.wow")
	public String mailWindow(String mail, HttpServletResponse resp) throws Exception {
		return "join/mailWindow";  //step2.jsp화면에서 mail인증하기 버튼 누르면 자식창생김. 거기서 사용자는 authKey입력
	}
	
	//자식창에서 authKey맞는지확인
	@RequestMapping(value="/join/authKeyCompare.wow", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String authKeyCompare(MailAuth mailAuth) {
		try{
			memberService.authKeyCompare(mailAuth); //authKey는 사용자가 입력한 값
			return "authKeySame";
		} catch (Exception e) {
			return "somethingWrong";
		}
	}
	//다음버튼눌렀을 때 isAuth=1인지 확인
	@RequestMapping(value="/join/isMailAuthed.wow" ,produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String isMailAuthed(String mail) {
		int isAuth= memberService.isMailAuthed(mail);
		if(isAuth==1) return "메일인증완";
		else return "인증안됨";
	}
	

	@GetMapping("/logout")
	public String logoutMember(HttpSession session,
							SessionStatus status) {
		 
		status.setComplete(); // 세션 할일이 완료됨 -> 없앰 
		return "redirect:/";
	}
	
	// 아이디 중복체크
	@ResponseBody
	   @GetMapping("/emailCheck")
	   public int emailCheck(HttpSession session,
	                     
	                      @RequestParam(value = "id", required = false) String id) {
	      int result = memberService.emailCheck(id);
	      
	      return result;
	   }

	//아이디 찾기
	@ResponseBody
	@GetMapping("/searchId")
	public Member searchId(HttpSession session,
							
							 @RequestParam(value = "name", required = false) String name,
							 @RequestParam(value = "phone", required = false) String phone) {
		Map<String, String> map = new HashMap();
		map.put("name", name);
		map.put("phone", phone);
		Member result = memberService.searchId(map);
		return result;
	}
	
	//비밀번호찾기
	@ResponseBody
	@GetMapping("/searchPwd")
	public int searchPwd(HttpSession session,
							
					@RequestParam(value = "phone", required = false) String phoneNumber,
					@RequestParam(value = "idText", required = false) String idText)throws MessagingException {
		Member m = new Member();
		m.setPhone(phoneNumber);
		m.setUserId(idText);
		
		int leftLimit = 97; // letter 'a'
		int rightLimit = 122; // letter 'z'
		int targetStringLength = 10;
		
		Random random = new Random();
		StringBuilder buffer = new StringBuilder(targetStringLength);
		for (int i = 0; i < targetStringLength; i++) {
		    int randomLimitedInt = leftLimit + (int)
		            (random.nextFloat() * (rightLimit - leftLimit + 1));
		    buffer.append((char) randomLimitedInt);
		}
		String generatedString = buffer.toString();
		
		m.setUserPwd(bcryptPasswordEncoder.encode(generatedString));
		
		int result = memberService.searchPwd(m);
		
		MimeMessage mailMessage = mailSender.createMimeMessage();
		mailMessage.setFrom(new InternetAddress("minifkaus@naver.com"));
		mailMessage.setSubject("귀하의 " + m.getUserId() + " 비밀번호입니다.", "utf-8");
		mailMessage.setText("귀하의 ZIPDREAM 비밀번호는 " + generatedString + "입니다.", "utf-8", "html");
		mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(m.getUserId()));
		mailSender.send(mailMessage);
		
		return result;
	}
	
	//일반회원 정보수정
	@PostMapping("/updateMember")
	@ResponseBody
	public int updateMember(
			HttpSession session, Model model,
			@RequestParam(value = "phone") String phone,
			@RequestParam(value = "userName") String userName,
			@RequestParam(value = "address") String address,
			@RequestParam(value = "userNo") int userNo) {
		
			Map<String, String> map = new HashMap<String, String>();
			map.put("userName", userName);
			map.put("phone", phone);
			map.put("address", address);
			map.put("userNo", userNo+"");
						
			int result = memberService.updateMember(map);
			
			
			return  result;
			
	}
	
	//중개사회원 정보수정
		@PostMapping("/updatebkMember")	
		public String updatebkMember(
				HttpSession session, Model model,
				@RequestParam(value = "phone") String phone,
				@RequestParam(value = "userName") String userName,
				@RequestParam(value = "address") String address,
				@RequestParam(value = "userNo") String userNo, 
				@RequestParam(value = "images" , required = false) List<MultipartFile> imgList) {
																
				Map<String, String> map = new HashMap<String, String>();
				map.put("userName", userName);
				map.put("phone", phone);
				map.put("address", address);
				map.put("userNo", userNo+"");
				System.out.println(map);
				String webPath = "/resources/bkupfiles/";
				String serverFolderPath = session.getServletContext().getRealPath(webPath);
				Map<String,String> alertMsg = new HashMap<String,String>();
				
				String url = "";
				int result = memberService.updateMember(map);
				System.out.println(imgList);
				
				
								
				
				try {
					result = memberService.updatebkImages(map,imgList,webPath,serverFolderPath);
				} catch (Exception e) {
					
					e.printStackTrace();
				}
				

				if(result > 0) {
					alertMsg.put("message", "정보수정 성공!");
					alertMsg.put("type", "success");
					url = "redirect:/member/logout";
					
					
				}else {
					alertMsg.put("message", "정보수정 성공! 다시 로그인해주세요!");
					alertMsg.put("type", "success");
					url = "redirect:/member/logout";
					
				}
				session.setAttribute("alertMsg", alertMsg);
				return url;

				
		}
		
	
	//비밀번호 변경
	  @PostMapping("/changePw") 
	  public String changePw(@RequestParam Map<String, Object> paramMap,
	  
	  @ModelAttribute("loginUser") Member loginUser, RedirectAttributes ra, SessionStatus status, HttpSession session) {
			
		 
		 
		 String newPw = bcryptPasswordEncoder.encode(paramMap.get("newPw")+"");
		 Map<String,String> alertMsg = new HashMap<String,String>();
		 int result = 0;
		 if(bcryptPasswordEncoder.matches(paramMap.get("currentPw")+"", loginUser.getUserPwd())) {
			 Member m = new Member();
			 m.setUserNo(loginUser.getUserNo());
			 m.setUserPwd(newPw);
			 result = memberService.updateMemberPwd(m);
			
			 if(result > 0 ) {			 
				 alertMsg.put("message", "비밀번호 변경에 성공했습니다. 다시 로그인해주세요!");
				 alertMsg.put("type", "success");
				 session.setAttribute("alertMsg", alertMsg);
			 }else {
				 if(loginUser.getUserLevel()==1) {
					 alertMsg.put("message", "비밀번호 변경에 실패했습니다.");
						alertMsg.put("type", "error");
						session.setAttribute("alertMsg", alertMsg);
					 return "redirect:/mypage/myInfo";
				 }else {
					 alertMsg.put("message", "비밀번호 변경에 실패했습니다.");
						alertMsg.put("type", "error");
						session.setAttribute("alertMsg", alertMsg);
					 return "redirect:/agent/mypage";
				 }
			 }
		 }else {	
			 if(loginUser.getUserLevel()==1) {
				 alertMsg.put("message", "비밀번호 변경에 실패했습니다.");
					alertMsg.put("type", "error");
					session.setAttribute("alertMsg", alertMsg);
				 return "redirect:/mypage/myInfo";
			 }else {
				 alertMsg.put("message", "비밀번호 변경에 실패했습니다.");
					alertMsg.put("type", "error");
					session.setAttribute("alertMsg", alertMsg);
				 return "redirect:/agent/mypage";
			 }
			
			 
		 }
	
		 	status.setComplete(); 
		 
			 
	  return "redirect:/"; 
	  }
	 

	  @GetMapping("/mybookmarklist")
		@ResponseBody
		public List<userSelectList> mybookmarklist(@RequestParam("uno") int uno, Model model) {
			List<userSelectList> uslist = memberService.myBookmarkList(uno);
	
			return uslist;
		}
		
		@PostMapping("/snslogin")
		@ResponseBody
		public String snslogin(Model model, Member m, HttpSession session, RedirectAttributes ra,
		         HttpServletResponse resp, HttpServletRequest req, ModelAndView mv) {
		
				int emailcheck = memberService.emailCheck(m.getUserId());
				if(emailcheck == 1) {
					
					Member loginUser = memberService.loginMember(m);
					System.out.println( bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd()));
					if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) { 
				
						session.setAttribute("loginUser", loginUser);
						
					}else {
						m.setUserPwd(bcryptPasswordEncoder.encode(m.getUserPwd()));
						memberService.insertMember(m);
						session.setAttribute("loginUser", m);
					}
					
				}else if(emailcheck > 1) {
					boolean isEnrolled = false;
					
					for(int i = 0; i<emailcheck; i++) {
						Map<String,String> map = new HashMap<String,String>();
						
						map.put("rowNum", i+"");
						map.put("userId", m.getUserId());
						
						Member loginUser = memberService.loginCheckMember(map);
						
						if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) { 
							isEnrolled = true;
							session.setAttribute("loginUser", loginUser);
							
						}
					}
					
					if(! isEnrolled) {
						m.setUserPwd(bcryptPasswordEncoder.encode(m.getUserPwd()));
						memberService.insertMember(m);
						session.setAttribute("loginUser", m);
					}
				}else {
					m.setUserPwd(bcryptPasswordEncoder.encode(m.getUserPwd()));
					memberService.insertMember(m);
					session.setAttribute("loginUser", m);
				}
		
			
			return "true";
		}
	  
	@PostMapping("/deleteMember")
	@ResponseBody
	public int deleteMember(@RequestParam (value="userPwd2") String userPwd2,@ModelAttribute("loginUser") Member loginUser) {
		int result = 0;
		
		String pwd = loginUser.getUserPwd();
		int userNo = loginUser.getUserNo();
		System.out.println(userPwd2 + ": "+pwd);
		
		if(bcryptPasswordEncoder.matches(userPwd2, pwd)) {
			result= memberService.deleteMember(userNo); 
		}
		
		return result;
	}
	
	
	@GetMapping("/sessionOut")
	@ResponseBody
	public void sessionOut(HttpSession session, SessionStatus status) {
		 
		status.setComplete(); // 세션 할일이 완료됨 -> 없앰 
		
	}
	
	
	
	
	
	
	
	
	
	
	
}







	






























	
	
	
	
	
	
	
	
	
	
	
	
	
	 

	
  
	 


