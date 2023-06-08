package com.kh.zipdream.mypage.model.service;

import java.util.ArrayList;

import com.kh.zipdream.member.model.vo.Member;

public interface MyRoomSellService {
	
	public ArrayList<Member> selectAgent(String[] address);

}
