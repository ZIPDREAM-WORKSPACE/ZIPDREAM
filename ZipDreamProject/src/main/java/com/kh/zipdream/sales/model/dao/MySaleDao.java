package com.kh.zipdream.sales.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.sales.model.vo.Calender;
import com.kh.zipdream.sales.model.vo.MySale;

@Repository
public class MySaleDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertMysaleHouse(MySale ms) {
		
		return sqlSession.insert("sale-mapper.insertMysaleHouse", ms);
	}
	
	public List<Integer> selectMySale(int userNo){
		
		return sqlSession.selectList("sale-mapper.selectMySale", userNo);
	}
	
	public int deleteMysaleHouse(MySale ms) {
		
		return sqlSession.delete("sale-mapper.deleteMysaleHouse", ms);
	}
	
	public ArrayList<Calender> selectCalender(){
		
		return (ArrayList)sqlSession.selectList("sale-mapper.selectCalender");
	}

	public ArrayList<Calender> selectinfoList(String calenderStart) {
		
		return (ArrayList)sqlSession.selectList("sale-mapper.selectinfoList", calenderStart);
	
	}
}
