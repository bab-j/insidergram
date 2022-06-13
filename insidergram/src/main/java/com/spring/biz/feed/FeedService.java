package com.spring.biz.feed;

import java.util.List;

import com.spring.biz.follower.FollowerVO;
import com.spring.biz.follower.LikeVO;

public interface FeedService {
	// 기능 구현 메소드 정의
	int getTotalCount(String u_id);
	int deleteFeed(int f_idx);
	List<FeedVO> getFeedList(String u_id, int begin, int end);
	List<FeedVO> getMyFeed(String u_id);
	List<FeedVO> saveFeedList(String u_id);
	List<Integer> confirmLike(String u_id);
	List<FollowerVO> getFollowingList(String u_id);
	List<FollowerVO> getFollowerList(String u_id);
	FeedVO oneFeed(int f_idx);
	int insertFeed(FeedVO vo);
	int insertLike(LikeVO lvo);
	int deleteLike(LikeVO lvo);
	int countLike(int f_idx);
	int saveFeed(int f_idx, String u_id);
	int unSaveFeed(int f_idx, String u_id);
	void follow(String my_id, String target_id);
	void unFollow(String my_id, String target_id);
	void updateFeed(FeedVO fvo);
}
