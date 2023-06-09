package com.kh.zipdream.mypage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.mypage.model.dao.MyRoomSellDao;
import com.kh.zipdream.mypage.model.vo.MyRoomSell;

@Service
public class MyRoomSellServiceImpl implements MyRoomSellService{
	
	@Autowired
	private MyRoomSellDao myroomSellDao;

	@Override
	public ArrayList<Member> selectAgent(String[] address) {
		
		ArrayList<Member> agentList = myroomSellDao.selectAgent(address);
		
		return agentList;
	}

	@Override
	public int myroomSellInsert(MyRoomSell mrs) {
		
		int result = myroomSellDao.myroomSellInsert(mrs);
	
		return result;
	}

	@Override
	public ArrayList<MyRoomSell> selectMyRoomList(int userNo) {
		
		return myroomSellDao.selectMyRoomList(userNo);
	}

}
