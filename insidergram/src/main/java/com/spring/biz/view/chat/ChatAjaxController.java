package com.spring.biz.view.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.biz.chat.ChatHeaderVO;
import com.spring.biz.chat.ChatMessageVO;
import com.spring.biz.chat.ChatService;

@RestController
public class ChatAjaxController {

	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/chat/getChatMessageList.do")
	public List<ChatMessageVO> getChatMessageList(ChatHeaderVO vo) {
		List<ChatMessageVO> messages = chatService.getChatMessageList(vo);
			System.out.println("vo:" + vo.getH_idx());
		return messages;
	}
	
	@RequestMapping("/chat/insertChatMessage.do")
	public List<ChatMessageVO> insertChatMessage(ChatMessageVO vo) {
		System.out.println("insertChatMessage.do 요청처리 >>h_idx: " + vo.getH_idx() + "content: " + vo.getContent() + "u_id: " + vo.getU_id() + "u_name: " + vo.getU_name() + "u_pic: " + vo.getU_pic());
		chatService.insertChatMessage(vo);
		ChatHeaderVO chvo = new ChatHeaderVO();
		chvo.setH_idx(vo.getH_idx());
		System.out.println("chvooooooooooooooooooooooo:" + chvo.getH_idx());
		List<ChatMessageVO> messages = chatService.getChatMessageList(chvo);
		System.out.println("vo:" + vo.getH_idx());
		return messages;
	}
}
