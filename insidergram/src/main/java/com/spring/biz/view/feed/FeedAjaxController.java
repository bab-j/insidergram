package com.spring.biz.view.feed;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.biz.feed.FeedService;
import com.spring.biz.feed.FeedVO;
import com.spring.biz.feed.impl.FeedServiceImpl;
@Controller
public class FeedAjaxController {
	@Autowired
	private FeedService feedService;
	
	//좋아요
	@RequestMapping("/user/likeFeed.do")
	public int likeFeed(FeedVO vo) {
		System.out.println("uid : " + vo.getU_id());
		System.out.println("fIdx : " + vo.getF_idx());
		int result = feedService.insertFeed(vo);
		if (result >= 1) {
			System.out.println(">>>> 좋아요 insert 성공!");
		} else {
			System.out.println("..... 좋아요 실패!!");
		}
		return result;
	}
}
