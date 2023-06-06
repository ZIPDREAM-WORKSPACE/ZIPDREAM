package com.kh.zipdream.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.admin.model.vo.NoticeBoard;
import com.kh.zipdream.chat.model.vo.ChatMessage;
import com.kh.zipdream.chat.model.vo.ChatRoom;
import com.kh.zipdream.chat.model.vo.ChatRoomJoin;
import com.kh.zipdream.common.model.vo.PageInfo;

@Repository
public class ChatDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<ChatRoom> selectChatRoomList(){
		return sqlSession.selectList("chattingMapper.selectChatRoomList");
	}
	
	public int openChatRoom(ChatRoom chatRoom) {
		
		int result = sqlSession.insert("chattingMapper.openChatRoom", chatRoom);
		
		if(result>0) {
			return chatRoom.getChatRoomNo();
		}else {
			return result;
		}
		
	}
	
	// 채팅방 참여여부 확인
	public int joinCheck(ChatRoomJoin join) {
		return sqlSession.selectOne("chattingMapper.joinCheck", join);
	}
	
	// 채팅방 참여
	public void joinChatRoom(ChatRoomJoin join) {
		sqlSession.insert("chattingMapper.joinChatRoom", join);
	}
	
	// 채팅방 메세지 목록 조회
	public List<ChatMessage> selectChatMessage(ChatRoomJoin join){
		return sqlSession.selectList("chattingMapper.selectChatMessage", join);
	}
	
	//채팅메세지 삽입
	public int insertMessage(ChatMessage chatMessage) {
		return sqlSession.insert("chattingMapper.insertMessage",chatMessage );
	}
	
	// 채팅방 나가기
	public int exitChatRoom(ChatRoomJoin join) {
		return sqlSession.delete("chattingMapper.exitChatRoom", join);
	}
	
	public int deleteChatMessage(int chatRoomNo) {
		return sqlSession.delete("chattingMapper.deleteChatMessage", chatRoomNo);
	}
	
	// 채팅방 인원수
	public int countChatRoomMember(int chatRoomNo) {
		return sqlSession.selectOne("chattingMapper.countChatRoomMember", chatRoomNo);
	}
	
	// 채팅방 닫기 
	public int closeChatRoom(int chatRoomNo) {
		return sqlSession.delete("chattingMapper.closeChatRoom",chatRoomNo);
	}
	
	// 채팅방 인원수
	public int countChatRoom() {
		return sqlSession.selectOne("chattingMapper.countChatRoom");
	}
	
	// 채팅방 목록 조회
	public ArrayList<ChatRoom> selectChatRoomList(PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		ArrayList<ChatRoom> r =  (ArrayList) sqlSession.selectList("chattingMapper.selectChatRoomList","",rowBounds);
		System.out.println(r);
		
		return r;
	}
	
	// 채팅방 조회
	public int selectChatRoom(int refUno){
		return sqlSession.selectOne("chattingMapper.selectChatRoom", refUno);
	}
	
	// 채팅조인 조회 
	public int selectChatRoomjoin(HashMap<String, Integer> map){
		return sqlSession.selectOne("chattingMapper.selectChatRoomjoin", map);
	}
	
	public List<Integer> countChatRoomMemberList(){
		return sqlSession.selectList("chattingMapper.countChatRoomMemberList");
	}

}
