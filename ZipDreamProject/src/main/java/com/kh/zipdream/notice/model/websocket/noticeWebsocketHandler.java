package com.kh.zipdream.notice.model.websocket;

import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.zipdream.admin.model.vo.Coupon;
import com.kh.zipdream.admin.model.vo.Report;
import com.kh.zipdream.mypage.model.vo.MyRoomSell;
import com.kh.zipdream.notice.model.service.NoticeService;
import com.kh.zipdream.notice.model.vo.Notice;
import com.kh.zipdream.sales.model.service.MySaleService;
import com.kh.zipdream.sales.model.vo.MySale;

public class noticeWebsocketHandler extends TextWebSocketHandler{
	
	@Autowired
	private MySaleService mySaleService;
	
	@Autowired
	private NoticeService noticeService;
	
private Set<WebSocketSession> sessions = Collections.synchronizedSet( new HashSet<WebSocketSession>());
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		System.out.println("dd1");
		
		
		sessions.add(session); // 전달받은 session을 set에 추가  
	}
	
	// 클라이언트와 연결이 종료되면 수행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessions.remove(session);
		System.out.println("dd2");
	}
	
	@Override // 클라이언트로부터 텍스트 메세지를 전달받았을때 수행
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("dd3");
		
		ObjectMapper objectMapper = new ObjectMapper();
		Notice n = new Notice();
		if(message.getPayload().charAt(2)=='h') {
			
		MySale mySale = objectMapper.readValue(message.getPayload(), MySale.class);
		n.setNoticeContent("관심 분양에 등록했습니다.");
		n.setNoticeTitle(mySale.getTitle());
		n.setRefUno(mySale.getUserNo());
		n.setCreateDateTime(new Date().toString());
		n.setNoticeType(2);
		n.setNoticeUrl(mySale.getHsUrl());
			
			for( WebSocketSession s: sessions) {
				s.sendMessage(new TextMessage(new Gson().toJson(mySale) ));
				System.out.println("dd4");
			}
		}else if(message.getPayload().charAt(2)=='r') {
			
			Report report = objectMapper.readValue(message.getPayload(), Report.class);
			if(report.getReportType().equals("1")) {
				n.setNoticeTitle("허위매물 신고");
			}else {
				n.setNoticeTitle("회원 신고");
			}
			n.setNoticeContent(report.getReportContent());
			n.setResult(report.getReportResult());
			n.setRefUno(report.getRefRuno());
			n.setCreateDateTime(new Date().toString());
			n.setNoticeType(1);
			n.setType(Integer.parseInt(report.getReportType()));
			
			
			
			for( WebSocketSession s: sessions) {
				s.sendMessage(new TextMessage(new Gson().toJson(report) ));
				System.out.println("dd4");
			}
		}else if(message.getPayload().charAt(2)=='c') {
			
			Coupon coupon = objectMapper.readValue(message.getPayload(), Coupon.class);
			n.setNoticeContent(coupon.getCouponContent());
			n.setNoticeTitle(coupon.getCouponTitle());
			n.setRefUno(coupon.getUserNo());
			n.setCreateDateTime(new Date().toString());
			n.setNoticeType(1);
			
			
			
			for( WebSocketSession s: sessions) {
				s.sendMessage(new TextMessage(new Gson().toJson(coupon) ));
				System.out.println("dd4");
			}
			
			
		}else if(message.getPayload().charAt(2)=='d') {
			
			MyRoomSell myRoomSell = objectMapper.readValue(message.getPayload(), MyRoomSell.class);
			n.setNoticeContent(myRoomSell.getDealType()+" 타입의 매물이 공인중개사와 매칭되었습니다.");
			n.setNoticeTitle("매물 매칭");
			n.setRefUno(myRoomSell.getRefUno());
			n.setCreateDateTime(new Date().toString());
			n.setNoticeType(1);
			
			
			
			for( WebSocketSession s: sessions) {
				s.sendMessage(new TextMessage(new Gson().toJson(myRoomSell) ));
				System.out.println("dd4");
			}
			
			
		}
		noticeService.insertNotice(n);
		
	}

}