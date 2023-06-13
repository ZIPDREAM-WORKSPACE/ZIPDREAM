package com.kh.zipdream.notice.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.zipdream.admin.model.vo.Report;
import com.kh.zipdream.notice.model.service.NoticeService;
import com.kh.zipdream.notice.model.vo.Notice;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	
	@GetMapping("/notice")
	public String moveNoticeController(){
		return "notice/notice_header";
	}
	
	@GetMapping("/manage")
	public String moveManageController(){
		return "notice/manage";
	}
	
	@GetMapping("/interest")
	public String moveInterestController(){
		return "notice/interest";
	}
	

	
	@ResponseBody
	@GetMapping("/deleteSaleNotice")
	public int deleteSaleNotice(HttpSession session, Model model,
			@RequestParam(value="hu", required=false) String hu,
			@RequestParam(value="uno", required=false) int uno
			){
		Notice notice = new Notice();
		notice.setNoticeUrl(hu);
		notice.setRefUno(uno);
		
		int result = noticeService.deleteSaleNotice(notice);
		
		return result;
	}
	

}
