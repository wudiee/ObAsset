package com.ob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ob.dao.BoardDAO;
import com.ob.dto.Board;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDao;
	
	@Transactional(readOnly = true)
	public List<Board> getBoards(){
		return boardDao.getBoards();
		
	}
	
	@Transactional(readOnly = true)
	public Board getBoard(Board board) {
		return boardDao.getBoard(board);
		
	}
	
	@Transactional(readOnly = false)
	public int addBoard(Board board) {
		return boardDao.addBoard(board);
	}
	
	@Transactional(readOnly = false)
	public int updateBoard(Board board) {
		return boardDao.updateBoard(board);
	}
	
	@Transactional(readOnly = false)
	public int deleteBoard(Board board) {
		return boardDao.deleteBoard(board);
	}
}
