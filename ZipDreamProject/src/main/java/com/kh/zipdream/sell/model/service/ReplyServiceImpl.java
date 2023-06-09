package com.kh.zipdream.sell.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zipdream.sell.model.dao.ReplyDao;
import com.kh.zipdream.sell.model.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDao replyDao;
	
	public int insertReply(Reply reply) {
		return replyDao.insertReply(reply);
	}
	
}
