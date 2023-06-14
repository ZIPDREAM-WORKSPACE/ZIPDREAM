package com.kh.zipdream.sell.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.admin.model.vo.Report;
import com.kh.zipdream.attachment.model.vo.Attachment;
import com.kh.zipdream.sell.model.vo.Counsle;
import com.kh.zipdream.sell.model.vo.SellDetail;
import com.kh.zipdream.sell.model.vo.SellDetailApi;


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
	
	public ArrayList<SellDetail> selectSellList(int refUno) {
		return (ArrayList)sqlSession.selectList("sell-mapper.selectSellList", refUno);
	}
	
	public List<Counsle> selectCounsel(int refTno){
		return sqlSession.selectList("sell-mapper.selectCounsel", refTno);
	}
	
	public SellDetail sellDetail(int sellNo) {
		return sqlSession.selectOne("sell-mapper.sellDetail", sellNo);
	}
	
	public List<SellDetail> selectSellAllList(){
		return sqlSession.selectList("sell-mapper.selectSellAllList");
	}
	
	
	
	public SellDetailApi detailApiSecond(Map<String, String> map){
		return sqlSession.selectOne("sell-mapper.selectApiList", map);
	}
	public int insertReport(Report report) {
		return sqlSession.insert("sell-mapper.insertReport",report);
	}
	
	public int insertCounsle(Counsle counsle) {
		return sqlSession.insert("sell-mapper.insertCounsle",counsle);
	}

	public int insertUserSelect(Map<String, Integer> map) {
		return sqlSession.insert("sell-mapper.insertUserSelect",map);
	}
	
	public int deleteUserSelect(Map<String, Integer> map) {
		return sqlSession.delete("sell-mapper.deleteUserSelect",map);
	}
	
	public int deleteSell(Map<String, Object> map) {
		return sqlSession.update("sell-mapper.deleteSell", map);
	}

	public List<SellDetail> selectSellList2(int sellNo){
		return sqlSession.selectList("sell-mapper.selectSellList2", sellNo);
	}
}
