package com.spring.biz.feed.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.feed.FeedService;
import com.spring.biz.feed.FeedVO;

// @Service : @Component 상속확장 어노테이션
//       비즈니스 로직 처리 서비스 영역에 사용
@Service("feedService")
public class FeedServiceImpl implements FeedService {
	@Autowired // 타입이 일치하는 객체(인스턴스) 주입
	private FeedDAO feedDAO;


	@Override
	public List<FeedVO> getFeedList() {
		return feedDAO.getFeedList();
	}

	
}
