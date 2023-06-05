package com.kh.zipdream.chat.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatMessage {
	private int cmNo;
	private String message;
	private String createDatetime;
	private int chatRoomNo;
	private int refUno;
	private String userId;
	private int userLevel;
	
}
