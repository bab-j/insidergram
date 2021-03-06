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

	// 전체 게시글 수
	public int getTotalCount(String u_id) {
		return mybatis.selectOne("feedDAO.getTotalCount", u_id);
	}

	// 전체 글 목록 조회
	public List<FeedVO> getFeedList(String u_id, int begin, int end) {
		System.out.println("===> MyBatis 사용 getFeedList() 실행");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("u_id", u_id);
		map.put("begin", begin);
		map.put("end", end);
		List<FeedVO> list = mybatis.selectList("feedDAO.getFollowingFeedList", map);
		return list;
	}

	// 글 하나 조회
	public FeedVO oneFeed(int f_idx) {
		System.out.println("===>> MyBatis 사용 oneFeed() 실행~~");
		FeedVO fvo = mybatis.selectOne("feedDAO.oneFeed", f_idx);
		return fvo;
	}

	// 내 게시글 조회
	public List<FeedVO> getMyFeed(String u_id) {
		System.out.println("===> MyBatis 사용 getMyFeed() 실행!!");
		List<FeedVO> list = mybatis.selectList("feedDAO.getMyFeedList", u_id);
		return list;
	}
	// 게시글 삭제
	public int deleteFeed(int f_idx) {
		int result = mybatis.delete("feedDAO.deleteFeed", f_idx);
		return result;
	}

	// 좋아요 상태 확인
	public List<Integer> confirmLike(String u_id) {
		System.out.println("===> MyBatis 사용 confirmLike() 실행!!");

		System.out.println("u_id : " + u_id);
		List<Integer> likeF_idx = mybatis.selectList("feedDAO.confirmLike", u_id);

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

	// 좋아요 해제 하기
	public int deleteLike(LikeVO lvo) {
		int result = mybatis.delete("feedDAO.deleteLike", lvo);
		return result;
	}

	// 좋아요 갯수
	public int countLike(int f_idx) {
		int countLike = mybatis.selectOne("feedDAO.countLike", f_idx);
		return countLike;
	}

	// 내가 팔로잉 하는 리스트 정보
	public List<FollowerVO> getFollowingList(String u_id) {
		List<FollowerVO> list = mybatis.selectList("feedDAO.getFollowingList", u_id);
		return list;
	}

	// 나를 팔로잉 하는 리스트 정보
	public List<FollowerVO> getFollowerList(String u_id) {
		List<FollowerVO> list = mybatis.selectList("feedDAO.getFollowerList", u_id);
		return list;
	}

	// 즐겨찾기 게시물 리스트
	public List<FeedVO> saveFeedList(String u_id) {
		List<FeedVO> list = mybatis.selectList("feedDAO.saveFeedList", u_id);
		return list;
	}

	// 즐겨찾기 등록
	public int saveFeed(int f_idx, String u_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("f_idx", f_idx);
		map.put("u_id", u_id);
		int result = mybatis.insert("feedDAO.saveFeed", map);
		return result;
	}

	// 즐겨찾기 해제
	public int unSaveFeed(int f_idx, String u_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("f_idx", f_idx);
		map.put("u_id", u_id);
		int result = mybatis.insert("feedDAO.unSaveFeed", map);
		return result;
	}

	public void follow(String my_id, String target_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("my_id", my_id);
		map.put("target_id", target_id);
		mybatis.insert("feedDAO.follow", map);
	}

	public void unFollow(String my_id, String target_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("my_id", my_id);
		map.put("target_id", target_id);
		mybatis.delete("feedDAO.unFollow", map);
	}
	
	public void updateFeed(FeedVO fvo) {
		mybatis.update("feedDAO.updateFeed", fvo);
	}
}
