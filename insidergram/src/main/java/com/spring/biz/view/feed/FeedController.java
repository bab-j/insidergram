package com.spring.biz.view.feed;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.feed.FeedService;
import com.spring.biz.feed.FeedVO;
import com.spring.biz.feed.Paging;
import com.spring.biz.feed.Path;
import com.spring.biz.follower.FollowerVO;
import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;


	@Controller
	@RequestMapping("/user/**")
	public class FeedController {
		@Autowired
		private FeedService feedService;
		@Autowired
		private UserService userService;
		
		public FeedController() {
			System.out.println("============= FeedController() 객체 생성 ==================");
		}
		//팔로워 게시물, 본인 게시물 메인피드 띄우기
		@RequestMapping("/getFeedList.do")
		public String getFeedList(Model mo, HttpSession session) {
			UserVO uvo = (UserVO)session.getAttribute("userVO");
			Paging paging = new Paging();
			int totalSize = feedService.getTotalCount(uvo.getU_id());
			//------------- 페이지마다 시작번호 끝번호 Set -----------------
			paging.setTotalRecord(totalSize);
			paging.setTotalPage();
			paging.setEnd(paging.getNowPage() * paging.getNumPerPage());
			paging.setBegin(paging.getEnd() - paging.getNumPerPage() + 1);
			
			if (paging.getEnd() > totalSize ) {
				paging.setEnd(totalSize);
			}
			List<FeedVO> list = feedService.getFeedList(uvo.getU_id(), paging.getBegin(), paging.getEnd());
			//------------------FeedVO에 좋아요 개수 Set-------------------
			for(FeedVO fvo : list) {
				fvo.setCountLike(feedService.countLike(fvo.getF_idx()));
				System.out.println(fvo.toString());
			}
			//----------------------------------------------------------
			List<Integer> saveList = new ArrayList<Integer>();
			// ----------------즐겨찾기 f_idx 리스트 담기----------------
			for (FeedVO fvo : feedService.saveFeedList(uvo.getU_id())) {
				saveList.add(fvo.getF_idx());
			}
			// -----------------------------------------------------
			List<Integer> likeList = feedService.confirmLike(uvo.getU_id());
			mo.addAttribute("saveList", saveList);
			mo.addAttribute("feedList", list);
			mo.addAttribute("likeList", likeList);
			
			return "board/mainFeed";
		}
		//내 피드 띄우기
		@RequestMapping("/getMyFeed.do")
		public String getMyFeed(HttpSession session, Model mo) {
			UserVO uvo = (UserVO)session.getAttribute("userVO");
			String u_id = uvo.getU_id();
			List<FeedVO> list = feedService.getMyFeed(u_id);
			List<FeedVO> picPost = new ArrayList<FeedVO>();
			List<FeedVO> docPost = new ArrayList<FeedVO>();
			List<FeedVO> saveFeed = feedService.saveFeedList(u_id);
			
			for(FeedVO fvo : list) {
				if (fvo.getF_pic() == null) {
					docPost.add(fvo);
				} else {
					picPost.add(fvo);
				}
			}
			List<FollowerVO> followingList = feedService.getFollowingList(u_id);
			List<FollowerVO> followerList = feedService.getFollowerList(u_id);
			System.out.println("saveFeed : " + saveFeed.toString());
			mo.addAttribute("saveFeed", saveFeed);
			mo.addAttribute("picPost", picPost);
			mo.addAttribute("docPost", docPost);
			mo.addAttribute("followerList", followerList);
			mo.addAttribute("followingList", followingList);
			return "board/personalFeed";
		}
		//다른 사람 피드 띄우기
		@RequestMapping("/otherFeed.do")
		public String getOtherFeed(HttpServletRequest req, HttpSession session, Model mo) {
			UserVO uvo = (UserVO)session.getAttribute("userVO");
			String u_id = (String) req.getParameter("u_id");
			System.out.println("uvo.getU_id() : " + uvo.getU_id() + ", u_id : " + u_id);
			
			if (u_id.equals(uvo.getU_id())) {
				return "redirect:getMyFeed.do";
			}
			List<FeedVO> feedList = feedService.getMyFeed(u_id); // 전체 게시물 리스트
			List<FeedVO> picPost = new ArrayList<FeedVO>(); // 사진 게시물 리스트
			List<FeedVO> docPost = new ArrayList<FeedVO>(); // 글 게시물 리스트
			List<FeedVO> saveFeed = feedService.saveFeedList(u_id); // 즐겨찾기 게시물 리스트
			for(FeedVO fvo : feedList) {
				if (fvo.getF_pic() == null) {
					docPost.add(fvo);
				} else {
					picPost.add(fvo);
				}
			}
			List<UserVO> userInfo = userService.searchUser(u_id); // 해당 유저 정보
			List<FollowerVO> followingList = feedService.getFollowingList(u_id); // 팔로잉 정보
			List<FollowerVO> followerList = feedService.getFollowerList(u_id); // 팔로워 정보
			mo.addAttribute("saveFeed", saveFeed);
			mo.addAttribute("picPost", picPost);
			mo.addAttribute("docPost", docPost);
			mo.addAttribute("userInfo", userInfo);
			mo.addAttribute("followerList", followerList);
			mo.addAttribute("followingList", followingList);
			return "board/otherFeed";
		}
		//게시물 등록
		@RequestMapping("insertFeed.do")
		public String insertFeed(FeedVO vo, HttpSession session, HttpServletRequest request) {
			UserVO uvo = (UserVO)session.getAttribute("userVO");			
			MultipartFile uploadFile = vo.getUploadFile();
			vo.setU_id(uvo.getU_id());
			vo.setContent(vo.getContent());
			Path path = new Path();
			System.out.println("path : " + path.getPath());
				if(!uploadFile.isEmpty()) {
					vo.setF_pic(uploadFile.getOriginalFilename());
					String fileName = uploadFile.getOriginalFilename();
					System.out.println(">>> 원본파일명 : " + fileName);
					System.out.println(">>> 저장파일명 : " + UUID.randomUUID().toString());
						try {
							uploadFile.transferTo(new File(path.getPath() + fileName));
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}						
				}
				
				int result = feedService.insertFeed(vo);
				System.out.println(">>>>>>>최종 insert : " + result);
			return "redirect:getFeedList.do";
		}
		
	}