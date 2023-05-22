package com.kh.zipdream.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Dao {

	public Dao() {
		
	}
	
	@Autowired
	public Dao(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public String select() {
		return sqlSession.selectOne("mapper.select");
	}
}
