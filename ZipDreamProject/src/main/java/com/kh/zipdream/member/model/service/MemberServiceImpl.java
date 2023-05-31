package com.kh.zipdream.member.model.service;

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

	public Member selectMember(int userNo) {
		return memberDao.selectMember(userNo);
	}
//	@Override
//	public int insertMember(Member inputMember) {
//
//		int result = memberDao.insertMember(inputMember);
//
//		return result;
//	}
}

	
	
	
	
	

