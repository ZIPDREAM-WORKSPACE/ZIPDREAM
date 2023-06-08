package com.kh.zipdream.mypage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.mypage.model.service.MyRoomSellService;

@Controller
@RequestMapping("/myroomsell")
public class MyRoomSellController {
	
	@Autowired
	private MyRoomSellService myroomsellService;
	
	@ResponseBody
	@GetMapping("/insert")
	public ArrayList<Member> myroomSellInsert(String address) {
		
		// 입력한 주소값을 " " 으로 잘라서 배열에 담기.
		String[] addressList = address.split(" ");
		
		
		for(int i = 0; i<addressList.length;i++) {
			System.out.println(addressList[i]);;
		}
		
		ArrayList<Member> list = myroomsellService.selectAgent(addressList);
		
		
		return list;
	}

}
