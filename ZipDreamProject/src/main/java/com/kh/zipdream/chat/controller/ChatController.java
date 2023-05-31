package com.kh.zipdream.chat.controller;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.zipdream.chat.model.service.ChatService;
import com.kh.zipdream.chat.model.vo.ChatMessage;
import com.kh.zipdream.chat.model.vo.ChatRoom;
import com.kh.zipdream.chat.model.vo.ChatRoomJoin;
import com.kh.zipdream.member.model.vo.Member;


@Controller
@SessionAttributes({"loginUser", "chatRoomNo"})
public class ChatController {
	
	@Autowired
	private ChatService service;
	
	/*
	 * // 채팅방 목록 조회
	 * 
	 * @GetMapping("/chat/chatRoomList") public String selectChatRoomList(Model
	 * model) {
	 * 
	 * List<ChatRoom> crList = service.selectChatRoomList();
	 * 
	 * model.addAttribute("chatRoomList", crList); System.out.println(crList);
	 * return "chat/chatRoomList";
	 * 
	 * }
	 */
	
	@ResponseBody
	@GetMapping("/chat/chatRoomSelect")
	public int selectChatRoom(@ModelAttribute("loginUser") Member loginUser, Model model) {
		
		int result = service.selectChatRoom(loginUser.getUserNo());
		
		return result;
				
	}
	
	// 채팅방 만들기
	@ResponseBody
	@GetMapping("/chat/openChatRoom")
	public int openChatRoom(
					@ModelAttribute("loginUser") Member loginUser,
					Model model,
					RedirectAttributes ra
			) {
		ChatRoom room = new ChatRoom();
		room.setTitle(loginUser.getUserId()+"님의 채팅");
		room.setStatus("Y");
		room.setRefUno(loginUser.getUserNo());
		int chatRoomNo = service.openChatRoom(room); // 생성된 채팅반 번호 
		model.addAttribute("chatRoomNo",chatRoomNo);
		ChatRoomJoin join = new ChatRoomJoin();
		join.setRefUno(loginUser.getUserNo());
		join.setChatRoomNo(chatRoomNo);
		service.joinChatRoomUser(join);
		
		return chatRoomNo;
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
		service.joinChatRoomUser(join);
		List<ChatMessage> list = service.selectChatMessage(join);
		
		if(list !=null) {
			model.addAttribute("list",list);
			return "admin/adminChatDetail";
		}else {
			ra.addFlashAttribute("alertMsg","채팅방이 존재하지 않습니다.");
			return  "chat/chatRoomList";
		}
	}
	
	//채팅방나가기
	@GetMapping("/chat/exit")
	@ResponseBody
	public int exitChatRoom(
							ChatRoomJoin join, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		join.setRefUno(loginUser.getUserNo());
		int crNo = service.exitChatRoom(join);
		return crNo;
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
