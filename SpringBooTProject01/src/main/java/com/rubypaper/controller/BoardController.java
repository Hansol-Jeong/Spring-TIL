package com.rubypaper.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rubypaper.domain.BoardVO;

@RestController
public class BoardController {
	public BoardController() {
		System.out.println("===> BoardController created");
	}
	
	@GetMapping("/hello")
	public String hello(String name) {
		return "hello : " + name;
	}
	
	@GetMapping("/getBoard")
	public BoardVO getBoard() {
		BoardVO board = new BoardVO();
		board.setSeq(1);
		board.setTitle("임시 제목");
		board.setWriter("익명");
		board.setContent("임시 내용...............");
		board.setCreateDate(new Date());
		board.setCnt(0);
		return board;
	}
	
	@GetMapping("/getBoardList")
	public List<BoardVO> getBoardList() {
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		for (int i = 0; i < 5; i++) {
			BoardVO board = new BoardVO();
			board.setSeq(++i);
			board.setTitle("임시 제목" + i);
			board.setWriter("익명" + i);
			board.setContent("임시 내용..............." + i);
			board.setCreateDate(new Date());
			board.setCnt(0);
			boardList.add(board);
		}
		return boardList;
	}
}
