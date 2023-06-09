package com.kh.zipdream.chat.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.zipdream.chat.model.vo.ChatMessage;
import com.kh.zipdream.chat.model.vo.ChatRoom;
import com.kh.zipdream.chat.model.vo.ChatRoomJoin;
import com.kh.zipdream.member.model.vo.Member;

public interface ChatService {
	
	List<ChatRoom> selectChatRoomList();
	
	int openChatRoom(ChatRoom cr);
	
	List<ChatMessage> selectChatMessage(ChatRoomJoin join);
	
	public void joinChatRoomUser(ChatRoomJoin crj);
	
	int insertMessage(ChatMessage cm); 
	
	int exitChatRoom(ChatRoomJoin crj);
	
	int selectChatRoom(Map<String, Integer> map);
	
	int selectChatRoomjoin(HashMap<String, Integer> map);
	
	List<Integer> countChatRoomMemberList();
	
	int closeChatRoom(int chatRoomNo);
	
	List<Member> selectChatMember(int chatRoomNo);
}
