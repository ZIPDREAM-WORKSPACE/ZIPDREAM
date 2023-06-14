package com.kh.zipdream.notice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.zipdream.member.model.vo.Member;
import com.kh.zipdream.notice.model.service.NoticeService;
import com.kh.zipdream.notice.model.vo.Notice;

@Controller
@RequestMapping("/notice")
@SessionAttributes({"loginUser"})
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	
	@GetMapping("/notice")
	public String moveNoticeController(){
		return "notice/notice_header";
	}
	
	@GetMapping("/manage")
	public String moveManageController(Model model, @ModelAttribute("loginUser") Member loginUser){
		int refUno = loginUser.getUserNo();
		List<Notice> list = noticeService.selectManageList(refUno);
		if(list!=null) {
			model.addAttribute("list",list);
		}
		return "notice/manage";
	}
	
	@GetMapping("/interest")
	public String moveInterestController(Model model, @ModelAttribute("loginUser") Member loginUser){
		int refUno = loginUser.getUserNo();
		List<Notice> list = noticeService.selectInterestList(refUno);
		if(list!=null) {
			model.addAttribute("list",list);
		}
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
