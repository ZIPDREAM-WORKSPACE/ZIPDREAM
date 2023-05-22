package com.kh.zipdream.map.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MapDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<??> selectKeywordList(){
		return (ArrayList) sqlSession.selectKeywordList("");
	}
}
