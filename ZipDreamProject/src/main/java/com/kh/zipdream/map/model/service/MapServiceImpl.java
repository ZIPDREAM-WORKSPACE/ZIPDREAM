package com.kh.zipdream.map.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zipdream.map.model.dao.MapDao;
import com.kh.zipdream.map.model.vo.beopjeongdong;

@Service
public class MapServiceImpl implements MapService{

	@Autowired
	private MapDao mapdao;
	
	public int selectBjbCode(String detailAddrClob) {
		
		return mapdao.selectBjbCode(detailAddrClob);
	}
	
	public List<beopjeongdong> selectAddress(String adCode) {
		return mapdao.selectAddress(adCode);
	}
	
	public List<beopjeongdong> searchKeyword(String search) {
		return mapdao.searchKeyword(search);
	}
	
}
