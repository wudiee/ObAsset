package com.ob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ob.dto.Comments;

@Mapper
public interface CommentDAO {

	public List<Comments> getComments(Comments comments);
	public Comments getComment(Comments comments);
	public int addComment(Comments comment);
	public int updateComment(Comments comment);
	public int deleteComment(Comments comment);
	
}
