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
public class Calender {
	private int calenderNo;
	private String calenderTitle;
	private String calenderMemo;
	private String url;
	private String calenderStart;
	private String calenderEnd;

}
