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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.zipdream.agent.model.service.AgentService;
import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.mypage.model.vo.MyRoomSell;
import com.kh.zipdream.sell.model.service.SellService;

@Controller
@RequestMapping("/agent")
@SessionAttributes({"loginUser", "requestList"})
public class agentController {
		
	@Autowired
	private SellService sellService;
	
	@Autowired 
	private AgentService agentService;
	
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
	public String applyList(@ModelAttribute("loginUser") Member loginUSer,
					        Model model,
					        @RequestParam(value="cpage", defaultValue="1") int currentPage) {
		
		Map<String, Object> map = new HashMap();
		int userNo = loginUSer.getUserNo();
		
		agentService.selectRequestList(currentPage, userNo, map);
		
		model.addAttribute("map", map);
		
		
		return "agent/agentRequestList";
	}
	
	@GetMapping("/counsel")
	public String counselList() {
		return "agent/agentCounselList";
	}
	
	@GetMapping("/mypage")
	public String agentPage() {
		return "agent/agentMypage";
	}
	
	@ResponseBody
	@GetMapping("/userInfo")
	public MyRoomSell selectRequestUser(int userSrNo) {
		
		MyRoomSell ms = agentService.selectRequestUser(userSrNo);
		
		return ms;
		
	}
	
	@PostMapping("/updateMs")
	public String updateMyRoomSell(MyRoomSell ms) {
		
		System.out.println(ms);
		
		int result = agentService.updateMyRoomSell(ms);
	
		if(result>0) {
			return "redirect:/agent/apply";
		} else {
			return "";
		}
		
	}
	
	
}
