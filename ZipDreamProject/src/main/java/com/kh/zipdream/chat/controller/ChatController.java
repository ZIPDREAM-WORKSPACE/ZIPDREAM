package com.kh.zipdream.chat.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.zipdream.chat.model.service.ChatService;
import com.kh.zipdream.chat.model.vo.ChatRoom;
import com.kh.zipdream.chat.model.vo.ChatRoomJoin;
import com.kh.zipdream.member.model.vo.Member;


@Controller
@SessionAttributes({"loginUser", "chatRoomNo"})
public class ChatController {
	
	@Autowired
	private ChatService service;

	
	@ResponseBody
	@GetMapping("/chat/chatRoomSelect")
	public int selectChatRoom(@ModelAttribute("loginUser") Member loginUser,@ModelAttribute("chatRoomNo") int chatRoomNo, Model model) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("refUno", loginUser.getUserNo());
		map.put("chatRoomNo", chatRoomNo);
		int result = service.selectChatRoom(map);
		
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
		room.setTitle(loginUser.getUserId());
		room.setStatus("Y");
		room.setRefUno(loginUser.getUserNo());
		int chatRoomNo = service.openChatRoom(room); // 생성된 채팅반 번호 
		model.addAttribute("chatRoomNo",chatRoomNo);
		
	
			
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
	
	
	//채팅방삭제
		@GetMapping("/chat/closeChatRoom/{chatRoomNo}")
		@ResponseBody
		public int closeChatRoom(@PathVariable("chatRoomNo") int chatRoomNo,
								 HttpSession session) {
			int result  = service.closeChatRoom(chatRoomNo);
			return result;
		
		}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
