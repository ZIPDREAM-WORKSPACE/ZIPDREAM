package com.kh.zipdream.agent.controller;

import java.util.HashMap; 
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.sell.model.service.SellService;

@Controller
@RequestMapping("/agent")
@SessionAttributes({"loginUser"})
public class agentController {
		
	@Autowired
	private SellService sellService;
	
	@GetMapping("/page")
	public String main() {
		return "agent/agentPage";
	}
	
	@GetMapping("/list")
	public String list(Model model, @ModelAttribute("loginUser") Member loginUser) { 
		Map<String, Object> map = new HashMap();
		
		int refUno = loginUser.getUserNo();
		System.out.println(refUno);
		sellService.selectSellList(map, refUno);
		
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
