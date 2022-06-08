package com.spring.biz.comment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.comment.CommentVO;

@Repository
public class CommentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CommentDAO() {
		System.out.println("CommentDAO() 객체 생성");
	}
	
	public List<CommentVO> getCommList(int f_idx) {
		List<CommentVO> list = mybatis.selectList("commDAO.getCommList", f_idx);
		return list;
	}
}
