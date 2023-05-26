package com.kh.zipdream.sell.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.zipdream.sell.model.service.SellService;

@Controller
@RequestMapping("/sell")
public class SellController {
	
	@Autowired
	private SellService sellService;
	
	//sell입력 페이지이동
	@GetMapping("/insert")
	public String main() {
		return "sell/sellEnrollForm";
	}
	
	//sell_detail페이지 이동
	@GetMapping("/detail")
	public String sellDetail() {
		return "sell/sellDetail";
	}
		
}
