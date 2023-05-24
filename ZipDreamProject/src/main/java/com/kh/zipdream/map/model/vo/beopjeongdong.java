package com.kh.zipdream.map.model.vo;

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
public class beopjeongdong {
	private int bjdCode;
	private String bjdName;
	private String status;
	private int userNo;

}
