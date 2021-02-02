package com.ob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ob.dao.CommentDAO;
import com.ob.dto.Comments;

@Service
public class CommentService {

	@Autowired
	private CommentDAO commentDAO;
	
	@Transactional(readOnly = true)
	public List<Comments> getComments(Comments comments){
		return commentDAO.getComments(comments);
		
	}
	
	@Transactional(readOnly = true)
	public Comments getBoard(Comments comments) {
		return commentDAO.getComment(comments);
		
	}
	@Transactional(readOnly = false)
	public int addComment(Comments comments) {
		return commentDAO.addComment(comments);
	}
	
	@Transactional(readOnly = false)
	public int updateComment(Comments comments) {
		return commentDAO.updateComment(comments);
	}
	
	@Transactional(readOnly = false)
	public int deleteComment(Comments comments) {
		return commentDAO.deleteComment(comments);
	}
	
}
