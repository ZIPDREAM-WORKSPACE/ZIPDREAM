package com.kh.zipdream.chat.model.service;

import java.util.List;

import com.kh.zipdream.chat.model.vo.ChatMessage;
import com.kh.zipdream.chat.model.vo.ChatRoom;
import com.kh.zipdream.chat.model.vo.ChatRoomJoin;

public interface ChatService {
	
	List<ChatRoom> selectChatRoomList();
	
	int openChatRoom(ChatRoom cr);
	
	List<ChatMessage> joinChatRoom(ChatRoomJoin crj);
	
	public void joinChatRoomUser(ChatRoomJoin crj);
	
	int insertMessage(ChatMessage cm); 
	
	int exitChatRoom(ChatRoomJoin crj);
}
