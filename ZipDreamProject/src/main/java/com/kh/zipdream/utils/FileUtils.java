package com.kh.zipdream.utils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class FileUtils {
	
	//변경된 이름을 돌려주면서(반환시켜주면서) 원본파일을 변경된 파일이름으로 서버에 저장시키는 메소드
	static public String saveFile(MultipartFile upfile, String savePath) throws IllegalStateException, IOException {
		
		String originFile = upfile.getOriginalFilename(); //전달한 파일명이 user.jpg -> "user.jpg"문자열로 얻어옴
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int random = (int)(Math.random()*90000 + 10000);
		
		String ext = originFile.substring(originFile.lastIndexOf("."));
		
		String changeName = currentTime+random+ext;
		
		upfile.transferTo(new File(savePath+changeName));
		
		
		return changeName;
	}
	
}
