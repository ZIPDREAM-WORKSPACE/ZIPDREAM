package com.kh.zipdream.member.controller;

import java.net.http.HttpRequest;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.zipdream.mail.model.service.MailSendService;
import com.kh.zipdream.mail.model.vo.MailAuth;
import com.kh.zipdream.member.model.service.MemberService;
import com.kh.zipdream.member.model.vo.Member;

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

	// 이메일
	@Autowired
	MailSendService mailSendService; // @Service를 붙였었다.

	// 로그인 회원가입
	@Autowired
	private MemberService memberService;

	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;

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
	      if (loginUser == null) { // 실패
	         mv.addObject("errorMsg", "로그인 실패");
	         mv.setViewName("common/errorPage");
	      } else { // 성공
	         session.setAttribute("loginUser", loginUser);
	         if(loginUser.getUserLevel() == 3) {
	            mv.setViewName("redirect:/admin/main");
	         }else {            
	            mv.setViewName("redirect:/");
	         }
	         System.out.println(session.getAttribute("loginUser"));

	      }
	      return mv;  
	   }
	
	@GetMapping("/insert") // /spring/member/insert
	public String enrollForm() {
		return "member/memberEnrollForm";
	}

	@PostMapping("/insert")
	public String insertMember(Member m, HttpSession session, Model model) {

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
	

	//회원가입
	
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * @GetMapping("/insert") public String enrollForm() { return
	 * "member/memberLogin";
	 * 
	 * }
	 * 
	 * @PostMapping("/insert") public String insertMember(Member m, HttpSession
	 * session, Model model) {
	 * 
	 * int result = memberService.insertMember(m);
	 * 
	 * String url = ""; if (result > 0) { session.setAttribute("alertMsg", "회원가입");
	 * url = "redirect:/"; } else { model.addAttribute("errorMsg", "회원가입 실패"); url =
	 * "common/errorPage"; }
	 * 
	 * return url; }
	 */  
  }
	 


