package com.spring.biz.view.chat;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.chat.ChatHeaderVO;
import com.spring.biz.chat.ChatService;
import com.spring.biz.user.UserVO;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;

	public ChatController() {
		System.out.println("============= ChatController() 객체 생성 ==================");
	}

	@RequestMapping("/chat/getChatHeaderList.do")
	public String getChatHeaderList(Model mo, HttpSession session) {
		UserVO uvo = (UserVO)session.getAttribute("userVO");
		System.out.println("userVOOOOOOOOOOOOOO"+uvo.toString());
		List<ChatHeaderVO> list = new ArrayList<ChatHeaderVO>();
		list = chatService.getChatHeaderList(uvo);
		mo.addAttribute("chatHeaderList", list);
		return "board/test";
	}
	
}
