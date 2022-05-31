package com.spring.biz.feed;

import java.util.List;

import com.spring.biz.follower.LikeVO;
import com.spring.biz.user.UserVO;

public interface FeedService {
	// 기능 구현 메소드 정의
	List<FeedVO> getFeedList(UserVO vo);
	List<Integer> confirmLike(UserVO uvo);
	int insertFeed(FeedVO vo);
	int insertLike(LikeVO lvo);
	int countLike(int f_idx);
}
