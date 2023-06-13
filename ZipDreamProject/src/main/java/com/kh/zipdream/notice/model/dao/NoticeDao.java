package com.kh.zipdream.notice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.notice.model.vo.Notice;

@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertNotice(Notice notice) {
		return sqlSession.insert("notice-mapper.insertNotice", notice);
	}
	
	public int deleteSaleNotice(Notice notice) {
		return sqlSession.delete("notice-mapper.deleteSaleNotice", notice);
	}

	public List<Notice> selectManageList() {
		return sqlSession.selectList("notice-mapper.selectManageList");
	}
	
	public List<Notice> selectInterestList() {
		return sqlSession.selectList("notice-mapper.selectInterestList");
	}
}
