package com.kh.zipdream.agent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/agent")
public class agentController {
	
	@GetMapping("/page")
	public String main() {
		return "agent/agentPage";
	}
	
	@GetMapping("/list")
	public String list() { 
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
