package com.kh.zipdream.notice.model.websocket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.zipdream.sales.model.service.MySaleService;
import com.kh.zipdream.sales.model.vo.MySale;

public class noticeWebsocketHandler extends TextWebSocketHandler{
	
	@Autowired
	private MySaleService mySaleService;
	
private Set<WebSocketSession> sessions = Collections.synchronizedSet( new HashSet<WebSocketSession>());
	
	// synchronizedSet : 동기화된 Set반환 
	// -> 멀티스레드환경에서 하나의 컬렉션 요소에 여러스레드가 동시에 접근하면 충돌이 발생할수 있으므로 동기화를 진행. 
	
	// 클라이언트와 연결이 수립되고, 통신 준비가 완료되면 수행되는 메소드 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		System.out.println("dd1");
		// WebSocketSession : 웹소켓에 접속/요청한 클라이언트의 세션정보 
		
		
		sessions.add(session); // 전달받은 session을 set에 추가  
	}
	
	// 클라이언트와 연결이 종료되면 수행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessions.remove(session);
		System.out.println("dd2");
		// 웹소켓 연결이 종료되는 경우, sessions안에 저장되어있던 클라이언트의 session정보를 삭제 
	}
	
	@Override // 클라이언트로부터 텍스트 메세지를 전달받았을때 수행
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		// TextMessage : 웹소켓을 이용해 전달된 텍스트가 담겨있는 객체 
		System.out.println("dd3");
		// payLoad : 전송되는 데이터(json객체)
		
		// JackSon라이브러리 : java에서 json을 다루기 위한 라이브러리 
		
		// Jackson-databind -> ObjectMapper를 이용해서 JSON형태로 넘어온 데이터를 특정 VO필드에 맞게 자동 매핑 
		
		ObjectMapper objectMapper = new ObjectMapper();
		System.out.println(message.getPayload());
		if(message.getPayload().charAt(2)=='h') {
			
			MySale mySale = objectMapper.readValue(message.getPayload(), MySale.class);
			int result = mySaleService.insertMysaleHouse(mySale);
			System.out.println(result);
			if(result > 0) {
				// 같은방에 접속중인 클라이언트에게 전달받은 메세지 뿌리기 
				for( WebSocketSession s: sessions) {
					// 반복을 진행중인 WebSocketSession안에 담겨있는 방번호 == 메세지 안에 담겨있는 방번호가 일치하는 경우 메세지 뿌리기
					/*	int refUno = (int)s.getAttributes().get("refUno");
				System.out.println(refUno);
				// 메세지에 담겨있는 채팅반 번호와 chatRoomNo 일치하는지 비교 
				if(mySale.getUserNo() == refUno) {*/
					// 같은방 클라이언트에게 JSON 형태로 메세지를 보냄. 
					// s.sendMessage( new TextMessage( JSON객체  ) )
					s.sendMessage(new TextMessage(new Gson().toJson(mySale) ));
					//}
					System.out.println("dd4");
		}
		
		
		/* chatMessage.setCreateDatetime(new Date(System.currentTimeMillis())); */
		
		// 전달받은 채팅메세지를 db에 삽입
		//System.out.println("웹소켓"+chatMessage); 
		
			}
		}
	}

}
