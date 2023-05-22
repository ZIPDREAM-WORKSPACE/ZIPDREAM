package com.kh.zipdream.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zipdream.admin.model.dao.AdminDao;
import com.kh.zipdream.admin.model.vo.MemberApply;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao dao;
	
	public Map<String,Object> getMap(int o1, int o2){
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("num", o1);
		
		map.put("percent", getPercent(o1,o2));
		
		return map;
	}
	
	public double getPercent(int num1, int num2) {

		return ((double)(num1-num2) / ((double)num2 == 0 ? 1 : (double)num2)) * 100;
	}
	
	public Map<String,Object> countUser() {
		
		return getMap(dao.countUser(),dao.countUserYesterday());
	}
	
	public Map<String,Object> countLicenseUser() {
		
		return getMap(dao.countLicenseUser(),dao.countLicenseUserYesterday());		
	}
	
	public Map<String,Object> countObject() {		
		
		return getMap(dao.countObject(),dao.countObjectYesterday());		
	}
	
	public Map<String,Object> countReport() {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		int num = dao.countReport();
//		double percent = getPercent(num , dao.countReportYesterday());

		map.put("num", num);
//		map.put("percent", percent);
		return map;
	}
	
	public Map<String,Object> countEvent() {
		
		return getMap(dao.countEvent(),dao.countEventYesterday());
	}
	
	public Map<String,Object> countChattingRoom() {
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("chatRoom", dao.countChatRoom());
		map.put("chattingRoom", dao.countChattingRoom());
		
		return map;
	}
	
	public List<Map<String,String>> selectApplyListLimit5(){
		List<Map<String,String>> listResult = new ArrayList<Map<String,String>>();
		
		List<MemberApply>list = dao.selectApplyListLimit5();
		for(int i = 0; i < list.size(); i++) {
			Map<String,String> map = new HashMap<String,String>();
			map.put("userName", list.get(i).getUserName());
			map.put("applyDateTime", list.get(i).getApplyDateTime());
			listResult.add(map);
		}
		
		return listResult; 
	}
}
