package com.kh.zipdream.sell.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.zipdream.attachment.model.vo.Attachment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
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
public class SellDetail {
	
	private int sellNo; 					// SELL_NO int 
	private String sellSno;
	private int refUno;						//	REF_UNO int 
	private String sellName; 				//	SELL_NAME varchar(100) 
	private String sellAddress;				//	SELL_ADDRESS varchar(100) 

	private String brokerAdd;
	private int sellPrice;					//	SELL_PRICE int 
	private int sellMaintenance;			//	SELL_MAINTENANCE int 

	private String sellParking;				//	SELL_PARKING varchar(30) 
	private String sellShortterm;			//	SELL_SHIRTTERM varchar(30) 
	private String sellType;				//	SELL_TYPE varchar(30) 

	private int sellFloor;					//	SELL_FLOOR int 
	private Date ymd;

	private String sellPrivateArea;			//	SELL_PRIVATE_AREA varchar(30) 
	private String sellProvideArea;			//	SELL_PROVIDE_AREA varchar(30) 
	private String sellAllFloor;				//	SELL_ALL_FLOOR int 
	private String sellRoomCount;				//	SELL_ROOM_COUNT int 
	private String sellToiletCount;				//	SELL_TOILET_COUNT int 
	private String sellWay;					//	SELL_WAY varchar(30) 
	private String sellHousehold;				//	SELL_HOUSEHOLD int 
	private String sellEntrance;			//	SELL_ENTRANCE varchar(30) 
	private String sellMoveDatetime;		//	SELL_MOVE_DATETIME varchar(30) 
	private String sellBuldtype;			//	SELL_BULDTYPE varchar(30) 
	private String sellInstallation;		//	SELL_INSTALLATION varchar(100) 
	private String sellAircondition;		//	SELL_AIRCONDITION varchar(100) 
	private String sellHeating;				//	SELL_HEATING varchar(100) 

	private int parkingCount;				//	PARKING_COUNT int 
	private Date sellApprovalDatetime; 		//	SELL_APPROVAL_DATETIME datetime 
	private Date sellEnrollDatetime;		//	SELL_ENROLL_DATETIME datetime 
	private String realYn;
	private Date realYnDate;
	private Date complexApplyDatetime;		//	COMPLEX_APPLY_DATETIME datetime 
	private int wingCount; 					//	WING_COUNT int 
	private int householdCount;				//	HOUSEHOLD_COUNT int 

	private String option;					//	OPTION varchar(100) 
	private String security;				//	SECURITY varchar(100) 
	private Date createDate;
	private Date modifyDate;
	
	private ArrayList<Attachment> imgList;
	
}
