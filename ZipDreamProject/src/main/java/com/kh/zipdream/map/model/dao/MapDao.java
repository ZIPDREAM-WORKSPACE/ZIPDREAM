package com.kh.zipdream.map.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MapDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectBjbCode(String detailAddrClob) {
		return sqlSession.selectOne("mapMapper.selectBjbCode", detailAddrClob);
	}
}
