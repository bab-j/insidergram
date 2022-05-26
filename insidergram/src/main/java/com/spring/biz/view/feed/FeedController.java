package com.spring.biz.view.feed;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.feed.FeedService;
import com.spring.biz.feed.FeedVO;
import com.spring.biz.user.UserVO;


//@Controller
////@SessionAttributes("feed") // feed 라는 이름의 Model 있으면 session 에 저장
//@RequestMapping("/feed/**")
//public class FeedController {
//	@Autowired
//	private FeedService feedService;
//	
//	public FeedController() {
//		System.out.println("=========== BoardController() 객체 생성");
//	}
//	
//	@RequestMapping("/getBoardList.do")
//	public String getBoardList(FeedVO vo, Model model) {
//		System.out.println(">>> 게시글 전체 목록 보여주기");
//		System.out.println("vo : " + vo);
//
//		//List<BoardVO> boardList = boardDAO.getBoardList();
//		List<FeedVO> boardList = feedService.getFeedList(vo);
//		
//		model.addAttribute("boardList", boardList);
//		
//		return "board/getBoardList";
//	}
//	
//}
	@Controller
	@RequestMapping("/user/**")
	public class FeedController {
		@Autowired
		private FeedService feedService;
		
		public FeedController() {
			System.out.println("============= FeedController() 객체 생성 ==================");
		}
		
		@RequestMapping("getFeedList.do")
		public String getFeedList(Model mo, HttpSession session) {
			
			List<FeedVO> list = feedService.getFeedList((UserVO)session.getAttribute("userVO"));
			mo.addAttribute("feedList", list);
			return "board/mainFeed";
		}
		
		
		
		
		
	}