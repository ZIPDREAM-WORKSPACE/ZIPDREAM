package com.kh.zipdream.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.admin.model.vo.Coupon;
import com.kh.zipdream.common.model.vo.PageInfo;
import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.mypage.model.vo.MyRoomSell;
import com.kh.zipdream.sell.model.vo.SellDetail;

@Repository
public class MyRoomSellDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Member> selectAgent(String[] address){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("address", address);
		
		return (ArrayList) sqlSession.selectList("myroomsell-mapper.selectAgent", map);
		
	}
	
	public int myroomSellInsert(MyRoomSell mrs) {
		
		return sqlSession.insert("myroomsell-mapper.myroomSellInsert", mrs);
	}
	
	public int selectMyRoomListCount(int userNo) {
		
		return sqlSession.selectOne("myroomsell-mapper.selectMyRoomListCount", userNo);
		
	}
	
	public ArrayList<MyRoomSell> selectMyRoomList(PageInfo pi,int userNo){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myroomsell-mapper.selectMyRoomList", userNo, rowBounds);
	}
	
	public void myroomSellDelete(int userSrNo) {
		
		sqlSession.delete("myroomsell-mapper.myroomSellDelete", userSrNo);
	}
	

	public ArrayList<Coupon> selectCouponList(PageInfo pi, int userNo){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myroomsell-mapper.selectCouponList", userNo, rowBounds);
	}
	
	public int selectCouponListCount (int userNo) {
		
		return sqlSession.selectOne("myroomsell-mapper.selectCouponListCount", userNo);
	}
	
	public void deleteUserCoupon(Coupon coupon) {
		sqlSession.delete("myroomsell-mapper.deleteUserCoupon", coupon);

	}
	

	
	 public ArrayList<SellDetail> recentRoomList(List<Integer> sellNoList){
		 
		 HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("sellNoList",sellNoList);
	  
		 return (ArrayList)sqlSession.selectList("myroomsell-mapper.recentRoomList",map);
	 }
	 

}
