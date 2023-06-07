package com.kh.zipdream.sell.model.dao;

import java.util.ArrayList;
import java.util.List;   

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.attachment.model.vo.Attachment;
import com.kh.zipdream.sell.model.vo.SellDetail;


@Repository
public class SellDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int sellInsert(SellDetail sd) {
		int result = sqlSession.insert("sell-mapper.sellInsert", sd);
		
		if(result > 0) {
			result = sd.getSellNo();
		}
		
		return result;
	}
	
	public int sellInsertImg(List<Attachment> sellImgList) {
		return sqlSession.insert("sell-mapper.sellInsertImg", sellImgList);
	}
	
	public ArrayList<SellDetail> selectSellList() {
		return (ArrayList)sqlSession.selectList("sell-mapper.selectSellList");
	}
	
	public SellDetail sellDetail(int sellNo) {
		return sqlSession.selectOne("sell-mapper.sellDetail", sellNo);
	}
	

}
