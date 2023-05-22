package com.kh.zipdream.map.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.kh.zipdream.map.model.service.MapService;

@Controller
@RequestMapping("/map")
public class MapController {
	
	private MapService mapService;
	
	@Autowired
	public MapController(MapService mapService) {
		this.mapService = mapService;
	}
	
	public MapController() {
		
	}
	
	@GetMapping("/main")
	public String moveMapController(){
		return "map/mapFirstPage";
	}
	
	@GetMapping("/jqAutoSearch")
	public String autoSearch(String keyword) {
		
		ArrayList<??> list = mapService.selectKeywordList(keyword);
		
		
		return new Gson().toJson(list);
	}
	
}
