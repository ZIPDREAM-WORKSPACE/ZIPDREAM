package com.kh.zipdream.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.zipdream.admin.model.service.AdminService;
import com.kh.zipdream.admin.model.vo.NoticeBoard;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping("/main")
	public String main(Model model) {
		
		Map<String, Object> countNumbers = new HashMap<String, Object>();
		
		countNumbers.put("licenseUserCount", service.countLicenseUser());
		countNumbers.put("userCount", service.countUser());
		countNumbers.put("objectCount", service.countObject());
		countNumbers.put("reportCount", service.countReport());
		countNumbers.put("eventCount", service.countEvent());
		countNumbers.put("chattingCount", service.countChattingRoom());
		
		model.addAttribute("countNumbers",countNumbers);
		model.addAttribute("applyList",service.selectApplyListLimit5());
		return "admin/adminMain";
	}
	
	@GetMapping("/notice")
	public String notice(Model model,
						 @RequestParam(value="cpage", required=false, defaultValue="1") int cp
						 ) {
		Map<String, Object> map = new HashMap();
		service.selectNoticeBoardList(cp,map);
		model.addAttribute("noticeBoardList",map);
		return "admin/adminNotice";
	}
	
	@GetMapping("/notice/enrollForm")
	public String noticeEnrollForm() {
		return "admin/adminNoticeEnrollForm";
	}
	
	@PostMapping("/notice/enroll")
	public String noticeEnroll(NoticeBoard nb) {
		
		if(nb.getNoticeBoardNo() == 0) {
			int result = service.insertNoticeBoard(nb);
		}else {
			int result = service.updateNoticeBoard(nb);
		}
		
		return "redirect:/admin/notice";
	}
	
	@GetMapping("/notice/detail")
	public String noticeDetail(Model model,
							   @RequestParam(value="boardNo", required=false, defaultValue="0") int boardNo) {
		
		model.addAttribute("noticeBoard",service.selectNoticeBoard(boardNo));
		
		return "admin/adminNoticeDetail";
	}
	
	@GetMapping("/notice/delete")
	public String noticeDelte(@RequestParam(value="boardNo", required=false, defaultValue="0") int boardNo) {
		
		service.deleteNoticeBoard(boardNo);
		
		return "redirect:/admin/notice";
	}
}