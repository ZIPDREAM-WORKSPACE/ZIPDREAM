package com.kh.zipdream.member.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.attachment.model.vo.Attachment;
import com.kh.zipdream.mail.model.vo.MailAuth;
import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.member.model.vo.userSelectList;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member loginMember(Member inputMember) {

		return sqlSession.selectOne("member-mapper.loginMember", inputMember);
	}
	
	public int bkInsertImg(List<Attachment> bkImgList) {
		return sqlSession.insert("member-mapper.bkInsertImg", bkImgList);
	}
	
	public int insertMailAuth(MailAuth mailAuth) {
		return sqlSession.insert("member-mapper.insertMailAuth", mailAuth);
	}
	public MailAuth getMailAuth(String mail) {
		return sqlSession.selectOne("member-mapper.getMailAuth", mail);
	}
	public int updateMailAuth(MailAuth mailAuth){
		return sqlSession.update("member-mapper.updateMailAuth", mailAuth);
	}
	//부모창 mail인증하기 버튼


	public int completeAuth(String mail) {
		return sqlSession.selectOne("member-mapper.completeAuth", mail);
	}

	public int insertMember(Member inputMember) {
		
		return sqlSession.insert("member-mapper.insertMember", inputMember);
	}
	
	public int insertbkMember(Member inputMember) {
		int result =  sqlSession.insert("member-mapper.insertbkMember", inputMember);
		
		return inputMember.getUserNo();
	}

	
	public int emailCheck(String id) {
		      return sqlSession.selectOne("member-mapper.emailCheck",id);
		   }
	
	public int insertapply(int userNo) {
		return sqlSession.insert("member-mapper.insertbkMember", userNo);
	}
	
	
	public Member selectMember(int userNo) {
		return sqlSession.selectOne("member-mapper.selectMember",userNo);
	}
	
	public Member selectbkMember(int userNo) {
		return sqlSession.selectOne("member-mapper.selectbkMember",userNo);
	}
	
	public int updateMember(Map<String, String> map) {
		return sqlSession.update("member-mapper.updateMember", map);
	}
	
	public int updatebkImages(Attachment img) {
		return sqlSession.update("member-mapper.updatebkImages",img);
	}
	
	public List<Attachment> selectAttachmentList(int userNo) {
		return (ArrayList)sqlSession.selectList("member-mapper.selectAttachmentList",userNo);
	}
	
	
	public Member searchId(Map<String, String> map) {
		return sqlSession.selectOne("member-mapper.searchId",map);
	}
	

	public int searchPwd(Member m) {
		return sqlSession.update("member-mapper.searchPwd",m);
    }
	
	
	public int updateMemberPwd(Member m) {
		return sqlSession.update("member-mapper.updateMemberPwd", m);
	}
	
	
	public int deleteMember(int userNo) {
		return sqlSession.update("member-mapper.deleteMember",userNo);

	}
	
	public List<userSelectList> myBookmarkList(int uno){
		return sqlSession.selectList("member-mapper.myBookmarkList", uno);
	}
	
	public Member loginCheckMember(Map<String, String> map) {
		return sqlSession.selectOne("member-mapper.loginCheckMember", map);
	}
	
}

