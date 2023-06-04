package com.kh.zipdream.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.zipdream.admin.model.service.AdminService;
import com.kh.zipdream.admin.model.vo.NoticeBoard;
import com.kh.zipdream.admin.model.vo.Report;
import com.kh.zipdream.chat.model.service.ChatService;
import com.kh.zipdream.chat.model.vo.ChatMessage;
import com.kh.zipdream.chat.model.vo.ChatRoomJoin;
import com.kh.zipdream.member.model.service.MemberService;
import com.kh.zipdream.member.model.vo.Member;

@Controller
@SessionAttributes({"loginUser", "chatRoomNo"})
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ChatService chatService;
	
	@GetMapping("/main")
	public String main(Model model) {
		
		Map<String, Object> countNumbers = new HashMap<String, Object>();
		
		countNumbers.put("licenseUserCount", service.countLicenseUser());
		countNumbers.put("userCount", service.countUser());
		countNumbers.put("objectCount", service.countObject());
		countNumbers.put("reportCount", service.countReport(1));
		countNumbers.put("eventCount", service.countEvent());
		countNumbers.put("chattingCount", service.countChattingRoom());
		
		model.addAttribute("countNumbers",countNumbers);
		model.addAttribute("applyList",service.selectApplyListLimit5());
		model.addAttribute("reportList",service.selectReportList(1));
		return "admin/adminMain";
	}
	
	@GetMapping("/notice")
	public String notice(Model model,
						 @RequestParam(value="cpage", required=false, defaultValue="1") int cp
						 ) {
		Map<String, Object> map = new HashMap<String, Object>();
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
	
	@ResponseBody
	@GetMapping("/noticeList")
	public Map<String, Object> notice(Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		service.selectNoticeBoardList(map);
		return map;
	}
	
	@GetMapping("/user")
	public String user(Model model,
					   @RequestParam(value="cpage", required=false, defaultValue="1") int cp,
					   @RequestParam(value="type", required=false, defaultValue="1") int type,
					   @RequestParam Map<String, Object> paramMap) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(paramMap.get("condition") == null) {
			service.selectUserList(cp,type,map);
		}else {
			paramMap.put("cp", cp);
			paramMap.put("type", type);
			service.selectUserSearch(paramMap,map);
		}
		model.addAttribute("userList",map);
		model.addAttribute("type",type);
		
		return "admin/adminUser";
	}
	
	@GetMapping("/getReportList")
	@ResponseBody
	public JSONObject getReportList(int userNo, int cPage, int type) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("userNo", userNo);
		paramMap.put("type", type);
		JSONObject result = service.getReportList(cPage, paramMap);
		
		return result;
	}
	
	@GetMapping("/changeMemberStatus")
	public String changeMemberStatus(int userNo,String status) {
		Member m = new Member();
		m.setUserNo(userNo);
		m.setStatus(status.equals("Y")?"N":"Y");
		System.out.println(m.getStatus());
		service.updateMemberStatus(m);
		
		return "redirect:/admin/user";
	}
	
	@GetMapping("/report")
	public String report(Model model,
						@RequestParam(value="cpage", required=false, defaultValue="1") int cp
						 ) {
		Map<String, Object> map = new HashMap<String, Object>();
		service.selectReportList(2,cp,map);
		
		model.addAttribute("reportList",map);
		return "admin/adminReport";
	}
	
	@GetMapping("/report/detail")
	public String reportDetail(Model model,
							   @RequestParam(value="reportNo", required=false, defaultValue="0") int reportNo,
							   @RequestParam(value="cpage", required=false, defaultValue="1") int cp) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		Report report = service.selectReport(reportNo); 
		
		model.addAttribute("report", report);		
		model.addAttribute("rUser", memberService.selectMember(report.getRefRuno()));
		model.addAttribute("tUser", memberService.selectMember(report.getRefTuno()));
		
		paramMap.put("userNo", report.getRefTuno());
		paramMap.put("type", 2);
		service.getReportArrayList(cp, paramMap, map);
		
		model.addAttribute("reportList", map);
		
		return "admin/adminReportDetail";
	}
	
	@GetMapping("/chat")
	public String chat(Model model,
						 @RequestParam(value="cpage", required=false, defaultValue="1") int cp
						 ) {
		Map<String, Object> map = new HashMap<String, Object>();
		service.selectChatRoomList(cp,map);
		model.addAttribute("selectChatRoomList",map);
		return "admin/adminChat";
	}
	
	@GetMapping("/chat/room/{chatRoomNo}")
	public  String selectChatMessage(
				@ModelAttribute("loginUser") Member loginUser,
				// sessionScope에 있는 loginUser를 넣어준다
				// 단, SessionAttribute로 등록이 되어 있는 경우 
				Model model,
				ChatRoomJoin join,
				@PathVariable("chatRoomNo") int chatRoomNo,
				RedirectAttributes ra
			) {
		join.setRefUno(loginUser.getUserNo());
		join.setChatRoomNo(chatRoomNo);
		model.addAttribute("chatRoomNo",chatRoomNo);
		chatService.joinChatRoomUser(join);
		List<ChatMessage> list = chatService.selectChatMessage(join);
		
		if(list !=null) {
			model.addAttribute("list",list);
			return "admin/adminChatDetail";
		}else {
			ra.addFlashAttribute("alertMsg","채팅방이 존재하지 않습니다.");
			return  "admin/chat";
		}
	}
	
}