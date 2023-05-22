package com.kh.zipdream.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.zipdream.admin.model.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping("/main")
	public String main(Model model) {
		
		Map<String, Object> countNumbers = new HashMap<String, Object>();
		
		countNumbers.put("licenseUserCount", service.countLicenseUser());
		countNumbers.put("userCount", service.countUser());
		countNumbers.put("objectCount", service.countObject());
		countNumbers.put("reportCount", service.countReport());
		countNumbers.put("eventCount", service.countEvent());
		countNumbers.put("chattingCount", service.countChattingRoom());
		
		model.addAttribute("countNumbers",countNumbers);
		model.addAttribute("applyList",service.selectApplyListLimit5());
		return "admin/adminMain";
	}
}