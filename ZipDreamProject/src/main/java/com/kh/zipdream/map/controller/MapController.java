package com.kh.zipdream.map.controller;

import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.google.gson.Gson;
import com.kh.zipdream.map.model.service.MapService;
import com.kh.zipdream.map.model.vo.beopjeongdong;
@CrossOrigin(originPatterns = "http://localhost:8006")
@Controller
@RequestMapping("/map")
public class MapController {

   @Autowired
   private MapService mapService;
   
   @GetMapping("/main")
   public String moveMapController() {
      return "map/mapFirstPage";
   }
   
   @ResponseBody
   @PostMapping("/bjdCode")
   public int bjdCode(@RequestParam("detailAddrClob") String detailAddrClob,
                  Model model) {
      
      int bjdCode = mapService.selectBjbCode(detailAddrClob);
         
      model.addAttribute("bjdCode", bjdCode);
      System.out.println(bjdCode);
      return bjdCode;
   }
   
   @ResponseBody
   @PostMapping("/address")
   public String address(@RequestParam("adCode") String adCode,
                  Model model) {
      
      List<beopjeongdong> address = mapService.selectAddress(adCode);
         
      model.addAttribute("address", address);
      System.out.println(address);
      return new Gson().toJson(address);
   }
   
   @GetMapping(value="/getXmlCode", produces = "application/text; charset=UTF-8")
   @ResponseBody
   public String getXmlCodeToAjax(int code) {
	   		System.out.println("code:"+code);
	        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	   		Map<String, Object> nodeMapData = new HashMap<String, Object>();
	   	   
	   		try {
	   	        
                String openApiUrl = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?serviceKey=waPCFjtcKyjDOnXs6Bn4GUGOASC7K5kMpKiyIeuSvEx6xq9M6UV3cGxdX5NBKna%2Fe5nKMWQARaIrhPKkt%2BiGKw%3D%3D&pageNo=1&numOfRows=30&LAWD_CD="+code+"&DEAL_YMD=202304";
                //OWpenAPI URL 정보 읽기
                URL obj = new URL(openApiUrl);
                HttpURLConnection con = (HttpURLConnection)obj.openConnection();
                con.setDoOutput(true);
                con.setRequestProperty("CONTENT-TYPE","text/xml"); 
                con.setRequestMethod("GET");
                
                //받아온 XML문서 파싱 => document인스턴스에 저장
                DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
                DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
                // UTF-8 설정
                Reader reader = new InputStreamReader(con.getInputStream(),"UTF-8");
                Document document = (Document) docBuilder.parse(new InputSource(reader));
                //Dom Tree를 XML문서의 구조대로 완성
                document.getDocumentElement().normalize();
                //items Tag 정보들을  검색
                
                // items가지고와서 for문 돌리기 하나씩전달하기
                // items - item
                int length = document.getElementsByTagName("item").getLength();
				/*
				 * Node childNode; // item
				 * 
				 * 
				 */
                
                // 하나씩 돌린 item의 값을 뽑아서 전달하기
                System.out.println("node Length"+length);
                for(int i=0; i < length; i++) {
				  
                  Node childNode = document.getElementsByTagName("item").item(i);
                  NodeList childNodeList = childNode.getChildNodes();
              	  nodeMapData = getNodeList(childNodeList);
              	  getJsonStringFromMap(nodeMapData);
              	  
              	  list.add(nodeMapData);
              	
                }
                
            } catch (Exception e){
                e.printStackTrace();
            }
	   		
	   		String listResult = getJsonStringFromList(list);
	   		
            return listResult;
            
        }

	   public static Map<String,Object> getNodeList(NodeList nodeList){
	       Map<String, Object> dataMap = new HashMap<>();
	       for(int i = 0; i < nodeList.getLength(); i++){
	    	   String tagName = nodeList.item(i).getNodeName();
	           if(!"#text".equals(tagName)){
                   System.out.println("tagName = " + tagName);
	               if(nodeList.item(i).getChildNodes().getLength()>1){
	                   dataMap.put(tagName,getNodeList(nodeList.item(i).getChildNodes()));
	               }else{
	                  dataMap.put(tagName, nodeList.item(i).getTextContent());
	               }
	           }
	       }
	       return dataMap;
	   }

	   public static String getJsonStringFromMap(Map<String, Object> map) {

	        JSONObject json = new JSONObject();

	        for (Map.Entry<String, Object> entry : map.entrySet()) {
	            json.put(entry.getKey(), entry.getValue());
	        }

	        return json.toJSONString();
	    }
   
	   public static String getJsonStringFromList(List<Map<String, Object>> list) {

	        JSONArray jsonArray = new JSONArray();

	        for (Map<String, Object> map : list) {
	            jsonArray.add(getJsonStringFromMap(map));
	        }

	        return jsonArray.toJSONString();
	    }
}