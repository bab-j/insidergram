package com.spring.biz.view.feed;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.biz.feed.FeedService;
import com.spring.biz.follower.LikeVO;
import com.spring.biz.user.UserVO;
//@Controller
@RestController
public class FeedAjaxController {
	@Autowired
	private FeedService feedService;
	
	//좋아요
	@RequestMapping("/user/likeFeed.do")
	public int likeFeed(LikeVO lvo, HttpSession session) {
		int result = 0;
		if (feedService.confirmLike((UserVO)session.getAttribute("userVO")).contains(lvo.getF_idx())) {
			result = feedService.deleteLike(lvo) + 5;
		} else {
			result = feedService.insertLike(lvo);
			
		}
		return result;
	}
}
