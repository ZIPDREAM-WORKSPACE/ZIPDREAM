package com.kh.zipdream.sales.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
@RequestMapping("/sales")
public class SalesController {
	
	@GetMapping("/schedule")
	public String moveSalesSchedule() {
		return "sales/salesSchedule";
	}
	
	@GetMapping("/guide")
	public String moveSalesGuide() {
		return "sales/salesGuide";
	}
	
	@GetMapping("/term")
	public String moveSalesTerm() {
		return "sales/salesTerm";
	}
	
	@GetMapping("/faq")
	public String moveSalesFaq() {
		return "sales/salesFaq";
	}

}
