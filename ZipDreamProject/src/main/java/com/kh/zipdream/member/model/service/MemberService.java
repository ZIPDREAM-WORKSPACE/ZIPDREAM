package com.kh.zipdream.member.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.zipdream.mail.model.vo.MailAuth;
import com.kh.zipdream.member.model.vo.Member;

public interface MemberService {
	
	
	public abstract Member loginMember(Member inputMember);
	

	public abstract int insertMember(Member inputMember);
	
	public abstract int insertbkMember(Member m, String webPath, String serverFolderPath,List<MultipartFile> imgList) throws Exception;
	
	public abstract int insertapply(int userNo);
	
	public void registMailAuth(MailAuth mailAuth) throws Exception;//부모창 mail 확인하기, 확인하기버튼 누르는 순간 인증키랑 mail 저장
	
	public void authKeyCompare(MailAuth mailAuth) throws Exception;
	
	public int isMailAuthed(String mail) ; // 부모창 다음버튼, is_auth=1이면 1리턴해서 인증되었다는걸 알림
	
	public Member selectMember(int userNo);
	
	public Member searchId(Map<String, String> map);
	
	public int searchPwd(Member m);
	
	public int updateMember(Map<String, String> map);

	public int emailCheck(String id);

}

