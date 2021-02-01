package com.ob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ob.dto.Board;

@Mapper
public interface BoardDAO {
	public List<Board> getBoards();
	public Board getBoard(Board board);
	public int addBoard(Board board);
	public int updateBoard(Board board);
	public int deleteBoard(Board board);
}
