package com.spring.biz.view.feed;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.biz.feed.FeedService;
import com.spring.biz.follower.LikeVO;
//@Controller
@RestController
public class FeedAjaxController {
	@Autowired
	private FeedService feedService;
	
	//좋아요
	@RequestMapping("/user/likeFeed.do")
	public int likeFeed(LikeVO lvo) {
		System.out.println("uid : " + lvo.getU_id());
		System.out.println("fIdx : " + lvo.getF_idx());
		int result = feedService.insertLike(lvo);
		if (result >= 1) {
			System.out.println(">>>> 좋아요 insert 성공!");
		} else {
			System.out.println("..... 좋아요 실패!!");
		}
		return result;
	}
	//좋아요 해제
	@RequestMapping("/user/unLikeFeed.do")
	public int unLikeFeed(LikeVO lvo) {
		System.out.println("uid : " + lvo.getU_id());
		System.out.println("fIdx : " + lvo.getF_idx());
		int result = feedService.deleteLike(lvo);
		if (result >= 1) {
			System.out.println(">>>> 좋아요 delete 성공!");
		} else {
			System.out.println("..... 좋아요 delete 실패!!");
		}
		return result;
	}
}
