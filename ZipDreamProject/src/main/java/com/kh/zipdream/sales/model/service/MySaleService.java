package com.kh.zipdream.sales.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.zipdream.sales.model.vo.Calender;
import com.kh.zipdream.sales.model.vo.MySale;

public interface MySaleService {

	
	public int insertMysaleHouse(MySale ms);
	public List<Integer> selectMySale(int userNo);
	public int deleteMysaleHouse(MySale ms);
	public ArrayList<Calender> selectCalender();
	public ArrayList<Calender> selectinfoList(String calenderStart);
	
}
