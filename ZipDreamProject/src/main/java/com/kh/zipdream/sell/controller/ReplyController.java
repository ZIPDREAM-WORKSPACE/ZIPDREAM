package com.kh.zipdream.sell.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
	
	
	
	
	
	
	
}
