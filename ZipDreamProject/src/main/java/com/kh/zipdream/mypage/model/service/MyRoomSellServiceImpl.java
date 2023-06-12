package com.kh.zipdream.mypage.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zipdream.admin.model.vo.Coupon;
import com.kh.zipdream.common.model.vo.PageInfo;
import com.kh.zipdream.common.template.Pagination;
import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.mypage.model.dao.MyRoomSellDao;
import com.kh.zipdream.mypage.model.vo.MyRoomSell;

@Service
public class MyRoomSellServiceImpl implements MyRoomSellService{
	
	@Autowired
	private MyRoomSellDao myroomSellDao;
	
	@Autowired
	private Pagination pagination;

	@Override
	public ArrayList<Member> selectAgent(String[] address) {
		
		ArrayList<Member> agentList = myroomSellDao.selectAgent(address);
		
		return agentList;
	}

	@Override
	public int myroomSellInsert(MyRoomSell mrs) {
		
		int result = myroomSellDao.myroomSellInsert(mrs);
	
		return result;
	}

	@Override
	public void selectMyRoomList(int cp, int userNo, Map<String, Object> map) {
		
		int listCount = myroomSellDao.selectMyRoomListCount(userNo);
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);
		
		ArrayList<MyRoomSell> myroomsellList = myroomSellDao.selectMyRoomList(pi,userNo);
		
		map.put("pi", pi);
		map.put("myroomsellList", myroomsellList);
		
	}

	@Override
	public void myroomSellDelete(int userSrNo) {
		
		myroomSellDao.myroomSellDelete(userSrNo);
		
	}

	@Override
	public void selectCouponList(int currentPage, int userNo, Map<String, Object> map) {
		
		int listCount = myroomSellDao.selectCouponListCount(userNo);
		int pageLimit = 10;
		int boardLimit = 4;
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Coupon> couponList = myroomSellDao.selectCouponList(pi,userNo);
		
		map.put("pi", pi);
		map.put("couponList", couponList);
		
	}

	@Override
	public void deleteUserCoupon(Coupon coupon) {
		myroomSellDao.deleteUserCoupon(coupon);
		
	}

}
