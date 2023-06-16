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
import com.kh.zipdream.member.model.vo.userSelectList;
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

	@Transactional(rollbackFor = { Exception.class })
	public int insertbkMember(Member m, String webPath, String serverFolderPath, List<MultipartFile> imgList)
			throws Exception {

		int userNo = memberDao.insertbkMember(m);

		if (userNo > 0 && imgList != null) {
			List<Attachment> bkImgList = new ArrayList(); // db에 등록한 데이터를 모아놓음
			List<String> renameList = new ArrayList(); // 변경된 파일명을 저장할 리스트

			// list에 담겨있는 파일정보 중 실제로 업로드된 파일만 분류하기
			for (int i = 0; i < imgList.size(); i++) {

				if (imgList.get(i).getSize() > 0) {
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

			if (!bkImgList.isEmpty()) {// 등록한 이미지가 있음
				int result = memberDao.bkInsertImg(bkImgList);

				if (result == bkImgList.size()) {
					System.out.println("사진저장 완료");
				} else {
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
		MailAuth mailAuth1 = memberDao.getMailAuth(mailAuth.getMail());

		if (mailAuth1 == null) {
			memberDao.insertMailAuth(mailAuth);

		}else {
			memberDao.updateMailAuth(mailAuth);
		}
	}

	@Override
	public void authKeyCompare(MailAuth mailAuth) throws Exception, Exception {
		MailAuth vo = memberDao.getMailAuth(mailAuth.getMail()); // 왠만하면 null안나옴. 자식창에서 확인바로누르면.
		// vo는 DB에 있는 거, mailAuth는 자식창에서 입력한 값
		if (!vo.getAuthKey().equals(mailAuth.getAuthKey())) {
			throw new Exception();
			// 자식창에서 입력한 authKey가 다르면
		}
		if (vo.getAuthKey().equals(mailAuth.getAuthKey())) { // 인증번호 제대로 입력했으면
			int cnt = memberDao.completeAuth(mailAuth.getMail());
			if (cnt == 0)
				throw new Exception();
		}
	}

	@Override
	public int isMailAuthed(String mail) {
		MailAuth mailAuth = memberDao.getMailAuth(mail);
		if (mailAuth == null)
			return 0;
		return mailAuth.getIsAuth();
	}

	public Member selectMember(int userNo) {
		return memberDao.selectMember(userNo);
	}

	@Override
	public Member searchId(Map<String, String> map) {
		Member result = memberDao.searchId(map);
		return result;
	}

	@Override
	public int searchPwd(Member m) {
		int result = memberDao.searchPwd(m);

		return result;
	}

	@Override
	public int updateMember(Map<String, String> map) {
		return memberDao.updateMember(map);
	}

	@Override
	public int emailCheck(String id) {
		int result = memberDao.emailCheck(id);

		return result;
	}


	// 비밀번호 변경
	public int updateMemberPwd(Member m) {
		return memberDao.updateMemberPwd(m);
	}
	
	 public  List<userSelectList> myBookmarkList(int uno) {
		 return memberDao.myBookmarkList(uno);
	 }
	 
	@Transactional(rollbackFor = { Exception.class })
	public int updatebkImages(Map<String, String> map, List<MultipartFile> list, String webPath,
			String serverFolderPath) throws Exception {

		List<Attachment> bkImgList = new ArrayList();
		List<String> reNameList = new ArrayList();
		int result = 0;
		if (list != null) {


	
	 
	 
}



			for (int i = 0; i < list.size(); i++) {

				if (list.get(i).getSize() > 0) {
					// 변경된 파일명 renameList에 저장할예정.
					String changeName = FileUtils.saveFile(list.get(i), serverFolderPath);
					reNameList.add(changeName);

					// BoardImg객체를 생성해서 필드에 값을 세팅한후 boardImageList에 추가할예정
					Attachment bkImages = new Attachment();
					bkImages.setRefUno(Integer.parseInt(map.get("userNo"))); // 등록한 게시글 번호
					bkImages.setFileLevel(i); // 이미지 순서
					bkImages.setOriginFile(list.get(i).getOriginalFilename());// 원본파일명
					bkImages.setChangeName(changeName);

					bkImgList.add(bkImages);

					for (Attachment img : bkImgList) {
						result = memberDao.updatebkImages(img);
						// 결과값 1 -> 수정작업이 잘 이루어졌다 => 기존에 이미지가 있었다.
						// 결과값 0 -> 수정작업이 실패함 => 애초에 이미지가 없었다

						// 6) 결과값이 0 => update에는 실패했고, 실제로 db에는 올라가야할 데이터이기때문에 insert 시켜준다.

					}

				}

			}
		
		return result;
	}
	
	//중개사 사진 미리보기
	public List<Attachment> selectAttachmentList(int userNo) {
		return memberDao.selectAttachmentList(userNo);
	}
	
	
	
	
	
	
}
	
	
	
	

