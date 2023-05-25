package com.kh.zipdream.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.zipdream.mail.model.service.MailSendService;
@SessionAttributes({"loginUser"})  
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
	
	@Autowired
	MailSendService mailSendService;  //@Service를 붙였었다.

	@GetMapping("/mailAuth")
	@ResponseBody
	public String mailAuth(String mail, HttpServletResponse resp) throws Exception {
	    String authKey = mailSendService.sendAuthMail(mail); //사용자가 입력한 메일주소로 메일을 보냄
	    return authKey;
	}
	
		
		
		
	

		
		
		
	}


