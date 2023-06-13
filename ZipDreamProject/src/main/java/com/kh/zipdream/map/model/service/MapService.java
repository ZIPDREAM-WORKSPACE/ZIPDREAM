package com.kh.zipdream.map.model.service;

import java.util.List;

import com.kh.zipdream.map.model.vo.beopjeongdong;

public interface MapService {
	
	public int selectBjbCode(String detailAddrClob);
	
	public List<beopjeongdong> selectAddress(String adCode);
	
	public List<beopjeongdong> searchKeyword(String search);
	
	public String selectPullAddress(int liId);
}
