package com.spring.biz.feed.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.feed.FeedVO;
import com.spring.biz.follower.FollowerVO;
import com.spring.biz.follower.LikeVO;
import com.spring.biz.user.UserVO;


@Repository
public class FeedDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public FeedDAO() {
		System.out.println(">> FeedDAO() 객체 생성");
	}

	
	//글 목록 조회
	public List<FeedVO> getFeedList(UserVO vo) {
		System.out.println("===> MyBatis 사용 getFeedList() 실행");
		List<FeedVO> list = mybatis.selectList("feedDAO.getFollowingFeedList", vo);
		return list;
	}
	
	//좋아요 상태 확인
	public List<Integer> confirmLike(UserVO uvo) {
		System.out.println("===> MyBatis 사용 confirmLike() 실행!!");
		
		System.out.println("uvo : " + uvo.getU_id());
		List<Integer> likeF_idx = mybatis.selectList("feedDAO.confirmLike", uvo);
		
		return likeF_idx;
	}
	// 게시물 올리기
	public int insertFeed(FeedVO vo) {
		int result = mybatis.insert("feedDAO.insertFeed", vo);
		if (result >= 1) {
			System.out.println(">>> 게시물 등록(DB 입력) 성공띠~");
		} else {
			System.out.println(">>>>>> 게시물 등록 실패 띠~!#~!#");
		}
		
		return result;
	}
	// 좋아요하기
	public int insertLike(LikeVO lvo) {
		int result = mybatis.insert("feedDAO.insertLike", lvo);
		return result;
	}
	// 좋아요 갯수
	public int countLike(int f_idx) {
		int countLike = mybatis.selectOne("feedDAO.countLike", f_idx);
		return countLike;
	}
}
