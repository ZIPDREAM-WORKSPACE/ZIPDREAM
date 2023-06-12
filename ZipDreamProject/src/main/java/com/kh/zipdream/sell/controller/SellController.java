package com.kh.zipdream.sell.controller;

import java.io.BufferedReader; 
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;  
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.zipdream.sell.model.service.SellService;
import com.kh.zipdream.sell.model.vo.SellDetail;
import com.kh.zipdream.sell.model.vo.SellDetailApi;
  
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
	@ResponseBody
	public String sellInsert(SellDetail sd, HttpServletRequest request, HttpSession session,
							 @RequestParam(value="imges", required=false ) List<MultipartFile> imgList) {
		
		String webPath = "resources/sellupfiles/";
		String serverFolderPath = session.getServletContext().getRealPath(webPath);
		
		int result =0;
		
			try {
				result = sellService.sellInsert(sd, webPath, serverFolderPath,imgList);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("업로드 에러");
			}
		
		if(result >0) {
			System.out.println("업로드 성공");
			return "redirect:../agent/agentRegistrationList";
		}else {
			System.out.println("업로드 실패");
			return "main/main";
		}
	}
	
	//sell_detail페이지 이동
	@PostMapping("/detailapi")	
	public String sellDetailApi(Model model, SellDetailApi sda){
		
		
		model.addAttribute("sda", sda);
		String address =sda.getSellAddress();
		System.out.println(address);
		String kaptAddress = sda.getSellAddress().substring(0,9)+sda.getSellAddress().substring(13);
		String kaptName = sda.getSellName().substring(0,4);
		System.out.println(kaptName);
		
		System.out.println("주소 : " + kaptAddress);
		
		if(kaptAddress != null) {
			List<SellDetailApi> list = sellService.selectApiList(kaptAddress);
		}
		
		System.out.println("sd:"+ sda);
		
		return "sell/sellDetailApi";
	}
	
	
	@GetMapping("/detail/{sellNo}")	
	public String sellDetail(Model model, @PathVariable(value="sellNo") int sellNo){

		SellDetail detail = sellService.sellDetail(sellNo);
		model.addAttribute("sd", detail);
		return "sell/sellDetail";
	}
	
	@GetMapping("/sellList")
	@ResponseBody
	public String sellList(Model model) {
		
		List<SellDetail> sdList = sellService.selectSellAllList();
		
		model.addAttribute("sdList", sdList);
		System.out.println("sdL:"+sdList);
		return new Gson().toJson(sdList);
	}
	


		
}
