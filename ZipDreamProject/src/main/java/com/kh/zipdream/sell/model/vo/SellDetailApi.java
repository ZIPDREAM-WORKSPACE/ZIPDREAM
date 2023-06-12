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
public class SellDetailApi {
	private String sidoCode;
	private String sellSno;
	private String sellName; 				//	SELL_NAME varchar(100) 
	private String sellAddress;				//	SELL_ADDRESS varchar(100) 
	
	private String sellPrice;
	private String brokerAdd;
	private String sellPrivateArea;	
	private String sellFloor;					//	SELL_FLOOR int 
	private String ymd;
	private String sellApprovalDatetime; 		// 건축년도 //	SELL_APPROVAL_DATETIME datetime 
	
	private String realYn;
	private String realYnDate;
	
	//api2
	private String sido;
	private String sigungu;
	private String eupmyeon;
	private String dongri;
	private String kaptCode;
	private String kaptName;
	private String kaptApprovalDate;
	private String kaptEnrollDate;
	private String kaptWingCount;
	private String kaptHousehold;
	private String maintenanace;
	private String heating;
	private String kaptEntrance;
	private String kaptBuildCompany;
	private String securityCompany;
	private String cleanCompany;
	private String buildStructure;
	private String liftCount;
	private String kaptParkingCount;
	private String cctvCount;
	private String kaptAllFloor;
	
	
}
