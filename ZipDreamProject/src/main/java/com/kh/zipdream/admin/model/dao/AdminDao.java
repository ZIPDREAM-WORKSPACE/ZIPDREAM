package com.kh.zipdream.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.admin.model.vo.MemberApply;
import com.kh.zipdream.admin.model.vo.NoticeBoard;
import com.kh.zipdream.admin.model.vo.Report;
import com.kh.zipdream.common.model.vo.PageInfo;
import com.kh.zipdream.member.model.vo.Member;


@Repository
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int countUser() {
		return sqlSession.selectOne("admin-mapper.countUser");
	}
	
	public int countUserYesterday() {
		return sqlSession.selectOne("admin-mapper.countUserYesterday");
	}
	
	public int countLicenseUser() {
		return sqlSession.selectOne("admin-mapper.countLicenseUser");
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
	
	public int countReport() {
		return sqlSession.selectOne("admin-mapper.countReport");
	}
	
//	public int countReportYesterday() {
//		return sqlSession.selectOne("admin-mapper.countReportYesterday");
//	}
	
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
	
	public List<MemberApply> selectApplyListLimit5() {
		return sqlSession.selectList("admin-mapper.selectApplyListLimit5");
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
	
	public ArrayList<NoticeBoard> selectUserList(PageInfo pi, int type){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList) sqlSession.selectList("admin-mapper.selectUserList",type,rowBounds);
	}
	
	public ArrayList<Report> getReportList(PageInfo pi, int userNo){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList) sqlSession.selectList("admin-mapper.getReportList",userNo,rowBounds);
	}
	
	public int updateMemberStatus(Member m) {
		return sqlSession.update("admin-mapper.updateMemberStatus",m);
	}
}
