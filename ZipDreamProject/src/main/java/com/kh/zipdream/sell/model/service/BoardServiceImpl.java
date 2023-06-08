package com.kh.zipdream.sell.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zipdream.sell.model.dao.BoardDao;
import com.kh.zipdream.sell.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao boardDao;
	
	public int insertBoard(Board board) {
		return boardDao.insertBoard(board);
	}
	
	public List<Board> boardList(int refSno){
		return boardDao.boardList(refSno);
	}
}
