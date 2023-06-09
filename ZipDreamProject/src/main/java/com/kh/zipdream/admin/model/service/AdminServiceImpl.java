package com.kh.zipdream.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.zipdream.admin.model.dao.AdminDao;
import com.kh.zipdream.admin.model.vo.Coupon;
import com.kh.zipdream.admin.model.vo.NoticeBoard;
import com.kh.zipdream.admin.model.vo.Report;
import com.kh.zipdream.chat.model.dao.ChatDAO;
import com.kh.zipdream.chat.model.vo.ChatRoom;
import com.kh.zipdream.common.model.vo.PageInfo;
import com.kh.zipdream.common.template.Pagination;
import com.kh.zipdream.map.controller.MapController;
import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.utils.FileUtils;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao dao;
	
	@Autowired
	private ChatDAO chatDao;
	
	@Autowired
	private Pagination pagination;
	
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
		
		return getMap(dao.countUser(1),dao.countUserYesterday());
	}
	
	public Map<String,Object> countLicenseUser() {
		
		return getMap(dao.countLicenseUser(1),dao.countLicenseUserYesterday());		
	}
	
	public Map<String,Object> countObject() {		
		
		return getMap(dao.countObject(),dao.countObjectYesterday());		
	}
	
	public Map<String,Object> countReport(int type) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		int num = dao.countReport(type);
		double percent = getPercent(num , dao.countReportYesterday());

		map.put("num", num);
		map.put("percent", percent);
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
		
		List<Member>list = dao.selectApplyListLimit5();
		
		for(int i = 0; i < list.size(); i++) {
			Map<String,String> map = new HashMap<String,String>();
			map.put("userName", list.get(i).getUserName());
			map.put("applyDateTime", list.get(i).getEnrollDateTime()+"");
			listResult.add(map);
		}
		
		return listResult; 
	}
	
	public List<Map<String,String>> selectReportList(int type) {
		
		
		List<Report>list = dao.selectReportList(type);

		List<Map<String,String>> listResult = reportListToMapList(list);
		
		return listResult; 
	}
	
	public List<Map<String,String>> selectReportList(int type,int cp, Map<String, Object> map) {
		
		int listCount = dao.countReport(type);
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);
		
		List<Report>list = dao.selectReportList(type,pi);
		List<Map<String,String>> listResult = reportListToMapList(list);
		
		map.put("pi",pi);
		map.put("list", listResult);
		
		return listResult; 
	}
	
	public void selectNoticeBoardList(int cp,int boardLimit,Map<String, Object> map){
		int listCount = dao.countNoticeBoard();
		int pageLimit = 10;
		
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);
		
		ArrayList<NoticeBoard> list = dao.selectNoticeBoardList(pi);
		
		for(int i = 0; i < list.size(); i++) {
			NoticeBoard board = list.get(i);
			board.setNoticeBoardContent(board.getNoticeBoardContent().trim());
			
			board.setNoticeBoardContent(board.getNoticeBoardContent().substring(0,
					board.getNoticeBoardContent().length() > 15 ? 15 : board.getNoticeBoardContent().length()-1));
			
		}
		
		map.put("pi", pi);
		map.put("list", list);
		
	}
	
	public int insertNoticeBoard(NoticeBoard nb) {
		return dao.insertNoticeBoard(nb);
	}
	
	public int updateNoticeBoard(NoticeBoard nb) {
		return dao.updateNoticeBoard(nb);
	}
	
	public NoticeBoard selectNoticeBoard(int boardNo) {
		return dao.selectNoticeBoard(boardNo);
	}
	
	public int deleteNoticeBoard(int boardNo) {
		return dao.deleteNoticeBoard(boardNo);
	}
	
	public void selectNoticeBoardList(Map<String, Object> map){
		
		map.put("list", dao.selectNoticeBoardList());
	}
	
	public void selectUserList(int cp, int type, Map<String, Object> map) {
		int listCount = 0;
		
		if(type == 1) {
			listCount = dao.countUser(2);
		}else {
			listCount = dao.countLicenseUser(2);
		}
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);
		
		ArrayList<Member> list = dao.selectUserList(pi,type);
		
		map.put("pi", pi);
		map.put("list", list);
	}
	
	public void selectUserSearch(Map<String, Object> paramMap,Map<String, Object> map) {
		int listCount = dao.selectUserSearchCount(paramMap);
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = pagination.getPageInfo(listCount, (int)paramMap.get("cp"), pageLimit, boardLimit);
		ArrayList<Member> list = dao.selectUserSearch(pi, paramMap);
		map.put("pi", pi);
		map.put("list", list);
	}
	
	public void selectBkList(int cp, Map<String, Object> map) {
		int listCount = dao.countBkUser();
		
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);
		
		ArrayList<Member> list = dao.selectBkList(pi);
		
		map.put("pi", pi);
		map.put("list", list);
	}
	
	public void selectBkSearch(Map<String, Object> paramMap,Map<String, Object> map) {
		int listCount = dao.selectBkSearchCount(paramMap);
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = pagination.getPageInfo(listCount, (int)paramMap.get("cp"), pageLimit, boardLimit);
		ArrayList<Member> list = dao.selectBkSearch(pi, paramMap);
		map.put("pi", pi);
		map.put("list", list);
	}
	
	public JSONObject getReportList(int cp, Map<String, Object> paramMap) {
		int listCount = dao.countUserReport(paramMap);				
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);
		
		ArrayList<Report> list = dao.getReportList(pi, paramMap);
		
		JSONObject obj = new JSONObject();
		JSONArray jArray = new JSONArray();	
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			
			for(int i = 0; i < list.size(); i++) {
				Map<String, Object> map = objectMapper.convertValue(list.get(i), Map.class);
				JSONObject jsonObj = (JSONObject) new JSONParser().parse(new MapController().getJsonStringFromMap(map));
				
				jArray.add(jsonObj);
			}
		} catch (ParseException e) {
			e.printStackTrace();	
		};
		
		obj.put("pi", pi);
		obj.put("array", jArray);
		return obj;
	
	}
	
	public JSONObject getCouponList(int cp,int userNo) {
		int listCount = dao.countUserCoupon(userNo);				
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);
		
		ArrayList<Coupon> list = dao.getCouponList(pi, userNo);
		
		JSONObject obj = new JSONObject();
		JSONArray jArray = new JSONArray();	
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			
			for(int i = 0; i < list.size(); i++) {
				Map<String, Object> map = objectMapper.convertValue(list.get(i), Map.class);
				JSONObject jsonObj = (JSONObject) new JSONParser().parse(new MapController().getJsonStringFromMap(map));
				
				jArray.add(jsonObj);
			}
		} catch (ParseException e) {
			e.printStackTrace();	
		};
		
		obj.put("pi", pi);
		obj.put("array", jArray);
		return obj;
	
	}
	
	public List<Map<String,String>> getReportArrayList(int cp, Map<String, Object> paramMap , Map<String, Object> map) {
		
		int listCount = dao.countUserReport(paramMap);				
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);
		
		List<Report>list = dao.getReportList(pi, paramMap);

		List<Map<String,String>> listResult = reportListToMapList(list);
		
		map.put("pi",pi);
		map.put("list", listResult);
		
		return listResult; 
	}
	
	public int updateMemberStatus(Member m) {
		return dao.updateMemberStatus(m);
	}
	
	public Report selectReport(int reportNo) {
		return dao.selectReport(reportNo);
	}
	
	public int updateReportResult(Report report) {
		return dao.updateReportResult(report);
	}
	
	public void selectChatRoomList(int cp,Map<String, Object> map){
		int listCount = chatDao.countChatRoom();
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);
		
		ArrayList<ChatRoom> list = chatDao.selectChatRoomList(pi);
		map.put("pi", pi);
		map.put("list", list);
		
	}
	
	public List<Map<String,String>> reportListToMapList(List<Report> list) {
		
		List<Map<String,String>> listResult = new ArrayList<Map<String,String>>();
		
		for(int i = 0; i < list.size(); i++) {
			Map<String,String> maplist = new HashMap<String,String>();
			maplist.put("reportNo", list.get(i).getReportNo()+"");
			maplist.put("rname", list.get(i).getRName());
			maplist.put("tname", list.get(i).getTName());
			maplist.put("reportContent", list.get(i).getReportContent());
			maplist.put("reportType", list.get(i).getReportType()+"");
			maplist.put("reportStatus", list.get(i).getReportStatus()+"");
			maplist.put("reportResult", list.get(i).getReportResult()+"");
			maplist.put("reportDate", list.get(i).getReportDate()+"");
			listResult.add(maplist);
		}
		
		return listResult;
	}

	@Transactional(rollbackFor = {Exception.class})
	public int insertCoupon(Coupon coupon, MultipartFile img, String webPath, String serverFolderPath) throws Exception{
		int result = 0;
		String changeName = FileUtils.saveFile(img, serverFolderPath);
		
		coupon.setCouponPath(coupon.getCouponPath() + changeName);
		
		result = dao.insertCoupon(coupon);
		
		return result;
	}
	
	public List<Coupon> selectCouponList(){
		
		return dao.selectCouponList();
	}
	
	public int insertCouponToUser(Map<String,Integer> map) {
		return dao.insertCouponToUser(map);
	}
}
