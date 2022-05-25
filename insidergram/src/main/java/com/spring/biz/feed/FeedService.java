package com.spring.biz.feed;

import java.util.List;

public interface FeedService {
	// CRUD 기능 구현 메소드 정의
	void insertFeed(FeedVO vo);
	void updateFeed(FeedVO vo);
	void deleteFeed(FeedVO vo);
	FeedVO getFeed(FeedVO vo);
	List<FeedVO> getFeedList(FeedVO vo);
}
