package com.ob.dao;

import java.util.List;

import com.ob.dto.Board;

public interface BoardDAO {
	public List<Board> getBoards();
	public Board getBoard(Board board);
	public int addBoard(Board board);
}
