package com.kh.zipdream.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@GetMapping("/mypage")
	public String moveMypageController(){
		return "mypage/mypage";
	}
	
	@GetMapping("/currentPage")
	public String moveCurrentPageController() {
		return "mypage/currentPage";
	}
}
