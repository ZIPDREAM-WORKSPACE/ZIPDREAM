package com.kh.zipdream.sell.model.service;

import java.util.List;

import com.kh.zipdream.sell.model.vo.Board;

public interface BoardService {

	int insertBoard(Board board);
	List<Board> boardList(int refSno);
	int deleteBoard(int detailBoardNo);
}
