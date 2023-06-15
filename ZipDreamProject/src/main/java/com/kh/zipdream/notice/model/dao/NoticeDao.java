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
	
	public int deleteManageNotice(int noticeNo) {
		return sqlSession.delete("notice-mapper.deleteManageNotice", noticeNo);
	}

	public List<Notice> selectManageList(int refUno) {
		return sqlSession.selectList("notice-mapper.selectManageList",refUno);
	}
	
	public List<Notice> selectInterestList(int refUno) {
		return sqlSession.selectList("notice-mapper.selectInterestList",refUno);
	}
}
