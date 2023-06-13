package com.kh.zipdream.sell.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zipdream.sell.model.vo.Board;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertBoard(Board board) {
		return sqlSession.insert("board-mapper.insertBoard", board);
	}
	
	public List<Board> boardList(int refSno){
		return sqlSession.selectList("board-mapper.boardList", refSno);
	}
	
	public int deleteBoard(int detailBoardNo) {
		return sqlSession.update("board-mapper.deleteBoard", detailBoardNo);
	}
	
}
