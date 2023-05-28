package com.kh.zipdream.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	// 채팅방 목록 조회 
	@GetMapping("/chat/chatRoomList")
	public String selectChatRoomList(Model model) {
		
		List<ChatRoom> crList = service.selectChatRoomList();
		
		model.addAttribute("chatRoomList", crList);
		
		return "chat/chatRoomList";
				
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
		System.out.println(chatRoomNo);
		ChatRoomJoin join = new ChatRoomJoin();
		join.setRefUno(loginUser.getUserNo());
		join.setChatRoomNo(chatRoomNo);
		service.joinChatRoomUser(join);
		
		return chatRoomNo;
	}
	
	@GetMapping("/chat/room/{chatRoomNo}")
	public String joinChatRoom(
				@ModelAttribute("loginUser") Member loginUser,
				// sessionScope에 있는 loginUser를 넣어준다
				// 단, SessionAttribute로 등록이 되어 있는 경우 
				Model model,
				@PathVariable("chatRoomNo") int chatRoomNo,
				ChatRoomJoin join, 
				RedirectAttributes ra
			) {
		join.setRefUno(loginUser.getUserNo());
		List<ChatMessage> list = service.joinChatRoom(join);
		
		if(list !=null) {
			model.addAttribute("list",list);
			model.addAttribute("chatRoomNo",chatRoomNo); // session에 올림 
			return "chat/chatRoom";
		}else {
			ra.addFlashAttribute("alertMsg","채팅방이 존재하지 않습니다.");
			return "redirect:../chatRoomList";
					
		}
	}
	
	//채팅방나가기
	@GetMapping("/chat/exit")
	@ResponseBody
	public int exitChatRoom(@ModelAttribute("loginUser") Member loginUser,
							ChatRoomJoin join) {
		join.setRefUno(loginUser.getUserNo());
		return service.exitChatRoom(join);
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}