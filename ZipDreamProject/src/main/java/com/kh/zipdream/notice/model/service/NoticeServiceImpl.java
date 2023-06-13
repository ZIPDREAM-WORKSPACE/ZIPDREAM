package com.kh.zipdream.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zipdream.notice.model.dao.NoticeDao;
import com.kh.zipdream.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public int insertNotice(Notice notice) {
		int result = noticeDao.insertNotice(notice);
		return result;
	}
	
	@Override
	public int deleteSaleNotice(Notice notice) {
		int result = noticeDao.deleteSaleNotice(notice);
		return result;
	}
	
	@Override
	public List<Notice> selectManageList() {
		List<Notice> result = noticeDao.selectManageList();
		return result;
	}
	
	@Override
	public List<Notice> selectInterestList() {
		List<Notice> result = noticeDao.selectInterestList();
		return result;
	}

}
