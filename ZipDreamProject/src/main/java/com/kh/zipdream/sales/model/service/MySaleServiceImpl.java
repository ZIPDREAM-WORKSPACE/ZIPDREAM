package com.kh.zipdream.sales.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zipdream.sales.model.dao.MySaleDao;
import com.kh.zipdream.sales.model.vo.Calender;
import com.kh.zipdream.sales.model.vo.MySale;

@Service
public class MySaleServiceImpl implements MySaleService {
	
	@Autowired
	private MySaleDao mysaleDao;

	@Override
	public int insertMysaleHouse(MySale ms) {
		
		int result = mysaleDao.insertMysaleHouse(ms);
		
		return result;
	}

	@Override
	public List<Integer> selectMySale(int userNo) {
		
		List<Integer> mysaleList = mysaleDao.selectMySale(userNo);
		
		return mysaleList;
	}

	@Override
	public int deleteMysaleHouse(MySale ms) {
		int result = mysaleDao.deleteMysaleHouse(ms);
		
		return result;
	}

	@Override
	public ArrayList<Calender> selectCalender() {
		
		ArrayList<Calender> calenderList = mysaleDao.selectCalender();
		
		return calenderList;
	}


	@Override
	public ArrayList<Calender> selectinfoList(String calenderStart) {
		
		ArrayList<Calender> selectinfoList = mysaleDao.selectinfoList(calenderStart);
		
		return selectinfoList;
	}

	


}
