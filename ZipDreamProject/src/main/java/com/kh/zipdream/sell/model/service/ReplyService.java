package com.kh.zipdream.sell.model.service;

import java.util.List;
import java.util.Map;

import com.kh.zipdream.sell.model.vo.Reply;

public interface ReplyService {
	
	int insertReply(Reply reply);
	
	List<Reply> replyList(int detailBoardNo);
	
	int deleteReply(Map<String, Object> map);
}
