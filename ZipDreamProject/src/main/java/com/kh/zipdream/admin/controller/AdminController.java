package com.kh.zipdream.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.zipdream.admin.model.service.AdminService;
import com.kh.zipdream.admin.model.vo.Coupon;
import com.kh.zipdream.admin.model.vo.NoticeBoard;
import com.kh.zipdream.admin.model.vo.Report;
import com.kh.zipdream.attachment.model.vo.Attachment;
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
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@GetMapping("/main")
	public String main(Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		service.selectNoticeBoardList(1,10,map);
		
		Map<String, Object> countNumbers = new HashMap<String, Object>();
		
		countNumbers.put("licenseUserCount", service.countLicenseUser());
		countNumbers.put("userCount", service.countUser());
		countNumbers.put("objectCount", service.countObject());
		countNumbers.put("reportCount", service.countReport(1));
		countNumbers.put("eventCount", service.countEvent());
		countNumbers.put("chattingCount", service.countChattingRoom());
		
		model.addAttribute("countNumbers",countNumbers);
		model.addAttribute("applyList",service.selectApplyListLimit5(1));
		model.addAttribute("reportList",service.selectReportList(1));
		model.addAttribute("noticeBoardList",map);
		return "admin/adminMain";
	}
	
	@GetMapping("/notice")
	public String notice(Model model,
						 @RequestParam(value="cpage", required=false, defaultValue="1") int cp
						 ) {
		Map<String, Object> map = new HashMap<String, Object>();
		service.selectNoticeBoardList(cp,10,map);
		model.addAttribute("noticeBoardList",map);
		return "admin/adminNotice";
	}
	

	@GetMapping("/notice/enrollForm")
	public String noticeEnrollForm() {
		return "admin/adminNoticeEnrollForm";
	}
	
	@PostMapping("/notice/enroll")
	public String noticeEnroll(NoticeBoard nb, RedirectAttributes ra) {
		
		int result = 0;
		if(nb.getNoticeBoardNo() == 0) {
			result = service.insertNoticeBoard(nb);
		}else {
			result = service.updateNoticeBoard(nb);
		}
		
		Map<String,String> alertMsg = new HashMap<String,String>();
		if(result >= 1 ) {
			alertMsg.put("message", "공지 등록 성공");
			alertMsg.put("type", "success");
		}else{
			alertMsg.put("message", "공지 등록 실패");
			alertMsg.put("type", "error");
		}
		
		ra.addFlashAttribute("alertMsg",alertMsg);
		
		return "redirect:/admin/notice";
	}
	
	@GetMapping("/notice/detail")
	public String noticeDetail(Model model,
							   @RequestParam(value="boardNo", required=false, defaultValue="0") int boardNo) {
		
		model.addAttribute("noticeBoard",service.selectNoticeBoard(boardNo));
		
		return "admin/adminNoticeDetail";
	}
	
	@GetMapping("/notice/delete")
	public String noticeDelte(@RequestParam(value="boardNo", required=false, defaultValue="0") int boardNo,
							  RedirectAttributes ra) {
		
		int result = service.deleteNoticeBoard(boardNo);
		
		Map<String,String> alertMsg = new HashMap<String,String>();
		if(result >= 1 ) {
			alertMsg.put("message", "공지 삭제 성공");
			alertMsg.put("type", "success");
		}else{
			alertMsg.put("message", "공지 삭제 실패");
			alertMsg.put("type", "error");
		}
		
		ra.addFlashAttribute("alertMsg",alertMsg);
		
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
	
	@GetMapping("/getCouponList")
	@ResponseBody
	public JSONObject getCouponList(int userNo, int cPage) {
		
		JSONObject result = service.getCouponList(cPage, userNo);
		
		return result;
	}
	
	@GetMapping("/changeMemberStatus")
	public String changeMemberStatus(int userNo,String status,RedirectAttributes ra) {
		Member m = new Member();
		m.setUserNo(userNo);
		m.setStatus(status.equals("Y")?"N":"Y");
		int result = service.updateMemberStatus(m);
		
		Map<String,String> alertMsg = new HashMap<String,String>();
		if(result >= 1 && status.equals("Y")) {
			alertMsg.put("message", "회원 비활성화 성공");
			alertMsg.put("type", "success");
		}else if(result >= 1 && status.equals("N")){
			alertMsg.put("message", "회원 활성화 성공");
			alertMsg.put("type", "success");
		}
		
		ra.addFlashAttribute("alertMsg",alertMsg);
		
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
	
	@GetMapping("/report/update")
	public String reportUpdate(Model model,Report report,
								RedirectAttributes ra) {
		
		int result = service.updateReportResult(report);
		
		Map<String,String> alertMsg = new HashMap<String,String>();
		if(result >= 1) {
			alertMsg.put("message", "신고 처리 성공");
			alertMsg.put("type", "success");
		}else {
			alertMsg.put("message", "신고 처리 실패");
			alertMsg.put("type", "error");
		}
		
		ra.addFlashAttribute("alertMsg",alertMsg);
		
		return "redirect:/admin/report";
	}
	
	@GetMapping("/chat")
	public String chat(Model model,
						 @RequestParam(value="cpage", required=false, defaultValue="1") int cp
						
						 ) {
		Map<String, Object> map = new HashMap<String, Object>();
		service.selectChatRoomList(cp,map);
		List<Integer> countList = chatService.countChatRoomMemberList();
		model.addAttribute("selectChatRoomList",map);
		model.addAttribute("countList",countList);
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
				RedirectAttributes ra) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("cno", join.getChatRoomNo());
		map.put("uno", loginUser.getUserNo());
		
		int result = chatService.selectChatRoomjoin(map);
		
	if(result<1) {
			
			join.setRefUno(loginUser.getUserNo());
			join.setChatRoomNo(chatRoomNo);
			chatService.joinChatRoomUser(join);
		}
		
		/*
		 * join.setRefUno(loginUser.getUserNo()); join.setChatRoomNo(chatRoomNo);
		 * chatService.joinChatRoomUser(join);
		 */
		model.addAttribute("chatRoomNo",chatRoomNo);
		List<ChatMessage> list = chatService.selectChatMessage(join);
		List<Member> mlist = chatService.selectChatMember(chatRoomNo);
		if(list !=null) {
			model.addAttribute("list",list);
			model.addAttribute("mlist",mlist);
			return "admin/adminChatDetail";
		}else {
			ra.addFlashAttribute("alertMsg","채팅방이 존재하지 않습니다.");
			return  "admin/chat";
		}
	}

	@GetMapping("/event")
	public String event(Model model,
					    @RequestParam(value="cpage", required=false, defaultValue="1") int cp,
					    @RequestParam Map<String, Object> paramMap) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(paramMap.get("condition") == null) {
			service.selectUserList(cp,1,map);
		}else {
			paramMap.put("cp", cp);
			paramMap.put("type", 1);
			service.selectUserSearch(paramMap,map);
		}
		List<Coupon> list = service.selectCouponList();
		
		model.addAttribute("userList",map);
		model.addAttribute("type",1);
		model.addAttribute("couponList",list);
		
		return "admin/adminEvent";

	}
	
	@PostMapping("/event/insert")
	public String eventInsert(Model model,
							  @RequestParam(value="images", required=false) MultipartFile img,
							  Coupon coupon, HttpSession session,RedirectAttributes ra) {
		
		String webPath = "/resources/images/coupons/";
		String serverFolderPath = session.getServletContext().getRealPath(webPath);
		coupon.setCouponPath(webPath);
		int result = 0;
		
		try {
			result = service.insertCoupon(coupon, img, webPath, serverFolderPath);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String,String> alertMsg = new HashMap<String,String>();
		if(result >= 1) {
			alertMsg.put("message", "쿠폰 등록 성공");
			alertMsg.put("type", "success");
		}else {
			alertMsg.put("message", "쿠폰 등록 실패");
			alertMsg.put("type", "error");
		}
		
		ra.addFlashAttribute("alertMsg",alertMsg);
		
		return "redirect:/admin/event";
	}
	
	@GetMapping("/event/couponToUser")
	public String couponToUser(@RequestParam(value="couponNo", required=false) int couponNo,
							   @RequestParam(value="userNo", required=false) int[] userNo,
							   RedirectAttributes ra) {
		int result = 0;
		for(int i = 0; i < userNo.length; i++) {
			Map<String,Integer> map = new HashMap<String,Integer>();
			map.put("couponNo", couponNo);
			map.put("userNo", userNo[i]);
			
			result = service.insertCouponToUser(map);
			if(result < 1) {
				break;
			}
		}
		
		Map<String,String> alertMsg = new HashMap<String,String>();
		if(result >= 1) {
			alertMsg.put("message", "쿠폰 보내기 성공");
			alertMsg.put("type", "success");
		}else {
			alertMsg.put("message", "쿠폰 보내기 실패");
			alertMsg.put("type", "error");
		}
		
		ra.addFlashAttribute("alertMsg",alertMsg);
		
		return "redirect:/admin/event";
	}
	
	@GetMapping("/bkmember")
	public String bkMember(Model model,
						   @RequestParam(value="cpage", required=false, defaultValue="1") int cp,
						   @RequestParam Map<String, Object> paramMap) {
			Map<String, Object> map = new HashMap<String, Object>();
			if(paramMap.get("condition") == null) {
				service.selectBkList(cp,map);
			}else {
				paramMap.put("cp", cp);
				service.selectBkSearch(paramMap,map);
			}
			model.addAttribute("userList",map);
			
		return "admin/adminBkMember";
	}
	
	@GetMapping("/bkmember/detail")
	public String bkMemberDetail (Model model, @RequestParam(value="userNo") int userNo) {
		
		Member m = memberService.selectMember(userNo);
		List<Attachment> at = service.selectAttachmentList(userNo);
		
		List<Map<String,String>> list = service.selectApplyListLimit5(2);
		
		model.addAttribute("member", m);
		model.addAttribute("attachment", at);
		model.addAttribute("list", list);
		return "admin/adminBkMemberDetail";
	}
	
	@GetMapping("/getBkUserInfo")
	@ResponseBody
	public JSONObject getBkUserInfo(int userNo) {
		
		JSONObject result = service.getBkUserInfo(userNo);
		
		return result;
	}
	
	@GetMapping("/bkAccept")
	@ResponseBody
	public int bkAccept(int userNo, String answer, String userId)throws MessagingException {
		String subjectText = "";
		String contentText = "";
		int result = 0;
		
		if(answer.equals("Y")) {
			subjectText = "귀하의 " + userId + " 회원가입 요청이 승인되었습니다.";
			contentText = "ZIPDREAM에 오신 것을 환영합니다!!";
			result = service.acceptBkMember(userNo);
		}else {
			subjectText = "귀하의 " + userId + " 회원가입 요청이 거절되었습니다.";
			contentText = "아쉽지만, 회원가입이 거절되었습니다.";
			result = memberService.deleteMember(userNo);
		}
		
		MimeMessage mailMessage = mailSender.createMimeMessage();
		String mailContent = contentText;
		mailMessage.setFrom(new InternetAddress("minifkaus@naver.com"));
		mailMessage.setSubject(subjectText, "utf-8");
		mailMessage.setText(mailContent, "utf-8", "html");
		mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(userId));
		mailSender.send(mailMessage);
		
		
		
		return result;
	}
	
	@GetMapping("/selldetail")
	public String sellDetail(Model model,
			   @RequestParam(value="cpage", required=false, defaultValue="1") int cp,
			   @RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(paramMap.get("condition") == null) {
			service.selectSellDetailList(cp,map);
		}else {
			paramMap.put("cp", cp);
			service.selectSellDetailSearch(paramMap,map);
		}
		model.addAttribute("sellDetailList",map);
		
		return "admin/adminSellDetail";
	}
	
	@GetMapping("/selldetail/del")
	public String deleteSellDetail(@RequestParam(value="sellNo") int sellNo,
									RedirectAttributes ra) {
		
		int result = service.deleteSellDetail(sellNo);
		
		Map<String,String> alertMsg = new HashMap<String,String>();
		if(result >= 1) {
			alertMsg.put("message", "삭제 성공");
			alertMsg.put("type", "success");
		}else {
			alertMsg.put("message", "삭제 실패");
			alertMsg.put("type", "error");
		}
		
		ra.addFlashAttribute("alertMsg",alertMsg);
		
		return "redirect:/admin/selldetail";
	}
}