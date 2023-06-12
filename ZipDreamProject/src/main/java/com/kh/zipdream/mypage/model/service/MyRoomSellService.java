package com.kh.zipdream.mypage.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.mypage.model.vo.MyRoomSell;

public interface MyRoomSellService {
	
	public ArrayList<Member> selectAgent(String[] address);
	public int myroomSellInsert(MyRoomSell mrs);
	public void selectMyRoomList(int currentPage, int userNo, Map<String, Object> map);
	public void myroomSellDelete(int userSrNo);
	public void selectCouponList(int userNo, Map<String, Object> map);
	

}
