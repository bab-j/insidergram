package com.spring.biz.feed.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.feed.FeedVO;


@Repository
public class FeedDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public FeedDAO() {
		System.out.println(">> FeedDAO() 객체 생성");
	}

	
	//글 목록 조회
	public List<FeedVO> getFeedList() {
		System.out.println("===> MyBatis 사용 getFeedList() 실행");
		return mybatis.selectList("feedDAO.getFeedList");
	}
	
	

}
