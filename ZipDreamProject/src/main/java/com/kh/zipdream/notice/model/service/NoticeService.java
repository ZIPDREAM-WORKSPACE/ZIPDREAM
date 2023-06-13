package com.kh.zipdream.notice.model.service;

import org.springframework.stereotype.Service;

import com.kh.zipdream.admin.model.vo.Report;
import com.kh.zipdream.notice.model.vo.Notice;


public interface NoticeService {
	public int insertNotice(Notice notice);
	
	public int deleteSaleNotice(Notice notice);
	
	
}
