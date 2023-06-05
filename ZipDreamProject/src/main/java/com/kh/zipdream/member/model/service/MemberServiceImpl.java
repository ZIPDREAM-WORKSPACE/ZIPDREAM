package com.kh.zipdream.member.model.service;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.kh.zipdream.mail.model.vo.MailAuth;
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

		int result = memberDao.insertMember(inputMember);

		return result;
	}
	
	@Override
	public int insertbkMember(Member inputMember) {

		int result = memberDao.insertbkMember(inputMember);
		System.out.println(inputMember);
		return result;
	}
	
	@Override
	public int insertapply(int userNo) {

		int result = memberDao.insertapply(userNo);

		return result;
	}
	
	
	
	
	
	 @Override
	 public void registMailAuth(MailAuth mailAuth) throws Exception {
	        MailAuth mailAuth1= memberDao.getMailAuth(mailAuth.getMail());
	        
	        if(mailAuth1==null)memberDao.insertMailAuth(mailAuth);
	        
	        else {
	        	memberDao.updateMailAuth(mailAuth);
	        }
	    }


	    @Override
	    public void authKeyCompare(MailAuth mailAuth) throws Exception, Exception {
	        MailAuth vo =memberDao.getMailAuth(mailAuth.getMail()); //왠만하면 null안나옴. 자식창에서 확인바로누르면.
	        //vo는 DB에 있는 거, mailAuth는 자식창에서 입력한 값
	        if(!vo.getAuthKey().equals(mailAuth.getAuthKey())) {
	            throw new Exception();
	            //자식창에서 입력한 authKey가 다르면
	        }
	        if(vo.getAuthKey().equals(mailAuth.getAuthKey())) {  //인증번호 제대로 입력했으면
	            int cnt=memberDao.completeAuth(mailAuth.getMail());
	            if(cnt==0) throw new Exception();
	        }
	    }

	    @Override
	    public int isMailAuthed(String mail) {
	        MailAuth mailAuth=memberDao.getMailAuth(mail);
	        if(mailAuth==null) return 0;
	        return mailAuth.getIsAuth();
	    }
}

	
	
	
	
	

