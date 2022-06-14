package com.spring.biz.view.feed;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.biz.comment.CommentService;
import com.spring.biz.feed.FeedService;
import com.spring.biz.feed.FeedVO;
import com.spring.biz.feed.Paging;
import com.spring.biz.feed.Path;
import com.spring.biz.follower.FollowerVO;
import com.spring.biz.follower.LikeVO;
import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;
//@Controller
@RestController
public class FeedAjaxController {
	@Autowired
	private FeedService feedService;
	@Autowired
	private CommentService commService;
	@Autowired
	private UserService userService;
	
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
	// 즐겨찾기 등록, 해제
	@RequestMapping("/user/saveFeed.do")
	public int saveFeed(int f_idx, String u_id) {
		System.out.println("f_idx: " + f_idx + ", u_id : " + u_id);
		List<Integer> list = new ArrayList<Integer>();
		// 즐겨찾기 f_idx 리스트 담기
		for (FeedVO fvo : feedService.saveFeedList(u_id)) {
			list.add(fvo.getF_idx());
		}
		// 파라미터로 받아온 f_idx가 list에 담겨있냐에 따라 분기처리
		int result = 0;
		System.out.println("즐겨찾기 list : " + list);
		if (list.contains(f_idx)) {
			result = feedService.unSaveFeed(f_idx, u_id) + 5;
		} else {
			result = feedService.saveFeed(f_idx, u_id);
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
		//------------------각 게시물 댓글 리스트에 Set-------------------
		for(FeedVO fvo : list) {
			fvo.setCountLike(feedService.countLike(fvo.getF_idx()));
			fvo.setComm(commService.getCommList(fvo.getF_idx()));
			System.out.println("fvo.toString() : " + fvo.toString());
		}
		// ----------------즐겨찾기 f_idx 리스트 담기----------------
		List<Integer> saveList = new ArrayList<Integer>();
		for (FeedVO fvo : feedService.saveFeedList(u_id)) {
			saveList.add(fvo.getF_idx());
		}
					// -----------------------------------------------------
		System.out.println(list);
		mo.addAttribute("saveList", saveList);

		//----------------------------------------------------------
		return list;
	}
	
	// 모달창에 띄울 피드정보 보내기
	@RequestMapping("/user/modal.do")
	public Map<String, Object> getFeed(int f_idx, String u_id, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		FeedVO fvo = feedService.oneFeed(f_idx);
		fvo.setComm(commService.getCommList(f_idx));
		fvo.setCountLike(feedService.countLike(f_idx));
		UserVO uvo = (UserVO)session.getAttribute("userVO");
		List<FeedVO> list = feedService.getMyFeed(uvo.getU_id());
		// 내 피드 리스트에 f_idx를 다른 리스트에 담기
		List<Integer> idxList = new ArrayList<Integer>();
		for (FeedVO vo : list) {
			idxList.add(vo.getF_idx());
		}
		Boolean confirm = false;
		if(idxList.contains(f_idx)) {
			 confirm = true;
		}
		map.put("fvo", fvo);
		map.put("confirm", confirm);
		System.out.println("confirm : " + confirm);
		return map;
	}
	
	// 댓글 삽입
	@RequestMapping("user/writeComm.do")
	public Map<String, Object> writeComm(String comm, String u_id, int f_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		int result = commService.writeComm(comm, u_id, f_idx);
		UserVO uvo = userService.getUserInfo(u_id);
		System.out.println("유저 사진 : " + uvo.getU_pic());
		if (result == 1) {
			map.put("comm", comm);
			map.put("u_id", u_id);
			map.put("f_idx", f_idx);
			map.put("u_pic", uvo.getU_pic());
			map.put("check", 1);
		} else {
			map.put("check", 0);
		}
		return map;
	}
	// 피드 삭제
	@RequestMapping("user/deleteFeed.do")
	public int deleteFeed(int f_idx) {
		FeedVO fvo = new FeedVO();
		fvo = feedService.oneFeed(f_idx);
		Path path = new Path();
		File file = new File(path.getPath() + fvo.getF_pic());
		if(file.exists()) { // 파일이 존재하면
			boolean result = file.delete();
		}
		int result = feedService.deleteFeed(f_idx);
		return result;
	}
	
	// 팔로우 팔로워 리스트
	@RequestMapping("user/followInfo.do") 
	public String followInfo(String u_id) {
		
//		List<FollowerVO> myFollowingList = feedService.getFollowingList(uvo.getU_id()); // 팔로잉 정보
//		List<FollowerVO> myFollowerList = feedService.getFollowerList(uvo.getU_id()); // 팔로워 정보
		return null;
	}
	@RequestMapping("user/follow.do")
	public String follow(String my_id, String target_id) {
		feedService.follow(my_id, target_id);
		return "success";
	}
	
	@RequestMapping("user/unFollow.do")
	public String unFollow(String my_id, String target_id) {
		feedService.unFollow(my_id, target_id);
		return "success";
	}
	
	
	
	
	
}
