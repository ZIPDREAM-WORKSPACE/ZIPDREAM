package com.kh.zipdream.chat.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.zipdream.chat.model.dao.ChatDAO;
import com.kh.zipdream.chat.model.vo.ChatMessage;
import com.kh.zipdream.chat.model.vo.ChatRoom;
import com.kh.zipdream.chat.model.vo.ChatRoomJoin;
import com.kh.zipdream.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatDAO dao;
	
	@Override
	public List<ChatRoom> selectChatRoomList(){
		return dao.selectChatRoomList();
	}
	
	@Override
	public int selectChatRoom(Map<String, Integer> map){
		return dao.selectChatRoom(map);
	}
	
	@Override
	public int openChatRoom(ChatRoom chatRoom) {
		return dao.openChatRoom(chatRoom);
	}
	
	@Override
	public List<ChatMessage> selectChatMessage(ChatRoomJoin join){
		
		// 채팅메세지 목록 조회
		return dao.selectChatMessage(join);
	}
	
	@Override
	public void joinChatRoomUser(ChatRoomJoin join){
		
		
			dao.joinChatRoom(join);
			
	}
	
	@Override
	public int insertMessage(ChatMessage chatMessage) {
		
		return dao.insertMessage(chatMessage);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	@ResponseBody
	public int exitChatRoom(ChatRoomJoin join) {
		
		// 채팅방 나가기 
		int result = dao.exitChatRoom(join);
		// 채팅방 나가기 성공시 
		if(result > 0 ) {
			// 현재방에 남아있는 인원을 확인하고, 
			int cnt = dao.countChatRoomMember(join.getChatRoomNo());
			
			// 0명일경우 방을 닫기
			if(cnt == 0) {
				dao.deleteChatMessage(join.getChatRoomNo());
				result = dao.closeChatRoom(join.getChatRoomNo());
			}
		}
		return result; 
	}
	
	@Override
	public int selectChatRoomjoin(HashMap<String, Integer> map) {
		return dao.selectChatRoomjoin(map);
	}
	
	@Override
	public List<Integer> countChatRoomMemberList() {
		return dao.countChatRoomMemberList();
	}

	@Override
	public int closeChatRoom(int chatRoomNo) {
		dao.deleteChatMessage(chatRoomNo);
		dao.joinUserDelete(chatRoomNo);
		return dao.closeChatRoom(chatRoomNo);
	}
	
	@Override
	public List<Member> selectChatMember(int chatRoomNo) {
		return dao.selectChatMember(chatRoomNo);
	}
}
