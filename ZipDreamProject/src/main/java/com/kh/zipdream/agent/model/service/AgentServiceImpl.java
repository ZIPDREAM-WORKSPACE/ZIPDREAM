package com.kh.zipdream.agent.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zipdream.agent.model.dao.AgentDao;
import com.kh.zipdream.common.model.vo.PageInfo;
import com.kh.zipdream.common.template.Pagination;
import com.kh.zipdream.mypage.model.vo.MyRoomSell;

@Service
public class AgentServiceImpl implements AgentService {

	@Autowired
	private AgentDao agentDao;
	
	@Autowired
	private Pagination pagination;
	
	
	
	@Override
	public void selectRequestList(int currentPage, int userNo, Map<String, Object> map) {
		
		int listCount = agentDao.selectRequedstListCount(userNo);
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		
		ArrayList<MyRoomSell> requestList = agentDao.selectRequestList(pi,userNo);
		
		map.put("pi", pi);
		map.put("requestList", requestList);
		
	}



	@Override
	public MyRoomSell selectRequestUser(int userSrNo) {
		
		MyRoomSell ms = agentDao.selectRequestUser(userSrNo);
		
		return ms;
	}



	@Override
	public int updateMyRoomSell(MyRoomSell ms) {
		
		int result = agentDao.updateMyRoomSell(ms);
		
		return result;
	}
	
	
	public int applyCounsle(Map<String , Object> map) {
		int result = agentDao.applyCounsle(map);
		return result;
	}
	
	public int Xcounsle(Map<String , Object> map) {
		int result = agentDao.Xcounsle(map);
		return result;
	}

}
