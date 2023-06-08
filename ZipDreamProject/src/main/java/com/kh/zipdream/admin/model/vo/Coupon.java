package com.kh.zipdream.admin.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Coupon {
	private int couponNo;
	private String couponTitle;
	private String couponContent;
	private Date couponDate;
	private String couponPath;
}
