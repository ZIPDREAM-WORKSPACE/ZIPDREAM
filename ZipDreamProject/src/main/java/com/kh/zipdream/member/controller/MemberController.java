package com.kh.zipdream.member.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

	      // 암호화 전 loginUser처리
	      Member loginUser = memberService.loginMember(m);
	    
	      System.out.println(m.getUserPwd());
	      if (loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) { 
	    	  	session.setAttribute("loginUser", loginUser);
		         if(loginUser.getUserLevel() == 3) {
		            mv.setViewName("redirect:/admin/main");
		         }else {            
		            mv.setViewName("redirect:/");
		         }
		         System.out.println(session.getAttribute("loginUser"));
	      } else { // 성공
	    	  mv.addObject("errorMsg", "로그인 실패");
		      mv.setViewName("common/errorPage");
	         
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
		
		String url = "";
		if (result > 0) { // 성공시 - 메인페이지로
			session.setAttribute("alertMsg", "회원가입");
			url = "redirect:/";
		} else { // 실패 - 에러페이지
			model.addAttribute("errorMsg", "회원가입 실패");
			url = "common/errorPage";
		}

		return url;
	}
	
	//중개사회원가입
		@PostMapping("/bkinsert")
		public String insertbkMember( 
				Member m, HttpSession session, Model model,
				 @RequestParam(value="imges", required=false) List<MultipartFile> imgList){
			String address = m.getAddress()+m.getAddr2()+m.getAddr3();
		
			m.setAddress(address);
			
			String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
			String webPath = "resources/bkupfiles/";
			String serverFolderPath = session.getServletContext().getRealPath(webPath);
			
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
			System.out.println("업로드 성공");
			session.setAttribute("alertMsg", "회원가입");
			url = "redirect:/";
			
		}else {
			System.out.println("업로드 실패");
			model.addAttribute("errorMsg", "회원가입 실패");
			url = "common/errorPage";
			
		}

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
			@RequestParam(value = "phone") String phone,
			@RequestParam(value = "userName") String userName,
			@RequestParam(value = "address") String address,
			@RequestParam(value = "userNo") int userNo,
			
			  HttpSession session, Model model 
			) {
		
		Member m = new Member();
		m.setUserName(userName);
		m.setPhone(phone);
		m.setAddress(address);
		m.setUserNo(userNo);
		
		int result = memberService.updateMember(m);
		
		String url = "";
		if (result > 0) { // 성공시 - 메인페이지로
			session.setAttribute("alertMsg", "수정성공");
			url = "redirect:/";
		} else { // 실패 - 에러페이지
			model.addAttribute("errorMsg", "수정실패");
			url = "common/errorPage";
		}
		System.out.println(m);
		
		
		return result;
	}

	@GetMapping("/mybookmarklist")
	@ResponseBody
	public List<userSelectList> mybookmarklist(@RequestParam("uno") int uno, Model model) {
		List<userSelectList> uslist = memberService.myBookmarkList(uno);

		return uslist;
	}










	





























}
	
	
	
	
	
	
	
	
	
	
	
	
	
	 

	
  
	 


