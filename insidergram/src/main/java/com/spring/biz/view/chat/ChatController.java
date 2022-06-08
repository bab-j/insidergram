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
		UserVO vo = (UserVO)session.getAttribute("userVO");
		System.out.println("userVOOOOOOOOOOOOOO"+vo.toString());
		List<ChatHeaderVO> list = chatService.getChatHeaderList(vo.getU_id());
		System.out.println("listtttttttttttttttttt"+list);
		mo.addAttribute("chatHeaderList", list);
		return "board/dm_test";
	}
	
	@RequestMapping("/chat/feedToDm.do")
	public String feedToDm(String my_id, String target_id, Model mo) {
		System.out.println("u_id:>>" + my_id + ", tid:>>" + target_id);
		Integer h_idx;
		h_idx = chatService.findChatHeader(my_id, target_id);
		if (h_idx != null) {
			mo.addAttribute("chatHeaderList", chatService.getChatHeaderList(my_id)); 
			
		} else {
			chatService.createChat(my_id, target_id);
			h_idx = chatService.findChatHeader(my_id, target_id);
			mo.addAttribute("chatHeaderList", chatService.getChatHeaderList(my_id));
			
		}
		mo.addAttribute("h_idx", h_idx);
		return "board/dm_test";
	}
}
