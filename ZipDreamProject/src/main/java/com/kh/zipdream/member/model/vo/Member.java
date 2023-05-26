package com.kh.zipdream.member.model.vo;

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
public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String phone;
	private String nickname;
	private String address;
	private Date modifyDateTime;
	private Date enrollDateTime;
	private String status;
	private String license;
	private String withdraw;
	private int licenseInt;
	

}
