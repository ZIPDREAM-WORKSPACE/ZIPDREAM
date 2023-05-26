package com.kh.zipdream.admin.model.vo;

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
public class NoticeBoard {
	private int noticeBoardNo;
	private String noticeBoardTitle;
	private String noticeBoardContent;
	private String createDateTime;
}
