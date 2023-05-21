package com.kh.zipdream.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.zipdream.admin.model.service.adminService;

@Controller
@RequestMapping("/admin")
public class adminController {
	
	@Autowired
	private adminService service;
	
	@GetMapping("/main")
	public String main(Model model) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("licenseUserCount", service.countLicenseUser());
		map.put("userCount", service.countUser());
		map.put("objectCount", service.countObject());
		map.put("reportCount", service.countReport());
		map.put("eventCount", service.countEvent());
		
		model.addAttribute("countNumbers",map);
		
		return "admin/adminMain";
	}
}
