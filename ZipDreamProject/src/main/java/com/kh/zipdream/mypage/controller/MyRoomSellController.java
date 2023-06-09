package com.kh.zipdream.mypage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		for(int i = 0; i<addressList.length; i++) {
			System.out.println("보낸주소값"+addressList[i]);
			
		}
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

}
