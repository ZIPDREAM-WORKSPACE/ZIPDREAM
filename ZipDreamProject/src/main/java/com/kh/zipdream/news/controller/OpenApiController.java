package com.kh.zipdream.news.controller;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.zipdream.news.dao.NaverBlogSearchApi;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/naver")
public class OpenApiController {
	@Autowired
	NaverBlogSearchApi  naver = new NaverBlogSearchApi();
	
	@ResponseBody
	@GetMapping("/news")
	public JSONObject getPlace() throws Exception {
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(naver.search());
		JSONObject jsonObj = (JSONObject) obj;
		return jsonObj;
		
	}
}
