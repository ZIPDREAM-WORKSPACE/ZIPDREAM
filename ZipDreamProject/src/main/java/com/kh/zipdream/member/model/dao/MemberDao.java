package com.kh.zipdream.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.mail.model.vo.MailAuth;
import com.kh.zipdream.member.model.vo.Member;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member loginMember(Member inputMember) {

		return sqlSession.selectOne("member-mapper.loginMember", inputMember);
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
		System.out.println("ss"+inputMember);
		return sqlSession.insert("member-mapper.insertMember", inputMember);
	}
}

