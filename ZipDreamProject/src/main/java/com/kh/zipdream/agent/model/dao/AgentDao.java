package com.kh.zipdream.agent.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.common.model.vo.PageInfo;
import com.kh.zipdream.mypage.model.vo.MyRoomSell;

@Repository
public class AgentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectRequedstListCount(int userNo) {
		
		return sqlSession.selectOne("agent-mapper.selectRequestListCount", userNo);
	}
	
	public ArrayList<MyRoomSell> selectRequestList(PageInfo pi,int userNo){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("agent-mapper.selectRequestList", userNo, rowBounds);
		
	}
	public MyRoomSell selectRequestUser(int userSrNo) {
		
		return sqlSession.selectOne("agent-mapper.selectRequestUser", userSrNo);
	}
	
	public int updateMyRoomSell(MyRoomSell ms) {
		
		return sqlSession.update("agent-mapper.updateMyRoomSell", ms);
	}
	
}
