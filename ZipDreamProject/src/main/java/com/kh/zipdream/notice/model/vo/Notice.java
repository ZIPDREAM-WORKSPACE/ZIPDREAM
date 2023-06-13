package com.kh.zipdream.notice.model.vo;



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
public class Notice {
	private int noticeNo;
	private int noticeType;
	private String noticeContent;
	private String noticeTitle;
	private String noticeUrl;
	private int refUno;
	private String createDateTime;
	private String result;
	private int type;
}
