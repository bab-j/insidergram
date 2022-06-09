package com.spring.biz.feed.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.feed.FeedService;
import com.spring.biz.feed.FeedVO;
import com.spring.biz.follower.FollowerVO;
import com.spring.biz.follower.LikeVO;
import com.spring.biz.user.UserVO;

// @Service : @Component 상속확장 어노테이션
//       비즈니스 로직 처리 서비스 영역에 사용
@Service("feedService")
public class FeedServiceImpl implements FeedService {
	@Autowired // 타입이 일치하는 객체(인스턴스) 주입
	private FeedDAO feedDAO;


	@Override
	public List<FeedVO> getFeedList(String u_id, int begin, int end) {
		return feedDAO.getFeedList(u_id, begin, end);
	}


	@Override
	public List<Integer> confirmLike(String u_id) {
		return feedDAO.confirmLike(u_id);
	}

	
	@Override
	public int insertFeed(FeedVO vo) {
		return feedDAO.insertFeed(vo);
	}


	@Override
	public int insertLike(LikeVO lVO) {
		return feedDAO.insertLike(lVO);
	}

	@Override
	public int deleteLike(LikeVO lvo) {
		return feedDAO.deleteLike(lvo);
	}

	@Override
	public int countLike(int f_idx) {
		return feedDAO.countLike(f_idx);
	}


	@Override
	public int getTotalCount(String u_id) {
		return feedDAO.getTotalCount(u_id);
	}


	@Override
	public List<FeedVO> getMyFeed(String u_id) {
		return feedDAO.getMyFeed(u_id);
	}


	@Override
	public List<FollowerVO> getFollowingList(String u_id) {
		return feedDAO.getFollowingList(u_id);
	}


	@Override
	public List<FollowerVO> getFollowerList(String u_id) {
		return feedDAO.getFollowerList(u_id);
	}


	@Override
	public List<FeedVO> saveFeedList(String u_id) {
		return feedDAO.saveFeedList(u_id);
	}


	@Override
	public int saveFeed(int f_idx, String u_id) {
		return feedDAO.saveFeed(f_idx, u_id);
	}


	@Override
	public int unSaveFeed(int f_idx, String u_id) {
		return feedDAO.unSaveFeed(f_idx, u_id);
	}


	@Override
	public FeedVO oneFeed(int f_idx) {
		return feedDAO.oneFeed(f_idx);
	}



	
}
