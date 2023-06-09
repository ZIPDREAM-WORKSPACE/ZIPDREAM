package com.kh.zipdream.sales.model.vo;


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
public class MySale {
	private int hsSeq;
	private String startDateTime;
	private int userNo;
	private int houseCode;
	private String hsUrl;
	private String title;
}