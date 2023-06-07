package com.kh.zipdream.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.member.model.vo.Member;

@Repository
public class MyRoomSellDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Member> selectAgent(String[] address){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("address", address);
		
		return (ArrayList) sqlSession.selectList("myroomsell-mapper.selectAgent", map);
		
	}
	
}
