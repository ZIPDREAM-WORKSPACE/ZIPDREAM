package com.kh.zipdream.sell.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Reply {
	
	private int replyNo;
	private String replyContent;
	private Date createDate;
	private String status;
	private int detailBoardNo;
	private int replyRefUno;
	
	private String userName;
}
