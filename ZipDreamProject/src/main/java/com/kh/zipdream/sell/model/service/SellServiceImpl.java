package com.kh.zipdream.sell.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zipdream.attachment.model.vo.Attachment;
import com.kh.zipdream.sell.model.dao.SellDao;
import com.kh.zipdream.sell.model.vo.SellDetail;
import com.kh.zipdream.utils.FileUtils;

@Service
public class SellServiceImpl implements SellService {

	@Autowired
	private SellDao sellDao;
	
	@Transactional(rollbackFor = {Exception.class})
	public int sellInsert(SellDetail sd, String webPath, String serverFolderPath, List<MultipartFile> imgList) throws Exception {
		
		int sellNo = sellDao.sellInsert(sd);
		
		if(sellNo > 0 && imgList != null) {
			List<Attachment> sellImgList = new ArrayList(); //db에 등록한 데이터를 모아놓음
			List<String> renameList = new ArrayList(); 		//변경된 파일명을 저장할 리스트
			
			
			//list에 담겨있는 파일정보 중 실제로 업로드된 파일만 분류하기
			for(int i = 0; i<imgList.size(); i++) {
				
				if(imgList.get(i).getSize()>0) {
					String changeName = FileUtils.saveFile(imgList.get(i), serverFolderPath);
					renameList.add(changeName);
					
					Attachment at = new Attachment();
					at.setRefSno(sellNo);
					at.setOriginFile(imgList.get(i).getOriginalFilename());
					at.setChangeName(changeName);
					at.setFilePath(serverFolderPath);
					at.setFileLevel(i);
					
					sellImgList.add(at);
					
				}
			}
			
			if(!sellImgList.isEmpty()) {//등록한 이미지가 있음
				int result = sellDao.sellInsertImg(sellImgList);
				
				if(result == sellImgList.size()) {
					System.out.println("사진저장 완료");
				}else{
					System.out.println("사진저장실패");
				}
			}
		}
		return sellNo;
	}
	
	public void selectSellList(Map<String, Object> map, int refUno) {
		
		ArrayList<SellDetail> list = sellDao.selectSellList(refUno);
		
		map.put("list", list);
		
	}
	
	public SellDetail sellDetail(int sellNo) {
		
		return sellDao.sellDetail(sellNo);
	}
	


}
