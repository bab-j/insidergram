package com.spring.biz.view.user;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.feed.Path;
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
	
	
	@RequestMapping("/userUpdateOk.do") 
	public String userUpdateOk(UserVO vo, HttpSession session, MultipartFile uploadFile) {
		System.out.println(vo.toString());
		
		UserVO uvo =(UserVO)session.getAttribute("userVO");
		vo.setU_id(uvo.getU_id());
		
		if(!uploadFile.isEmpty()) {
			Path path = new Path();
			vo.setU_pic(uvo.getU_pic());
			File file = new File(path.getPath() + "/profile/" + vo.getU_pic());
			if(file.exists()) { // 파일이 존재하면
				file.delete();
			}
			vo.setU_pic(uploadFile.getOriginalFilename());
			String fileName = uploadFile.getOriginalFilename();
			System.out.println(">>> 원본파일명 : " + fileName);
			System.out.println(">>> 저장파일명 : " + UUID.randomUUID().toString());
				try {
					uploadFile.transferTo(new File(path.getPath() + "/profile/" + fileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}						
		} else vo.setU_pic(uvo.getU_pic());
		
		userService.updateUser(vo);
		session.setAttribute("userVO", userService.getUserInfo(vo.getU_id()));
		return "redirect:getMyFeed.do";
	}
}
