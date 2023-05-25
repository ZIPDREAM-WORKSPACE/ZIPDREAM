package com.kh.zipdream.map.model.vo;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
@CrossOrigin(originPatterns = "http://localhost:8006")
@Component
public class getXmlCode {

   public static String getXmlCodeToAjax(int code) {
      Map<String, Object> nodeMapData = new HashMap<String, Object>();
              try {
        
                  String openApiUrl = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?serviceKey=waPCFjtcKyjDOnXs6Bn4GUGOASC7K5kMpKiyIeuSvEx6xq9M6UV3cGxdX5NBKna%2Fe5nKMWQARaIrhPKkt%2BiGKw%3D%3D&pageNo=1&numOfRows=10&LAWD_CD="+code+"&DEAL_YMD=201512";
                  //OpenAPI URL 정보 읽기
                  URL obj = new URL(openApiUrl);
                  HttpURLConnection con = (HttpURLConnection)obj.openConnection();
                  con.setDoOutput(true);
                  con.setRequestProperty("Accept", "application/json");
                  con.setRequestMethod("GET");
                  //받아온 XML문서 파싱 => document인스턴스에 저장
                  DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
                  DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
                  Document document = (Document) docBuilder.parse(new InputSource(con.getInputStream()));
                  //Dom Tree를 XML문서의 구조대로 완성
                  document.getDocumentElement().normalize();
                  //HIT Tag 정보들을  검색
                  Node firstNode = document.getElementsByTagName("HIT").item(0);
                  NodeList childNodeList = firstNode.getChildNodes();
                  nodeMapData = getNodeList(childNodeList);
                  System.out.println(nodeMapData.toString());
              } catch (Exception e){
                  e.printStackTrace();
              }
              return nodeMapData.toString();
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

      
   
}