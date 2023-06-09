package com.kh.zipdream.admin.model.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zipdream.admin.model.vo.Coupon;
import com.kh.zipdream.admin.model.vo.NoticeBoard;
import com.kh.zipdream.admin.model.vo.Report;
import com.kh.zipdream.member.model.vo.Member;

public interface AdminService {
	
	public Map<String,Object> countUser();
	public Map<String,Object> countLicenseUser();
	public Map<String,Object> countObject();
	public Map<String,Object> countReport(int type);
	public Map<String,Object> countEvent();
	public Map<String,Object> countChattingRoom();
	public List<Map<String,String>> selectApplyListLimit5();
	public List<Map<String,String>> selectReportList(int type);
	public List<Map<String,String>> selectReportList(int type,int cp, Map<String, Object> map);
	public void selectNoticeBoardList(int cp,int boardLimit, Map<String, Object> map);
	public void selectNoticeBoardList(Map<String, Object> map);
	public int insertNoticeBoard(NoticeBoard nb);
	public int updateNoticeBoard(NoticeBoard nb);
	public NoticeBoard selectNoticeBoard(int boardNo);
	public int deleteNoticeBoard(int boardNo);
	public void selectUserList(int cp, int type, Map<String, Object> map);
	public void selectUserSearch(Map<String, Object> paramMap,Map<String, Object> map);
	public void selectBkList(int cp, Map<String, Object> map);
	public void selectBkSearch(Map<String, Object> paramMap, Map<String, Object> map);
	public JSONObject getReportList(int cp, Map<String, Object> paramMap);
	public JSONObject getCouponList(int cp,int userNo);
	public List<Map<String,String>> getReportArrayList(int cp, Map<String, Object> paramMap, Map<String, Object> map);
	public int updateMemberStatus(Member m);
	public Report selectReport(int reportNo);
	public int updateReportResult(Report report);
	public void selectChatRoomList(int cp, Map<String, Object> map);
	public int insertCoupon(Coupon coupon, MultipartFile img, String webPath, String serverFolderPath) throws Exception;
	public List<Coupon> selectCouponList();
	public int insertCouponToUser(Map<String,Integer> map);
}
