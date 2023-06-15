package com.kh.zipdream.mypage.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.zipdream.admin.model.vo.Coupon;
import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.mypage.model.vo.MyRoomSell;
import com.kh.zipdream.sell.model.vo.SellDetail;

public interface MyRoomSellService {
	
	public ArrayList<Member> selectAgent(String[] address);
	public int myroomSellInsert(MyRoomSell mrs);
	public void selectMyRoomList(int currentPage, int userNo, Map<String, Object> map);
	public void myroomSellDelete(int userSrNo);

	public void selectCouponList(int currentPage, int userNo, Map<String, Object> map);
	public void deleteUserCoupon(Coupon coupon);

	public ArrayList<SellDetail> recentRoomList(List<Integer> sellNoList);
	public int checkAgent(String agentId);

	

}
