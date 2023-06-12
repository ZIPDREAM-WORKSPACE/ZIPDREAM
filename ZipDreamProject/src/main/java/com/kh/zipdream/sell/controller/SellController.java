package com.kh.zipdream.sell.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.kh.zipdream.admin.model.vo.Report;
import com.kh.zipdream.member.model.service.MemberService;
import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.sell.model.service.SellService;
import com.kh.zipdream.sell.model.vo.Counsle;
import com.kh.zipdream.sell.model.vo.SellDetail;
import com.kh.zipdream.sell.model.vo.SellDetailApi;
 
@Controller
@RequestMapping("/sell")
public class SellController {
	
	@Autowired
	private SellService sellService;
	
	@Autowired
	private MemberService memberService;
	
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
		System.out.println("sd:"+ sda);
		
		return "sell/sellDetailApi";
	}
	
	@GetMapping("/detail/{sellNo}")	
	public String sellDetail(Model model, @PathVariable(value="sellNo") int sellNo){

		SellDetail detail = sellService.sellDetail(sellNo);
		Member seller = memberService.selectMember(detail.getRefUno());
		model.addAttribute("sd", detail);
		model.addAttribute("seller", seller);
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
	
	//상담신청
	/*
	 * @PostMapping("/sellApply")
	 * 
	 * @ResponseBody public int sellApply() { return result; }
	 */
	@PostMapping("/addApi/{sellSno}")
	@ResponseBody
	public void sellAddApi(int sidoCode, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String apiHtml = "http://apis.data.go.kr/1613000/AptListService2/getSidoAptList";
		String serviceKey = "JUcWmPoEmZ5fqRuSCJQMJZVyqQnw6TosEAsAGq9QBxgACfB0IclbACz1nqClqgNZ8GynTRYruU9UCWuTD4YA2A%3D%3D";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		
		parameter = parameter + "&" + "sidoCode="+sidoCode;
		
		apiHtml = apiHtml + serviceKey + parameter;
		URL url = new URL(apiHtml);
		
		System.out.println(apiHtml); 
		
		InputStream in = url.openStream();
		
		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();
		
		String mbos = bos1.toString("UTF-8");
		
		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.print(s);
		
		JSONObject json = new JSONObject();
		json.put("api", s);
		
	}
	
	@PostMapping("/report")
	@ResponseBody
	public int insertReport(Report report) {
		int result = 0;
		
		result = sellService.insertReport(report);
		
		return result;
	}
		
	@PostMapping("/counsle")
	@ResponseBody
	public int insertCounsle(Counsle counsle) {
		int result = 0;
		
		result = sellService.insertCounsle(counsle);
		
		return result;
	}
	
	@ResponseBody
	@GetMapping("/userselect")
	public int insertUserselect(@RequestParam(value="userNo") int userNo,
			@RequestParam(value="sellNo") int sellNo,
			@RequestParam(value="type") int type) {
		Map<String,Integer> map = new HashMap();
		
		map.put("userNo", userNo);
		map.put("sellNo", sellNo);
		
		int result = 0;
		
		if(type == 2) {
			result = sellService.insertUserSelect(map);
		}else {
			result = sellService.deleteUserSelect(map);
		}
		
		return result;
		
	}
}
