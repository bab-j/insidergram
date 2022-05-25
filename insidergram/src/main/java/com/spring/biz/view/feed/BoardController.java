package com.spring.biz.view.feed;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.feed.FeedService;
import com.spring.biz.feed.FeedVO;


@Controller
@SessionAttributes("board") // board 라는 이름의 Model 있으면 session 에 저장
@RequestMapping("/board/**")
public class BoardController {
	@Autowired
	private FeedService feedService;
	
	public BoardController() {
		System.out.println("=========== BoardController() 객체 생성");
	}
	
	// 메소드에 선언된 @ModelAttribute 는 리턴된 데이터를 View 에 전달
	// @ModelAttribute 선언된 메소드는 @RequestMapping 메소드보다 먼저 실행
	// 뷰에 전달될 때 설정된 명칭(예: conditionMap)
//	@ModelAttribute("conditionMap")
//	public Map<String, String> searchConditionMap() {
//		System.out.println("=====> Map searchConditionMap() 실행");
//		Map<String, String> conditionMap = new HashMap<String, String>();
//		conditionMap.put("제목", "TITLE");
//		conditionMap.put("내용", "CONTENT");
//		return conditionMap;
//	}
	
	// 리턴 타입 : ModelAndView -> String
	@RequestMapping("/getBoard.do")
	public String getBoard(FeedVO vo, Model model) {
		System.out.println(">> 게시글 상세 보여주기");
		System.out.println("vo : " + vo);
		
		FeedVO feed = feedService.getFeed(vo);
		
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("board", board);
//		mav.setViewName("getBoard.jsp");
		
		model.addAttribute("feed", feed); //Model 객체 사용 View로 데이터 전달
		
		return "board/getBoard";
	}	
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(FeedVO vo, Model model) {
		System.out.println(">>> 게시글 전체 목록 보여주기");
		System.out.println("vo : " + vo);

		//List<BoardVO> boardList = boardDAO.getBoardList();
		List<FeedVO> boardList = feedService.getFeedList(vo);
		
		model.addAttribute("boardList", boardList);
		
		return "board/getBoardList";
	}
	
	@RequestMapping("/insertBoard.do")
	public String insertBoard(FeedVO vo) throws IllegalStateException, IOException {
		System.out.println(">>> 게시글 입력");
		System.out.println("insert vo : " + vo);
		
		//MultipartFile uploadFile =vo.getUploadFile();
		//System.out.println("> uploadFile : " + uploadFile);
		
		/* 파일업로드 관련
		MultipartFile 인터페이스 주요메소드
		String getOriginalFilename() : 업로드할 파일명 찾기
		void transferTo(File dest) : 업로드 할 파일을 업로드(복사) 처리
		boolean isEmpty() : 업로드할 파일 존재 여부(없으면 true 리턴)
		*/
//		if (uploadFile == null) {
//			System.out.println("::: uploadFile 파라미터값이 전달되지 않았습니다");
//		} else if (!uploadFile.isEmpty()) {
//			String fileName = uploadFile.getOriginalFilename();
//			System.out.println(">>> 원본파일명 : " + fileName);
//			System.out.println(">>> 저장파일명 : " + UUID.randomUUID().toString());
//			//uploadFile.transferTo(new File("C:/MyStudy/temp/" + fileName));
//			uploadFile.transferTo(new File("C:/MyStudy/temp/" + UUID.randomUUID().toString()));
//		}
		
		feedService.insertFeed(vo);
		return "redirect:getBoardList.do";
	}
	
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") FeedVO vo) {
		System.out.println(">>> 게시글 수정");
		System.out.println("vo : " + vo);
		
		feedService.updateFeed(vo);
		return "getBoardList.do";
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(FeedVO vo) {
		System.out.println(">>> 게시글 삭제");
		System.out.println("vo : " + vo);
		
		feedService.deleteFeed(vo);
		return "getBoardList.do";
	}

	
}
