package com.kh.zipdream.mypage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.zipdream.admin.model.vo.Coupon;
import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.mypage.model.service.MyRoomSellService;
import com.kh.zipdream.mypage.model.vo.MyRoomSell;

@Controller
@RequestMapping("/myroomsell")
public class MyRoomSellController {
	
	@Autowired
	private MyRoomSellService myroomsellService;
	
	@ResponseBody
	@GetMapping("/select")
	public ArrayList<Member> selectAgent(String address) {
		
		// 입력한 주소값을 " " 으로 잘라서 배열에 담기.
		String[] str = address.split(" ");
		String[] addressList = {str[1], str[2]}; 
		
		ArrayList<Member> list = myroomsellService.selectAgent(addressList);
		
		
		return list;
	}
	
	@ResponseBody
	@GetMapping("/insert")
	public String myroomSellInsert(MyRoomSell mrs) {
		
		
		int result = myroomsellService.myroomSellInsert(mrs);
		
		if(result>0) {
			return "성공";
			
		}else {
			return "실패";
		}
		
		
	}
	
	@ResponseBody
	@GetMapping("/deletemyroom")
	public void myroomSellDelete(int userSrNo) {
		
		myroomsellService.myroomSellDelete(userSrNo);
		
	}

	
	@ResponseBody
	@GetMapping("/deleteuUserCoupon")
	public void deleteUserCoupon(Coupon coupon) {
		
		myroomsellService.deleteUserCoupon(coupon);
	}

	@ResponseBody
	@GetMapping("/checkAgent")
	public int checkAgent(String agentId) {
		
		int result = myroomsellService.checkAgent(agentId);
		
		/* System.out.println("검색한 공인중개사는 몇명? " + result); */
		return result;
	}
	

}
