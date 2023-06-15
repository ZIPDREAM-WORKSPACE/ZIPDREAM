package com.kh.zipdream.sell.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.zipdream.sell.model.service.ReplyService;
import com.kh.zipdream.sell.model.vo.Reply;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	@PostMapping("/replyInsert")
	public int insertReply(Reply reply) {
		return replyService.insertReply(reply);
	}
	@PostMapping("/replyList")
	public String replyList(@RequestParam(value="detailBoardNo") int detailBoardNo, Model model) {
		System.out.println(detailBoardNo);
		List<Reply> rList = replyService.replyList(detailBoardNo);
		model.addAttribute("rList", rList);
		return new Gson().toJson(rList);
	}
	
	@PostMapping("/deleteReply")
	@ResponseBody
	public int deleteSell(Model model, int refRno, int replyRefUno) {
		Map<String, Object> map = new HashMap();
		map.put("refRno", refRno);
		map.put("replyRefUno",replyRefUno);
		
		model.addAttribute("map", map);
		return replyService.deleteReply(map);
	}
	

	


	
	
	
	
	
	
	
	
}
