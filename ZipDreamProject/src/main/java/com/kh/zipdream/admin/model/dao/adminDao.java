package com.kh.zipdream.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class adminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int countUser() {
		return sqlSession.selectOne("admin-mapper.countUser");
	}
	
	public int countLicenseUser() {
		return sqlSession.selectOne("admin-mapper.countLicenseUser");
	}
	
	public int countObject() {
		return sqlSession.selectOne("admin-mapper.countObject");
	}
	
	public int countReport() {
		return sqlSession.selectOne("admin-mapper.countReport");
	}
	
	public int countEvent() {
		return sqlSession.selectOne("admin-mapper.countEvent");
	}
}
