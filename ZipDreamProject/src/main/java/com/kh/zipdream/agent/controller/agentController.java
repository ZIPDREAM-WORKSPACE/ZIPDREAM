package com.kh.zipdream.agent.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.zipdream.sell.model.service.SellService;

@Controller
@RequestMapping("/agent")
public class agentController {
		
	@Autowired
	private SellService sellService;
	
	@GetMapping("/page")
	public String main() {
		return "agent/agentPage";
	}
	
	@GetMapping("/list")
	public String list(Model model) { 
		Map<String, Object> map = new HashMap();
		sellService.selectSellList(map);
		model.addAttribute("map", map);
		return "agent/agentRegistrationList";
	}
	
	
	
	
	@GetMapping("/apply")
	public String applyList() {
		return "agent/agentRequestList";
	}
	
	@GetMapping("/counsel")
	public String counselList() {
		return "agent/agentCounselList";
	}
	
	@GetMapping("mypage")
	public String agentPage() {
		return "agent/agentMypage";
	}
}
