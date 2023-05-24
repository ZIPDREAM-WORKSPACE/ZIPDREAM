package com.kh.zipdream.map.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.kh.zipdream.map.model.service.MapService;

@Controller
@RequestMapping("/map")
public class MapController {

	@Autowired
	private MapService mapService;
	 
	@GetMapping("/main")
	public String moveMapController() {
		return "map/mapFirstPage";
	}

	@PostMapping("/bjdCode")
	public String bjdCode(@RequestParam("detailAddrClob") String detailAddrClob,
						Model model) {
		
		int bjdCode = mapService.selectBjbCode(detailAddrClob);
			
		model.addAttribute("bjdCode", bjdCode);

		return "map/mapFirstPage";
	}
	
}
