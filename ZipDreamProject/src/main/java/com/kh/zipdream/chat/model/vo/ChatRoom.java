package com.kh.zipdream.chat.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatRoom {
	private int chatRoomNo;
	private String title;
	private String status;
	private int refUno;
	private String userId;
	private String userName;
	private String message;
	private String createDate;
	
}
