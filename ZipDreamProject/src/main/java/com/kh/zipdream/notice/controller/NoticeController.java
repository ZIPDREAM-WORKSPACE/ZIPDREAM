package com.kh.zipdream.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@GetMapping("/notice")
	public String moveNoticeController(){
		return "notice/notice_header";
	}
	
	@GetMapping("/manage")
	public String moveManageController(){
		return "notice/manage";
	}
	
	@GetMapping("/interest")
	public String moveInterestController(){
		return "notice/interest";
	}

}
