package com.kh.zipdream.member.controller;

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

	@GetMapping("/mailAuth")
	@ResponseBody
	public String mailAuth(String mail, HttpServletResponse resp) throws Exception {
		String authKey = mailSendService.sendAuthMail(mail); // 사용자가 입력한 메일주소로 메일을 보냄
		return authKey;
	}

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
	public String loginMember(Model model, Member m, HttpSession session, RedirectAttributes ra,
			HttpServletResponse resp, HttpServletRequest req, ModelAndView mv,
			@RequestParam(value = "saveId", required = false) String saveId) {

		// 암호화 전 loginUser처리
		Member loginUser = memberService.loginMember(m);
		if (loginUser == null) { // 실패
			mv.addObject("errorMsg", "로그인 실패");
			mv.setViewName("common/errorPage");
		} else { // 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
			System.out.println(session.getAttribute("loginUser"));

		}
		return "redirect:/";
	}

	
	  @GetMapping("/insert") public String enrollForm() {
		  	return "member/memberLogin"; 
		  	
	  }
	  
	  @PostMapping("/insert") public String insertMember(Member m, HttpSession session, Model model) {
	  
	  int result = memberService.insertMember(m);
	  
	  String url = ""; if (result > 0) { session.setAttribute("alertMsg", "회원가입");
	  					url = "redirect:/"; } else { model.addAttribute("errorMsg", "회원가입 실패"); url = "common/errorPage"; }
	  
	  return url; 
	  }
	  
  }
	 


