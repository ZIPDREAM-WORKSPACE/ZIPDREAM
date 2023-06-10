package com.kh.zipdream.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zipdream.attachment.model.vo.Attachment;
import com.kh.zipdream.mail.model.vo.MailAuth;
import com.kh.zipdream.member.model.dao.MemberDao;
import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.sell.model.vo.SellDetail;
import com.kh.zipdream.utils.FileUtils;

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
	
	/*
	 * @Override public int insertMember(Member inputMember) {
	 * 
	 * int result = memberDao.insertbkMember(inputMember);
	 * System.out.println(inputMember); return result; }
	 */
	
	@Transactional(rollbackFor = {Exception.class})
	public int insertbkMember(Member m , String webPath, String serverFolderPath, List<MultipartFile> imgList) throws Exception {
	
		int userNo = memberDao.insertbkMember(m);
		
		if(userNo > 0 && imgList != null) {
			List<Attachment> bkImgList = new ArrayList(); //db에 등록한 데이터를 모아놓음
			List<String> renameList = new ArrayList(); 		//변경된 파일명을 저장할 리스트
			
			
			//list에 담겨있는 파일정보 중 실제로 업로드된 파일만 분류하기
			for(int i = 0; i<imgList.size(); i++) {
				
				if(imgList.get(i).getSize()>0) {
					String changeName = FileUtils.saveFile(imgList.get(i), serverFolderPath);
					renameList.add(changeName);
					
					Attachment at = new Attachment();
					at.setRefUno(userNo);
					at.setOriginFile(imgList.get(i).getOriginalFilename());
					at.setChangeName(changeName);
					at.setFilePath(webPath);
					at.setFileLevel(i);
					
					bkImgList.add(at);
					System.out.println(at);
				}
			}
			
			if(!bkImgList.isEmpty()) {//등록한 이미지가 있음
				int result = memberDao.bkInsertImg(bkImgList);
				
				if(result == bkImgList.size()) {
					System.out.println("사진저장 완료");
				}else{
					System.out.println("사진저장실패");
				}
			}
		}
		return userNo;
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

	public Member selectMember(int userNo) {
		return memberDao.selectMember(userNo);
	}
	

	
	@Override
    public Member searchId(Map<String, String> map) {
		Member result=memberDao.searchId(map);
        return result;
    }

	
	 @Override
	    public int emailCheck(String id) {
	        int result=memberDao.emailCheck(id);
	        
	        return result;
	    }

	 public int deleteMember(int userNo) {
		 return memberDao.deleteMember(userNo);
	 }
}

	
	
	
	
	

