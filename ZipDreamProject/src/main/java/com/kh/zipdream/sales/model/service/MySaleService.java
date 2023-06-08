package com.kh.zipdream.sales.model.service;

import java.util.List;

import com.kh.zipdream.sales.model.vo.MySale;

public interface MySaleService {

	
	public int insertMysaleHouse(MySale ms);
	public List<Integer> selectMySale(int userNo);
	public int deleteMysaleHouse(MySale ms);
	
}
