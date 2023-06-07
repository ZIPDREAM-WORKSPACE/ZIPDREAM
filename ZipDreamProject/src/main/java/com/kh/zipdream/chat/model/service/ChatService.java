package com.kh.zipdream.chat.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.zipdream.chat.model.vo.ChatMessage;
import com.kh.zipdream.chat.model.vo.ChatRoom;
import com.kh.zipdream.chat.model.vo.ChatRoomJoin;

public interface ChatService {
	
	List<ChatRoom> selectChatRoomList();
	
	int openChatRoom(ChatRoom cr);
	
	List<ChatMessage> selectChatMessage(ChatRoomJoin join);
	
	public void joinChatRoomUser(ChatRoomJoin crj);
	
	int insertMessage(ChatMessage cm); 
	
	int exitChatRoom(ChatRoomJoin crj);
	
	int selectChatRoom(int uno);
	
	int selectChatRoomjoin(HashMap<String, Integer> map);
	
	List<Integer> countChatRoomMemberList();
	
	int closeChatRoom(int chatRoomNo);
}
