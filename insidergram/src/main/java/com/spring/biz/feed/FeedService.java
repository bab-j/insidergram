package com.spring.biz.feed;

import java.util.List;

import com.spring.biz.user.UserVO;

public interface FeedService {
	// CRUD 기능 구현 메소드 정의
	List<FeedVO> getFeedList(UserVO vo);
}
