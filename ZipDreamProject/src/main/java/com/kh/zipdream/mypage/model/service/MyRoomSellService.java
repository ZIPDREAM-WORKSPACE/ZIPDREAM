package com.kh.zipdream.mypage.model.service;

import java.util.ArrayList;

import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.mypage.model.vo.MyRoomSell;

public interface MyRoomSellService {
	
	public ArrayList<Member> selectAgent(String[] address);
	public int myroomSellInsert(MyRoomSell mrs);
	public ArrayList<MyRoomSell> selectMyRoomList(int userNo);

}
