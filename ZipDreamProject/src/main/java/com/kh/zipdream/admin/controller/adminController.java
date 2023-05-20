package com.kh.zipdream.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class adminController {

	@GetMapping("/main")
	public String main() {
		return "admin/adminMain";
	}
}
