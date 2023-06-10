package com.kh.zipdream.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.common.model.vo.PageInfo;
import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.mypage.model.vo.MyRoomSell;

@Repository
public class MyRoomSellDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Member> selectAgent(String[] address){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("address", address);
		
		return (ArrayList) sqlSession.selectList("myroomsell-mapper.selectAgent", map);
		
	}
	
	public int myroomSellInsert(MyRoomSell mrs) {
		
		return sqlSession.insert("myroomsell-mapper.myroomSellInsert", mrs);
	}
	
	public int selectMyRoomListCount(int userNo) {
		
		return sqlSession.selectOne("myroomsell-mapper.selectMyRoomListCount", userNo);
		
	}
	
	public ArrayList<MyRoomSell> selectMyRoomList(PageInfo pi,int userNo){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myroomsell-mapper.selectMyRoomList", userNo, rowBounds);
	}
	
}
