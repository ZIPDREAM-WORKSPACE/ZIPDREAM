package com.kh.zipdream.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String moveCouponListController(@ModelAttribute("loginUser") Member loginUser, Model model){
		
		Map<String, Object> map = new HashMap();
		int userNo = loginUser.getUserNo();
		
		myroomSellService.selectCouponList(userNo, map);
		
		model.addAttribute("map", map);
		
		return "mypage/couponList";
	}
	
	@GetMapping("/myInfo")
	public String moveMyInfoController(){
		return "mypage/myInfo";
	}
	
	@GetMapping("/myroomlist")
	public String moveMyRoomList(@ModelAttribute("loginUser") Member loginUser, 
								 Model model,
								 @RequestParam(value="cpage", defaultValue="1") int currentPage) {
		
		Map<String, Object> map = new HashMap();
		int userNo = loginUser.getUserNo();
		
		myroomSellService.selectMyRoomList(currentPage, userNo, map);

		model.addAttribute("map", map);
		
		return "mypage/myroomList";

	}
	
	@GetMapping("/myroominsert")
	public String moveMyRoomInsert() {
		return "mypage/myroomInsert";
	}
}
