package com.kh.zipdream.mypage.model.vo;

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
public class MyRoomSell {
	
	private int userSrNo;
	private int refUno;
	private int refRuno;
	private String roomType;
	private String buildingType;
	private String address;
	private String dealType;
	private int status;

	// 공인중개사 페이지에서 회원정보 받아오기 위한 필드	
	private String userName;
	private String phone;
}
