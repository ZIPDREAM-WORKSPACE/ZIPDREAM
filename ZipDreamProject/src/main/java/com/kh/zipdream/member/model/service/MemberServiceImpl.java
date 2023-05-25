package com.kh.zipdream.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zipdream.member.model.dao.MemberDao;
import com.kh.zipdream.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member loginMember(Member inputMember) {
		
		Member loginUser = memberDao.loginMember(inputMember);
		
		return loginUser;
	}
	
	@Override
	public int insertMember(Member inputMember) {
		return memberDao.insertMember(inputMember);
	}
	
	@Override	
	public ArrayList<Member> selectAll(){
		return memberDao.selectAll();
	}

	/*
	 * @Override public void updateMemberChangePwd() {
	 * memberDao.updateMemberChangePwd(); }
	 */
	 
	
	
	
	
	
}
