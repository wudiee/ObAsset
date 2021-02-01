package com.ob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.dao.BoardDAO;
import com.ob.dto.Board;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDao;
	
	public List<Board> getBoards(){
		return boardDao.getBoards();
		
	}
	public Board getBoard(Board board) {
		return boardDao.getBoard(board);
		
	}
	public int addBoard(Board board) {
		return boardDao.addBoard(board);
		
	}
	public int updateBoard(Board board) {
		return boardDao.updateBoard(board);
	}
	public int deleteBoard(Board board) {
		return boardDao.deleteBoard(board);
	}
}
