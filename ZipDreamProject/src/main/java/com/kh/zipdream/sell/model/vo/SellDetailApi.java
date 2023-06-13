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
	private String sido;				//시도
	private String sigungu;				//시군구
	private String eupmyeon;			//읍면
	private String dongri;				//동리
	private String kaptCode;			//단지코드
	private String kaptName;			//단지이름
	private String kaptType;			//단지유형
	private String kaptAddress;			//단지도로명주소
	private String kaptApprovalDate;	//단지승인날짜	
	private String kaptEnrollDate;		//단지가입(등록)날짜
	private String kaptWingCount;		//총 동수	
	private String kaptHousehold;		//총 세대 수
	private String management;			//관리방식(위탁/자체)
	private String kaptHeating;			//난방방식
	private String kaptEntrance;		//현관타입/복도타입
	private String kaptBuildCompany;	//시공사
	private String securityCount;		//관리인원
	private String securityCompany;		//경비회사
	private String buildStructure;		//건물구조
	private String liftCount;			//승강기 수
	private String kaptParkingCount;	//주차 가능 수
	private String cctvCount;			//cctv개수
	private String kaptSecurityAddress;	//관리사무소 주소
	private String kaptAllFloor;		//최고층 수
	
	
}
