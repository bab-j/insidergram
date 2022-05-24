package com.spring.biz.view.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;
import com.spring.biz.user.UserService;
import com.spring.biz.user.impl.UserDAO;

@RestController
public class UserAjaxController {
	//@Controller
	 //클래스 내의 요청처리 결과가 모두 @ResponseBody 처리됨

		@Autowired
		private UserService userService;

		//@ResponseBody // response 응답객체의 몸체(body)에 데이터 전달
//		public List<BoardVO> getAjaxBoardList(BoardVO vo) {
//			System.out.println("======= BoardAjaxController.getAjaxBoardList() 실행");
//			List<BoardVO> boardList = userService.getBoardList(vo);
//			System.out.println("boardList : " + boardList);
//			
		//return boardList;
//		}
		@RequestMapping("/confirmID.do")
<<<<<<< Updated upstream
		public int confirmID(String id) {
=======
<<<<<<< Updated upstream
		public String confirmID(UserVO vo) {
			System.out.println("vo : " + vo);
=======
		@ResponseBody
		public int confirmID(String id) {
			
			System.out.println(">>id : " + id);
>>>>>>> Stashed changes
>>>>>>> Stashed changes
			int result = 0;
			result = userService.confirmID(id);
			
			return result;
		}
		
//		@RequestMapping("/getJsonBoard.do")
//		//@ResponseBody
//		public BoardVO getAjaxBoard(@RequestBody BoardVO vo) { //@RequestBody post방식 전달데이터 처리
//			System.out.println("======= BoardAjaxController.getAjaxBoard() 실행");
//			System.out.println("getAjaxBoard() vo : " + vo);
//			BoardVO board = boardService.getBoard(vo);
//			System.out.println("getAjaxBoard() board : " + board);
//			
//			return board;
//		}
}
