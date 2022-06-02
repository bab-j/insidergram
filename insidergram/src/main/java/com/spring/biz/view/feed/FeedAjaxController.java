package com.spring.biz.view.feed;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.biz.feed.FeedService;
import com.spring.biz.feed.FeedVO;
import com.spring.biz.feed.Paging;
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
		UserVO uvo = (UserVO)session.getAttribute("userVO");
		if (feedService.confirmLike(uvo.getU_id()).contains(lvo.getF_idx())) {
			result = feedService.deleteLike(lvo) + 5;
		} else {
			result = feedService.insertLike(lvo);
			
		}
		return result;
	}
	
	//무한스크롤 처리 게시물 더 불러오기
	@RequestMapping("/user/nextFeed.do")
	public List<FeedVO> getNextFeed(String u_id, int nowPage, Model mo) {
		System.out.println("nowPage : " + nowPage);
		
		Paging paging = new Paging();
		int totalSize = feedService.getTotalCount(u_id);
		paging.setNowPage(nowPage);
		paging.setTotalRecord(totalSize);
		paging.setTotalPage();
		paging.setEnd(nowPage * paging.getNumPerPage());
		paging.setBegin(paging.getEnd() - paging.getNumPerPage() + 1);
		
		if (paging.getEnd() > totalSize ) {
			paging.setEnd(totalSize);
			System.out.println("실행되냐?");
		}
		System.out.println(paging.toString());
		List<FeedVO> list = feedService.getFeedList(u_id, paging.getBegin(), paging.getEnd());
		//------------------FeedVO에 좋아요 개수 Set-------------------
		for(FeedVO fvo : list) {
			fvo.setCountLike(feedService.countLike(fvo.getF_idx()));
		}
		System.out.println(list);
		List<Integer> likeList = feedService.confirmLike(u_id);
		mo.addAttribute("likeList", likeList);
		//----------------------------------------------------------
		
		return list;
	}
}
