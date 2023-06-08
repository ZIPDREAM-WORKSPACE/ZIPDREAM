package com.kh.zipdream.mypage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.mypage.model.dao.MyRoomSellDao;

@Service
public class MyRoomSellServiceImpl implements MyRoomSellService{
	
	@Autowired
	private MyRoomSellDao myroomSellDao;

	@Override
	public ArrayList<Member> selectAgent(String[] address) {
		
		ArrayList<Member> agentList = myroomSellDao.selectAgent(address);
		
		return agentList;
	}

}
