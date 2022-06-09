package com.spring.biz.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.comment.CommentService;
import com.spring.biz.comment.CommentVO;

@Service("commentService")
public class CommentServiceImpl implements CommentService{
	@Autowired
	public CommentDAO commentDAO;

	@Override
	public List<CommentVO> getCommList(int f_idx) {
		return commentDAO.getCommList(f_idx);
	}

	@Override
	public int writeComm(String comm, String u_id, int f_idx) {
		return commentDAO.writeComm(comm, u_id, f_idx);
	}
	
}
