package com.kh.zipdream.admin.model.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import com.kh.zipdream.admin.model.vo.NoticeBoard;
import com.kh.zipdream.member.model.vo.Member;

public interface AdminService {
	
	public Map<String,Object> countUser();
	public Map<String,Object> countLicenseUser();
	public Map<String,Object> countObject();
	public Map<String,Object> countReport();
	public Map<String,Object> countEvent();
	public Map<String,Object> countChattingRoom();
	public List<Map<String,String>> selectApplyListLimit5();
	
	public void selectNoticeBoardList(int cp, Map<String, Object> map);
	public void selectNoticeBoardList(Map<String, Object> map);
	public int insertNoticeBoard(NoticeBoard nb);
	public int updateNoticeBoard(NoticeBoard nb);
	public NoticeBoard selectNoticeBoard(int boardNo);
	public int deleteNoticeBoard(int boardNo);
	public void selectUserList(int cp, int type, Map<String, Object> map);
	public JSONObject getReportList(int cp, int userNo);
	public int updateMemberStatus(Member m);
}
