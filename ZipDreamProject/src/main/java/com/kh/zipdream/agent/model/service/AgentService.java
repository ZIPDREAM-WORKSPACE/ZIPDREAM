package com.kh.zipdream.agent.model.service;

import java.util.Map;

import com.kh.zipdream.mypage.model.vo.MyRoomSell;

public interface AgentService {
	
	public void selectRequestList(int currentPage, int userNo, Map<String, Object> map);
	public MyRoomSell selectRequestUser(int userSrNo);
	public int updateMyRoomSell(MyRoomSell ms);
	int applyCounsle(Map<String , Object> map);
	int Xcounsle(Map<String , Object> map);
}
