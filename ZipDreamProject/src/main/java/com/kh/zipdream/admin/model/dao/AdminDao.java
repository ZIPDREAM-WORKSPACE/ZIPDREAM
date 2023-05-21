package com.kh.zipdream.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.admin.model.vo.MemberApply;


@Repository
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int countUser() {
		return sqlSession.selectOne("admin-mapper.countUser");
	}
	
	public int countUserYesterday() {
		return sqlSession.selectOne("admin-mapper.countUserYesterday");
	}
	
	public int countLicenseUser() {
		return sqlSession.selectOne("admin-mapper.countLicenseUser");
	}
	
	public int countLicenseUserYesterday() {
		return sqlSession.selectOne("admin-mapper.countLicenseUserYesterday");
	}
	
	public int countObject() {
		return sqlSession.selectOne("admin-mapper.countObject");
	}
	
	public int countObjectYesterday() {
		return sqlSession.selectOne("admin-mapper.countObjectYesterday");
	}
	
	public int countReport() {
		return sqlSession.selectOne("admin-mapper.countReport");
	}
	
//	public int countReportYesterday() {
//		return sqlSession.selectOne("admin-mapper.countReportYesterday");
//	}
	
	public int countEvent() {
		return sqlSession.selectOne("admin-mapper.countEvent");
	}
	
	public int countEventYesterday() {
		return sqlSession.selectOne("admin-mapper.countEventYesterday");
	}
	
	public int countChatRoom() {
		return sqlSession.selectOne("admin-mapper.countChatRoom");
	}
	
	public int countChattingRoom() {
		return sqlSession.selectOne("admin-mapper.countChattingRoom");
	}
	
	public List<MemberApply> selectApplyListLimit5() {
		return sqlSession.selectList("admin-mapper.selectApplyListLimit5");
	}
}