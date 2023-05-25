package com.kh.zipdream.sell.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sell")
public class SellController {
	
	@GetMapping("/insert")
	public String main() {
		return "sell/sellEnrollForm";
	}
	
//	@GetMapping("/detail")
//	public String main() {
//		return "sell/sellDetail";
//	}
}
