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
					RedirectAttributes ra, ChatRoomJoin join
			) {
		ChatRoom room = new ChatRoom();
		room.setTitle(loginUser.getUserId()+"님의 채팅");
		room.setStatus("Y");
		room.setRefUno(loginUser.getUserNo());
		int chatRoomNo = service.openChatRoom(room); // 생성된 채팅반 번호 
		model.addAttribute("chatRoomNo",chatRoomNo);
		System.out.println("로그인"+loginUser.getUserNo());
		
	
			
			join.setRefUno(loginUser.getUserNo());
			join.setChatRoomNo(chatRoomNo);
			service.joinChatRoomUser(join);
		
		
		return chatRoomNo;
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
