package com.kh.zipdream.sell.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.sell.model.vo.Reply;

@Repository
public class ReplyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertReply(Reply reply) {
		return sqlSession.insert("reply-mapper.insertReply", reply);
	}
	
	public List<Reply> replyList(int detailBoardNo){
		return sqlSession.selectList("reply-mapper.replyList", detailBoardNo);
	}
	
	public int deleteReply(Map<String, Object> map) {
		return sqlSession.update("reply-mapper.deleteReply", map);
	}
	
	
	
	
}
