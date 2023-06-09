package com.kh.zipdream.sell.model.dao;

import java.util.List;

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
	
	
}
