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
		List<FollowerVO> followingIdList = mybatis.selectList("feedDAO.getFollowingIdList", vo);
		System.out.println("followingIdList : " + followingIdList);
		List<FeedVO> feedList = new ArrayList<FeedVO>();
		for (FollowerVO fVo:followingIdList) {
			System.out.println(fVo.getTo_id());
			feedList.add(mybatis.selectOne("feedDAO.getFollowingFeedList", fVo));
			System.out.println("feedList : " + feedList);
		}
		
		return feedList;
	}
	
	//좋아요 상태 확인
	public List<Integer> confirmLike(UserVO uvo) {
		System.out.println("===> MyBatis 사용 confirmLike() 실행!!");
		
		System.out.println("uvo : " + uvo.getU_id());
		List<Integer> likeF_idx = mybatis.selectList("feedDAO.confirmLike", uvo);
		
		return likeF_idx;
	}
	
	

}
