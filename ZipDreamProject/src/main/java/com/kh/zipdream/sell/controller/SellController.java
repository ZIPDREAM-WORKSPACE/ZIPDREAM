package com.kh.zipdream.sell.controller;

import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

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
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
		String url ="";
		if(result >0) {
			System.out.println("업로드 성공");
			url="redirect:/../agent/RegistrationList";
			return url;
		}else {
			System.out.println("업로드 실패");
			return "main/main";
		}
	}
	
	//sell_detail페이지 이동
	@PostMapping("/detailapi")	
	public String sellDetailApi(Model model, SellDetailApi sda,SellDetailApi sda2){
		
		Map<String, String> map = new HashMap();
		
		String addressArr[] = sda.getSellAddress().split(" ");
		String kaptAddress = addressArr[0]+" "+addressArr[1]+" "+addressArr[3];
		String kaptName = sda.getSellName().substring(0,4);
		
		map.put("kaptAddress", kaptAddress);
		map.put("kaptName", kaptName);
		sda2 = sellService.detailApiSecond(map);
		
		model.addAttribute("sda2" , sda2);
		model.addAttribute("sda", sda);
		System.out.println("sd:"+ sda);
		System.out.println("sda2 : "+ sda2);
		
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
	
	@GetMapping("/sellList2")
	@ResponseBody
	public String sellList2(@RequestParam("sellNo") int sellNo, Model model) {
		
		List<SellDetail> sdList = sellService.selectSellList2(sellNo);
		
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
	
	
	@PostMapping("/report")
	@ResponseBody
	public int insertReport(Report report) {
		int result = 0;
		
		result = sellService.insertReport(report);
		
		return result;
	}
	
	@GetMapping(value="/addApi", produces="application/text; charset=UTF-8")
	@ResponseBody
	public String sellDetailAddApi(String kaptCode) {
		System.out.println("kaptCode : "+kaptCode);
		List<Map<String, Object>> apiList = new ArrayList<Map<String, Object>>();
		Map<String, Object> apiData = new HashMap<String, Object>();
		
		try {
			String url = "https://apis.data.go.kr/1613000/AptBasisInfoService1/getAphusDtlInfo?kaptCode="+kaptCode+"&ServiceKey=JUcWmPoEmZ5fqRuSCJQMJZVyqQnw6TosEAsAGq9QBxgACfB0IclbACz1nqClqgNZ8GynTRYruU9UCWuTD4YA2A%3D%3D";
			URL obj = new URL(url);
			HttpURLConnection conn = (HttpURLConnection)obj.openConnection();
			conn.setDoOutput(true);
			conn.setRequestProperty("CONTENT-TYPE", "text/xml");
			conn.setRequestMethod("GET");
			
			DocumentBuilderFactory documentBuildFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder = documentBuildFactory.newDocumentBuilder();
			
			Reader reader = new InputStreamReader(conn.getInputStream(), "UTF-8");
			Document document = (Document)documentBuilder.parse(new InputSource(reader));
			
			document.getDocumentElement().normalize();
			
			int length = document.getElementsByTagName("item").getLength();
			
			System.out.println("length : "+length);
			for(int i=0; i<length; i++) {
				Node babyNode = document.getElementsByTagName("item").item(i);
				NodeList babyNodeList = babyNode.getChildNodes();
				apiData = getNodeList(babyNodeList);
				getJsonStringFromMap(apiData);
				
				apiList.add(apiData);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		String listResult = getJsonStringFromList(apiList);
		return listResult;
		

	}
	
	public static Map<String, Object> getNodeList(NodeList nodeList){
		Map<String, Object> apiDataMap = new HashMap<>();
		for(int i =0; i<nodeList.getLength(); i++) {
			String tagName = nodeList.item(i).getNodeName();
			if(!"#text".equals(tagName)) {
				System.out.println("tagName = "+tagName);
				if(nodeList.item(i).getChildNodes().getLength()>1) {
					apiDataMap.put(tagName, getNodeList(nodeList.item(i).getChildNodes()));
				}else {
					apiDataMap.put(tagName, nodeList.item(i).getTextContent());
				}
			}
		}
		return apiDataMap;
	}
	
	public static String getJsonStringFromMap(Map<String, Object> map) {
		JSONObject json = new JSONObject();
		
		for(Map.Entry<String, Object> entry : map.entrySet()) {
			json.put(entry.getKey(), entry.getValue());
		}
		return json.toJSONString();
	}
	public static String getJsonStringFromList(List<Map<String, Object>> apilist) {
		JSONArray jsonArray = new JSONArray();
		for(Map<String, Object> map : apilist) {
			jsonArray.add(getJsonStringFromMap(map));
		}
		return jsonArray.toJSONString();
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
