package com.kh.zipdream.sell.model.service;

import java.util.List;

import com.kh.zipdream.sell.model.vo.Reply;

public interface ReplyService {
	
	int insertReply(Reply reply);
	
	List<Reply> selectList(int detailBoardNo);
}
