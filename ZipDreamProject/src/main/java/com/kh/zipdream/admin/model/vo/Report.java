package com.kh.zipdream.admin.model.vo;

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
public class Report {
	private int reportNo;
	private int refRuno;
	private int refTuno;
	private String rName;
	private String tName;
	private String reportContent;
	private String reportStatus;
	private String reportResult;
	private String reportType;
	private String reportDate;
}