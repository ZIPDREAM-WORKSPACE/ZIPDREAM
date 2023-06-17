package com.kh.zipdream.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.zipdream.member.model.service.MemberService;
import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.mypage.model.service.MyRoomSellService;
import com.kh.zipdream.mypage.model.vo.MyRoomSell;
import com.kh.zipdream.sell.model.vo.SellDetail;

@Controller
@RequestMapping("/mypage")
@SessionAttributes({"loginUser", "myroomsellList"})
public class MyPageController {
	
	@Autowired
	private MyRoomSellService myroomSellService;
	
	@Autowired
	private MemberService memberService;

	@GetMapping("/mypage")
	public String moveMypageController(){
		return "mypage/mypage";
	}
	

	@GetMapping("/currentPage") 
	public String moveCurrentPageController() {
		return "mypage/currentPage"; 
	
	}
	
	@GetMapping("/mybookmarklist") 
	public String moveMyBookmarkListController() {
		return "mypage/mybookmarklist"; 
	
	}
	
	@GetMapping("/couponlist")

	public String moveCouponListController(@ModelAttribute("loginUser") Member loginUser, 
											Model model,
											@RequestParam(value="cpage", defaultValue="1") int currentPage){

		
		Map<String, Object> map = new HashMap();
		int userNo = loginUser.getUserNo();
		

		myroomSellService.selectCouponList(currentPage,userNo, map);

		
		model.addAttribute("map", map);
		
		return "mypage/couponList";
	}
	
	@GetMapping("/myInfo")
	public String moveMyInfoController(@ModelAttribute("loginUser") Member loginUser, Member m,
							Model model){
		m  = memberService.selectMember(loginUser.getUserNo());
				
		model.addAttribute("m", m);
				
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
	
	@ResponseBody
	@GetMapping("/recentRoomList")
	public ArrayList<SellDetail> recentRoomList(@RequestParam(value="sellNoList") List<Integer> sellNoList){
		
	
		ArrayList<SellDetail> recentRoomList = myroomSellService.recentRoomList(sellNoList);
		
		return recentRoomList;
		
	}
	
}
