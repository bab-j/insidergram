package com.spring.biz.feed;

import java.util.List;

import com.spring.biz.follower.FollowerVO;
import com.spring.biz.follower.LikeVO;

public interface FeedService {
	// 기능 구현 메소드 정의
	int getTotalCount(String u_id);
	List<FeedVO> getFeedList(String u_id, int begin, int end);
	List<FeedVO> getMyFeed(String u_id);
	List<FeedVO> saveFeedList(String u_id);
	List<Integer> confirmLike(String u_id);
	List<FollowerVO> getFollowingList(String u_id);
	List<FollowerVO> getFollowerList(String u_id);
	int insertFeed(FeedVO vo);
	int insertLike(LikeVO lvo);
	int deleteLike(LikeVO lvo);
	int countLike(int f_idx);
}
