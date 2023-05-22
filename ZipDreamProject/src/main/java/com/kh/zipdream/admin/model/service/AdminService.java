package com.kh.zipdream.admin.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.zipdream.admin.model.vo.NoticeBoard;

public interface AdminService {
	
	public Map<String,Object> countUser();
	public Map<String,Object> countLicenseUser();
	public Map<String,Object> countObject();
	public Map<String,Object> countReport();
	public Map<String,Object> countEvent();
	public Map<String,Object> countChattingRoom();
	public List<Map<String,String>> selectApplyListLimit5();
	
	public void selectNoticeBoard(int cp, Map<String, Object> map);
}
