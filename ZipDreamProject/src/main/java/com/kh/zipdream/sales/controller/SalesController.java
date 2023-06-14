package com.kh.zipdream.sales.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.sales.model.service.MySaleService;
import com.kh.zipdream.sales.model.vo.Calender;
import com.kh.zipdream.sales.model.vo.MySale;

@Controller 
@RequestMapping("/sales")
@SessionAttributes({"loginUser"})
public class SalesController {
	
	
	@Autowired
	private MySaleService mysaleService;
	
	@GetMapping("/schedule")
	public String moveSalesSchedule() {
		return "sales/salesSchedule";
	}
	
	@GetMapping("/guide")
	public String moveSalesGuide() {
		return "sales/salesGuide";
	}
	
	
	
	@GetMapping("/term")
	public String moveSalesTerm() {
		return "sales/salesTerm";
	}
	
	@GetMapping("/faq")
	public String moveSalesFaq() {
		return "sales/salesFaq";
	}
	
	@GetMapping("/rule")
	public String moveSaleRule() {
		return "sales/saleRule";
	}
	
	@ResponseBody
	@GetMapping("/apiData")
	@PostMapping("/apiData")
	@RequestMapping(value="/apiData",produces="application/json; charset=UTF-8")
	public String getAPTLttotPblancDetail(String month) {
		
		StringBuffer result = new StringBuffer();
		
		if(Integer.parseInt(month) < 10) {

			month = "0" + (Integer.parseInt(month)-1);

		}
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		
		String startDate = year + "-" + month + "-01"; 
		String endDate = year + "-" + month + "-30"; 

		 
		String apiUrl = "https://api.odcloud.kr/api/ApplyhomeInfoDetailSvc/v1/getAPTLttotPblancDetail?page=1&perPage=100&cond%5BRCRIT_PBLANC_DE%3A%3ALTE%5D=";

//		2023-05-31&cond%5BRCRIT_PBLANC_DE%3A%3AGTE%5D=2023-05-01&serviceKey=29yT0hzwPhkcH3v%2FVb1TblTy2MScYEvVCkJPq98BUa2T4VbppSCan3zrhXE8Gz%2BBagEwWPPiwfPMWcP0WSu9vg%3D%3D
		
		
		URL url;
		try {
			url = new URL(apiUrl+endDate+"&cond%5BRCRIT_PBLANC_DE%3A%3AGTE%5D="+startDate+"&serviceKey=29yT0hzwPhkcH3v%2FVb1TblTy2MScYEvVCkJPq98BUa2T4VbppSCan3zrhXE8Gz%2BBagEwWPPiwfPMWcP0WSu9vg%3D%3D");
			
			
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			urlconnection.setRequestProperty("Content-Type", "application/json; utf-8"); //post body json으로 던지기 위함
			urlconnection.setRequestProperty("Accept", "application/json");
			
			BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
			
			String returnLine;
			
			while((returnLine = br.readLine()) != null) {
				result.append(returnLine);
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result.toString();

	}
	
	

	@ResponseBody
	@GetMapping("/houseInfo")
	@PostMapping("/houseInfo")
	@RequestMapping(value="/houseInfo",produces="application/json; charset=UTF-8")
	public String getAPTLttotPblancMdl(String houseCode) {
		
		StringBuffer result = new StringBuffer();
		
		String apiUrl = "https://api.odcloud.kr/api/ApplyhomeInfoDetailSvc/v1/getAPTLttotPblancMdl?page=1&perPage=10000&cond%5BHOUSE_MANAGE_NO%3A%3AEQ%5D=";
		//이건 내 서비스인증키
		String serviceKey = "29yT0hzwPhkcH3v%2FVb1TblTy2MScYEvVCkJPq98BUa2T4VbppSCan3zrhXE8Gz%2BBagEwWPPiwfPMWcP0WSu9vg%3D%3D";

		URL url;
		try {
			url = new URL(apiUrl+houseCode+"&serviceKey="+serviceKey);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			urlconnection.setRequestProperty("Content-Type", "application/json; utf-8"); //post body json으로 던지기 위함
			urlconnection.setRequestProperty("Accept", "application/json");
			
			BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
			
			String returnLine;
			
			while((returnLine = br.readLine()) != null) {
				result.append(returnLine);
				/* System.out.println(br.readLine()); */
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result.toString();
	}
	
	@ResponseBody
	@PostMapping("/mySaleHouse")
	public String mySaleHouse(MySale ms) {
		int result = mysaleService.insertMysaleHouse(ms);
		
		if(result>0) {
			return "성공";
			
		}else{
			return "실패";
		}
		
		
	}
	
	@ResponseBody
	@GetMapping("/selectMySale")
	public List<Integer> selectMySale(int userNo, Model model) {
		
		List<Integer> mysaleList = mysaleService.selectMySale(userNo);
		model.addAttribute("mysaleList", mysaleList);
		
		/* System.out.println(mysaleList); */
		return mysaleList;
	}
	
	@ResponseBody
	@GetMapping("/deletemySaleHouse")
	public String deletemySaleHouse(MySale ms) {
		
		int result = mysaleService.deleteMysaleHouse(ms);
		
		if(result>0) {
			return "성공";
			
		}else{
			return "실패";
		}
		
	}
	
	@GetMapping("/calender")
	public String moveSalesCalender(Model model) {
		
		ArrayList<Calender> calenderList = mysaleService.selectCalender();
		model.addAttribute("calenderList", calenderList);
		
		/* System.out.println(calenderList); */
		
		return "sales/salesCalender";
	}

	
	@ResponseBody
	@GetMapping("/select")
	public ArrayList<Calender> selectinfoList(String calenderStart){
		
		ArrayList<Calender> selectinfoList = mysaleService.selectinfoList(calenderStart);
		
		return selectinfoList;
	}
	
	


}
