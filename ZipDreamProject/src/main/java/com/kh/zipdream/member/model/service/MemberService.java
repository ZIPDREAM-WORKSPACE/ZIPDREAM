package com.kh.zipdream.member.model.service;

import com.kh.zipdream.member.model.vo.Member;

public interface MemberService {
	
	public abstract Member loginMember(Member inputMember);
	
	public abstract int insertMember(Member inputMember);
}

