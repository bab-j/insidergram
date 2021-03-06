package com.spring.biz.view.user;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.biz.chat.ChatHeaderVO;
import com.spring.biz.chat.ChatService;
import com.spring.biz.comment.CommentService;
import com.spring.biz.feed.FeedService;
import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;

@RestController
@RequestMapping("/user/**")
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
		public String confirmID(UserVO vo) {
			System.out.println("vo : " + vo);
			int result = 0;
			String str = "";
			result = userService.confirmID(vo);
			if(result == 1) {
				str = "fail";
			} else {
				str = "success";
			}
			return str;
		}
		
		@RequestMapping("/forgetId.do")
		public String forgetId(UserVO vo) {
			System.out.println("vo :>> " + vo.getU_id() + vo.getPhone() + vo.getBirth());
			String idString = userService.forgetId(vo);
			System.out.println(idString);
			return idString;
		}
		
		@RequestMapping("/forgetPwd.do")
		public String forgetPwd(UserVO vo) {
			System.out.println("vo :>> " + vo.getU_id() + vo.getPhone() + vo.getBirth());
			String pwdString = userService.forgetPwd(vo);
			System.out.println(pwdString);
			return pwdString;
		}
		
		@RequestMapping("/seachUser.do")
		public List<UserVO> searchUser(String u_id) {
			List<UserVO> users = userService.searchUser(u_id);
			return users;
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
