package com.spring.biz.comment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return mybatis.selectList("commDAO.getCommList", f_idx);
	}
	
	public int writeComm(String comm, String u_id, int f_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comm", comm);
		map.put("u_id", u_id);
		map.put("f_idx", f_idx);
		return mybatis.insert("commDAO.writeComm", map);
	}
}
