package com.kh.zipdream.sell.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Counsle {
	private int counsleMethod;
	private String counsleContent;
	private Date applyDate;
	private String accept;
	private int refTuno;
	private int refUno;
	private int sellNo;
	
	private String userName;
	private String sellName;
	
}
