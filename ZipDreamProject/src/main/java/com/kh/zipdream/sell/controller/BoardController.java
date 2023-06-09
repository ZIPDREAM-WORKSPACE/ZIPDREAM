package com.kh.zipdream.sell.controller;

import java.util.List;  

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kh.zipdream.sell.model.service.BoardService;
import com.kh.zipdream.sell.model.vo.Board;
 
@RestController
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@PostMapping("/insert")
	public int insertBoard(Board board) {
		return boardService.insertBoard(board);
	}
	
	@GetMapping("/list")
	public String boardList(int refSno) {
		List<Board> bList = boardService.boardList(refSno);
		return new Gson().toJson(bList);
	}
	
	
	
}
