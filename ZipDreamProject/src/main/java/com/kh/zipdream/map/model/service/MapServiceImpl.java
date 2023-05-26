package com.kh.zipdream.map.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zipdream.map.model.dao.MapDao;

@Service
public class MapServiceImpl implements MapService{

	@Autowired
	private MapDao mapdao;
	
	public int selectBjbCode(String detailAddrClob) {
		
		return mapdao.selectBjbCode(detailAddrClob);
	}
}
