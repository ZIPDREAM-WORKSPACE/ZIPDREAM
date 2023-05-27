package com.kh.zipdream.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.member.model.vo.Member;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member loginMember(Member inputMember) {

		return sqlSession.selectOne("member-mapper.loginMember", inputMember);
	}

//	public int insertMember(Member inputMember) {
//
//		return sqlSession.insert("memberMapper.insertMember", inputMember);
//	}
}

