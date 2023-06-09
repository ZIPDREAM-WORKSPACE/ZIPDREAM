package com.kh.zipdream.sell.model.vo;

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
public class Board {
	
	private int detailBoardNo;
	private int refUno;
	private String content;
	private String status;
	private String delStatus;
	private int refSno;
	
	private String userName;
	
	
}
