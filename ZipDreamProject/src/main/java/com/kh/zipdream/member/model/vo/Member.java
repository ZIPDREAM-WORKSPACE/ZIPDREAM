package com.kh.zipdream.member.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.zipdream.attachment.model.vo.Attachment;

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
	private String phone;
	private String address;
	private String addr2;
	private String addr3;
	private String email;
	private Date enrollDateTime;
	private Date modifyDateTime;
	private String status;
	private String withdraw;
	private String office;
	private int userLevel;
	private ArrayList<Attachment> imgList;
	

}
