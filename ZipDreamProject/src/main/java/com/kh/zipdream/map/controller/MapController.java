package com.kh.zipdream.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/map")
public class MapController {
	
	@GetMapping("/main")
	public String moveMapController(){
		return "map/mapFirstPage";
	}
	
}
