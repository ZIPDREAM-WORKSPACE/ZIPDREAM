package com.kh.zipdream.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class mainController {
	
	@GetMapping("/tos")
	public String tos() {
		return "main/TOS";
	}
	
	@GetMapping("/privacyPolicy")
	public String privacyPolicy() {
		return "main/privacyPolicy";
	}
	
	@GetMapping("/management")
	public String management() {
		return "main/management";
	}

}
