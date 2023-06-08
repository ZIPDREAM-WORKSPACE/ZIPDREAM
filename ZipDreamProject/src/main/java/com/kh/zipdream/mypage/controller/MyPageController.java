package com.kh.zipdream.mypage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.mypage.model.service.MyRoomSellService;
import com.kh.zipdream.mypage.model.vo.MyRoomSell;

@Controller
@RequestMapping("/mypage")
@SessionAttributes({"loginUser", "myroomsellList"})
public class MyPageController {
	
	@Autowired
	private MyRoomSellService myroomSellService;

	@GetMapping("/mypage")
	public String moveMypageController(){
		return "mypage/mypage";
	}
	

	@GetMapping("/currentPage") 
	public String moveCurrentPageController() {
		return "mypage/currentPage"; 
	
	}
	
	@GetMapping("/couponlist")
	public String moveCouponListController(){
		return "mypage/couponList";
	}
	
	@GetMapping("/myInfo")
	public String moveMyInfoController(){
		return "mypage/myInfo";
	}
	
	@GetMapping("/myroomlist")
	public String moveMyRoomList(@ModelAttribute("loginUser") Member loginUser, Model model) {
		
		System.out.println("방내놓기 영역"+loginUser);
		int userNo = loginUser.getUserNo();
		
		ArrayList<MyRoomSell> list = myroomSellService.selectMyRoomList(userNo);
		System.out.println(list);
	
		model.addAttribute("myroomsellList", list);
		
		return "mypage/myroomList";
	
		
		
	}
	
	@GetMapping("/myroominsert")
	public String moveMyRoomInsert() {
		return "mypage/myroomInsert";
	}
}
