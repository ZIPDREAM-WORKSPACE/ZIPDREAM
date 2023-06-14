package com.kh.zipdream.sell.model.service;

import java.util.List;
import java.util.Map;

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
	
	public List<Reply> replyList(int detailBoardNo){
		return replyDao.replyList(detailBoardNo);
	}
	
	public int deleteReply(Map<String, Object> map) {
		return replyDao.deleteReply(map);
	}
	
}
