package com.spring.biz.view.feed;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.biz.feed.FeedService;
import com.spring.biz.feed.FeedVO;

//@Controller
@RestController //클래스 내의 요청처리 결과가 모두 @ResponseBody 처리됨
public class BoardAjaxController {
	@Autowired
	private FeedService feedService;

	@RequestMapping("/getJsonBoardList.do")
	//@ResponseBody // response 응답객체의 몸체(body)에 데이터 전달
	public List<FeedVO> getAjaxBoardList(FeedVO vo) {
		System.out.println("======= BoardAjaxController.getAjaxBoardList() 실행");
		List<FeedVO> feedList = feedService.getFeedList(vo);
		System.out.println("feedList : " + feedList);
		
		return feedList;
	}
	
	@RequestMapping("/getJsonBoard.do")
	//@ResponseBody
	public FeedVO getAjaxBoard(@RequestBody FeedVO vo) { //@RequestBody post방식 전달데이터 처리
		System.out.println("======= BoardAjaxController.getAjaxBoard() 실행");
		System.out.println("getAjaxBoard() vo : " + vo);
		FeedVO feed = feedService.getFeed(vo);
		System.out.println("getAjaxBoard() board : " + feed);
		
		return feed;
	}
}
