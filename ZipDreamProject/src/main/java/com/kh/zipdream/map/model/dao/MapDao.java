package com.kh.zipdream.map.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.map.model.vo.beopjeongdong;

@Repository
public class MapDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectBjbCode(String detailAddrClob) {
		return sqlSession.selectOne("mapMapper.selectBjbCode", detailAddrClob);
	}
	
	public List<beopjeongdong> selectAddress(String adCode) {
		return sqlSession.selectList("mapMapper.selectAddress", adCode);
	}
	
	public List<beopjeongdong> searchKeyword(String search) {
		return sqlSession.selectList("mapMapper.searchKeyword", search);
	}
	
	public String selectPullAddress(int liId) {
		return sqlSession.selectOne("mapMapper.selectPullAddress", liId);
	}
}
