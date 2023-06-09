package com.kh.zipdream.admin.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.admin.model.vo.Coupon;
import com.kh.zipdream.admin.model.vo.NoticeBoard;
import com.kh.zipdream.admin.model.vo.Report;
import com.kh.zipdream.common.model.vo.PageInfo;
import com.kh.zipdream.member.model.vo.Member;


@Repository
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int countUser(int type) {
		return sqlSession.selectOne("admin-mapper.countUser",type);
	}
	
	public int countUserYesterday() {
		return sqlSession.selectOne("admin-mapper.countUserYesterday");
	}
	
	public int selectBkSearchCount(Map<String, Object> paramMap) {		
		return sqlSession.selectOne("admin-mapper.selectBkSearchCount",paramMap);
	}
	
	public int countBkUser() {
		return sqlSession.selectOne("admin-mapper.countBkUser");
	}
	
	public int countLicenseUser(int type) {
		return sqlSession.selectOne("admin-mapper.countLicenseUser",type);
	}
	
	public int countLicenseUserYesterday() {
		return sqlSession.selectOne("admin-mapper.countLicenseUserYesterday");
	}
	
	public int countObject() {
		return sqlSession.selectOne("admin-mapper.countObject");
	}
	
	public int countObjectYesterday() {
		return sqlSession.selectOne("admin-mapper.countObjectYesterday");
	}
	
	public int countReport(int type) {
		return sqlSession.selectOne("admin-mapper.countReport",type);
	}
	
	public int countReportYesterday() {
		return sqlSession.selectOne("admin-mapper.countReportYesterday");
	}
	
	public int countUserReport(Map<String, Object> paramMap) {
		return sqlSession.selectOne("admin-mapper.countUserReport",paramMap);
	}
	
	public int countUserCoupon(int userNo) {
		return sqlSession.selectOne("admin-mapper.countUserCoupon",userNo);
	}
	
	public int countEvent() {
		return sqlSession.selectOne("admin-mapper.countEvent");
	}
	
	public int countEventYesterday() {
		return sqlSession.selectOne("admin-mapper.countEventYesterday");
	}
	
	public int countChatRoom() {
		return sqlSession.selectOne("admin-mapper.countChatRoom");
	}
	
	public int countChattingRoom() {
		return sqlSession.selectOne("admin-mapper.countChattingRoom");
	}
	
	public List<Member> selectApplyListLimit5() {
		return sqlSession.selectList("admin-mapper.selectApplyListLimit5");
	}
	
	public List<Report> selectReportList(int type) {
		return sqlSession.selectList("admin-mapper.selectReportList",type);
	}
	
	public List<Report> selectReportList(int type,PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return sqlSession.selectList("admin-mapper.selectReportList",type,rowBounds);
	}
	
	public int countNoticeBoard() {
		return sqlSession.selectOne("admin-mapper.countNoticeBoard");
	}
	
	public ArrayList<NoticeBoard> selectNoticeBoardList(PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList) sqlSession.selectList("admin-mapper.selectNoticeBoardList","",rowBounds);
	}
	
	public ArrayList<NoticeBoard> selectNoticeBoardList(){
		return (ArrayList) sqlSession.selectList("admin-mapper.selectNoticeList");
	}
	
	public int insertNoticeBoard(NoticeBoard nb) {
		return sqlSession.insert("admin-mapper.insertNoticeBoard",nb);
	}

	public int updateNoticeBoard(NoticeBoard nb) {
		return sqlSession.update("admin-mapper.updateNoticeBoard",nb);
	}
	
	public NoticeBoard selectNoticeBoard(int boardNo) {
		return sqlSession.selectOne("admin-mapper.selectNoticeBoard",boardNo);
	}
	
	public int deleteNoticeBoard(int boardNo) {
		return sqlSession.delete("admin-mapper.deleteNoticeBoard",boardNo);
	}
	
	public ArrayList<Member> selectUserList(PageInfo pi, int type){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList) sqlSession.selectList("admin-mapper.selectUserList",type,rowBounds);
	}
	
	public int selectUserSearchCount(Map<String, Object> paramMap) {		
		return sqlSession.selectOne("admin-mapper.selectUserSearchCount",paramMap);
	}
	
	public ArrayList<Member> selectUserSearch(PageInfo pi, Map<String, Object> paramMap) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList) sqlSession.selectList("admin-mapper.selectUserSearch", paramMap, rowBounds);
	}
	
	public ArrayList<Member> selectBkList(PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList) sqlSession.selectList("admin-mapper.selectBkList","",rowBounds);
	}
	
	public ArrayList<Member> selectBkSearch(PageInfo pi, Map<String, Object> paramMap) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList) sqlSession.selectList("admin-mapper.selectBkSearch", paramMap, rowBounds);
	}
	
	public ArrayList<Report> getReportList(PageInfo pi, Map<String, Object> paramMap){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList) sqlSession.selectList("admin-mapper.getReportList",paramMap,rowBounds);
	}
	
	public ArrayList<Coupon> getCouponList(PageInfo pi, int userNo){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList) sqlSession.selectList("admin-mapper.getCouponList",userNo,rowBounds);
	}
	
	public Report selectReport(int reportNo) {
		return sqlSession.selectOne("admin-mapper.selectReport",reportNo); 
	}
	
	public int updateReportResult(Report report) {
		return sqlSession.update("admin-mapper.updateReportResult",report);
	}
	
	public int updateMemberStatus(Member m) {
		return sqlSession.update("admin-mapper.updateMemberStatus",m);
	}
	
	public int insertCoupon(Coupon coupon) {
		return sqlSession.insert("admin-mapper.insertCoupon",coupon);
	}
	
	public ArrayList<Coupon> selectCouponList(){
		return (ArrayList) sqlSession.selectList("admin-mapper.selectCouponList");
	}
	
	public int insertCouponToUser(Map<String,Integer> map) {
		return sqlSession.insert("admin-mapper.insertCouponToUser",map);
	}
}
