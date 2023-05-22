package com.kh.zipdream.map.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.zipdream.map.model.dao.MapDao;

public class MapServiceImpl implements MapService{

	@Autowired
	private MapDao mapDao;
	
	@override
	public ArrayList<??> selectKeywordList(String keyword){
		return mapDao.selectkeywordList(String keyword);
	}
}
