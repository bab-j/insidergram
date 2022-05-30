package com.spring.biz.view.feed;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

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
		//팔로워 게시물, 본인 게시물 메인피드 띄우기
		@RequestMapping("/getFeedList.do")
		public String getFeedList(Model mo, HttpSession session) {
			UserVO uvo = (UserVO)session.getAttribute("userVO");
			List<FeedVO> list = feedService.getFeedList(uvo);
			List<Integer> likeList = feedService.confirmLike(uvo);
			mo.addAttribute("feedList", list);
			mo.addAttribute("likeList", likeList);
			
			return "board/mainFeed";
		}
		//내 피드 상세페이지 띄우기
		@RequestMapping("getIndiFeed.do")
		public String getIndiFeed(HttpServletRequest req) {
			System.out.println("req.getParameter(\"u_id\") : " + req.getParameter("u_id")); 
			return "board/indiFeed";
		}
		//게시물 등록
		@RequestMapping("insertFeed.do")
		public String insertFeed(FeedVO vo, HttpSession session) {
			UserVO uvo = (UserVO)session.getAttribute("userVO");			
			MultipartFile uploadFile = vo.getUploadFile();
			System.out.println("uploadFile : " + uploadFile);
			
			try {
				if(!uploadFile.isEmpty()) {
					vo.setU_id(uvo.getU_id());
					vo.setF_pic(uploadFile.getOriginalFilename());
					vo.setContent(vo.getContent());
					String fileName = uploadFile.getOriginalFilename();
					System.out.println(">>> 원본파일명 : " + fileName);
					System.out.println(">>> 저장파일명 : " + UUID.randomUUID().toString());
					if (System.getProperty("os.name").toLowerCase().contains("mac")) {
						uploadFile.transferTo(new File("/Users/Shared/tempo/feed/" + fileName));						
					} else {
						
					}
					int result = feedService.insertFeed(vo);
					System.out.println(">>>>>>>최종 insert : " + result);
				}
			} catch (IllegalStateException e) {
				System.out.println(">>파일등록 실패!");
				e.printStackTrace();
			} catch (IOException e) {
				System.out.println(">>파일등록 실패!!!");
				e.printStackTrace();
			}
			return "redirect:getFeedList.do";
		}
		
	}