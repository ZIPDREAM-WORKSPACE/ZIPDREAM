package com.kh.zipdream.notice.model.service;

import java.util.List;

import com.kh.zipdream.notice.model.vo.Notice;


public interface NoticeService {
	public int insertNotice(Notice notice);
	
	public int deleteSaleNotice(Notice notice);
	
	public List<Notice> selectManageList(int refUno);
	
	public List<Notice> selectInterestList(int refUno);
}
