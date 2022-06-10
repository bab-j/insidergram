package com.spring.biz.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;

@Controller
@RequestMapping("/user/**")
public class UserController {
	@Autowired
	private UserService userService;
	
	public UserController() {
		System.out.println("=========== UserController() 객체 생성");
	}

	//@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@PostMapping("/login.do") // 4.3 버전부터 사용가능 + <mvc:annotation-driven />
	public String login(UserVO vo, HttpSession session) {
		System.out.println(">>> 로그인 처리 - login()");
		System.out.println("vo : " + vo);
		
		//일부러 예외 발생
		if (vo.getU_id() == null || vo.getU_id().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다");
		}
		UserVO user = userService.getUser(vo);
		System.out.println("user : " + user);
		
		if (user != null) {
			System.out.println(">> 로그인 성공!!!");
			session.setAttribute("userVO", user);
			//return "redirect:../board/getBoardList.do";
			return "redirect:getFeedList.do";
		} else {
			System.out.println(">> 로그인 실패~~~");
			return "user/login";
		}
	}
	
	/* @ModelAttribute : 모델(Model)의 속성값으로 저장(속성명 별도 지정)
	 * 별도 명칭 부여 안하면 <데이터타입>의 첫글자 소문자로 작성된 명칭 사용
	 * @ModelAttribute UserVO ---> 속성명 userVO 명칭 사용
	 * @ModelAttribute("user") UserVO --> 속성명 user 사용
	 */
	//@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	@GetMapping("/login.do")
	public String loginView() { 
		System.out.println(">>> 로그인 화면 이동 - loginView()"); 
		 
		return "user/login"; 
	} 
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		System.out.println(">>> 로그아웃 처리");
		session.invalidate();
		
		return "redirect:../../biz/user/login.do";
	}
	
	@RequestMapping("/insertUser.do") 
	public String insertUser(UserVO vo) {
		System.out.println("insertUser()실행 >> userVO : " + vo.toString());
		userService.insertUser(vo);
		return "user/login";
	}
	
	@RequestMapping("/deleteAccount.do")
	public String deleteAccount(String u_id) {
		userService.deleteAccount(u_id);
		return "user/login";
	}
}
