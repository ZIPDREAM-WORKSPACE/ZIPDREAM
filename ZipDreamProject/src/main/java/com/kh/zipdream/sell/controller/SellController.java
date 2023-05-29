package com.kh.zipdream.sell.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zipdream.sell.model.service.SellService;
import com.kh.zipdream.sell.model.vo.SellDetail;

@Controller
@RequestMapping("/sell")
public class SellController {
	
	@Autowired
	private SellService sellService;
	
	//sell입력 페이지이동
	@GetMapping("/insert")
	public String main() {
		return "sell/sellEnrollForm";
	}
	
	//sell입력
	@PostMapping("/sellInsert")
	public String sellInsert(SellDetail sd, HttpServletRequest request, HttpSession session,
							 @RequestParam(value="images", required=false) List<MultipartFile> imgList) {
		
		String webPath = "resources/sellupfiles";
		String serverFolderPath = session.getServletContext().getRealPath(webPath);
		
		int result =0;
		
		try {
			
			result = sellService.sellInsert(sd, webPath, serverFolderPath,imgList);
		}catch(Exception e) {
			System.out.println("업로드 에러");
		}
		
		if(result >0) {
			System.out.println("업로드 성공");
			return "main/main";
		}else {
			System.out.println("업로드 실패");
			return "main/main";
		}
	}
	
	
	
	
	
	
	
	
	
	
	//sell_detail페이지 이동
	@GetMapping("/detail")
	public String sellDetail() {
		return "sell/sellDetail";
	}
		
}
