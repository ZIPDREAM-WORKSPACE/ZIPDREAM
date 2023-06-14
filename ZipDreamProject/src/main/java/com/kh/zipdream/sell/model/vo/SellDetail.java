package com.kh.zipdream.sell.model.vo;

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
public class SellDetail {
	
	private int sellNo; 				//매물번호 
	private String sellSno; 			//api매물번호
	private String sidoCode; 			//시도코드 ex) 11110(지역) -> 11(시도)
	private int refUno;					//공인중개사 회원번호(작성자)
	private String sellName; 			//매물이름 
	private String sellAddress;			//매물주소 
	
	private String sellPrice;			//매매가
	private String brokerAdd;			//api공인중개사 소재지
						
	private String sellMaintenance;		//관리비

	private String sellParking;			//주차가능
	private String sellShortterm;		//단기임대
	private String sellType;			//건물유형

	private String sellFloor;			//해당 층
	private String ymd;					//

	private String sellPrivateArea;		//전용면적
	private String sellProvideArea;		//공급면적
	private String sellAllFloor;		//모든 층
	private String sellRoomCount;		//방 수
	private String sellToiletCount;		//화장실 수
	private String sellWay;				//방향
	private String sellHousehold;		//해당면적 세대수
	private String sellEntrance;		//현관타입
	private String sellMoveDatetime;	//입주가능일
	private String sellBuldtype;		//건물유형
	private String sellInstallation;	//승강시설
	private String sellAircondition;	//냉방시설
	private String sellHeating;			//난방시설

	private String parkingCount;			//총 주자 수
	private String sellApprovalDatetime; 	//건물승인일
	private String sellEnrollDatetime;		//단지등록일
	
	private String realYn;
	private String realYnDate;
	private String complexApplyDatetime;	//단지사용승인일
	private String wingCount; 				//총 동수
	private String householdCount;			//총 세대수

	private String option;					//옵션
	private String security;				//보안시설
	private String createDate;				//작성날짜
	private String modifyDate;				//수정날짜
	private String status;					//상태
	
	private ArrayList<Attachment> imgList;	//매물이미지
	private String address; //공인중개사 주소
	private String filePath; // 이미지 경로;
	
	
	private String filePath; // 최근본방에 들어갈 이미지 주소
	
}
