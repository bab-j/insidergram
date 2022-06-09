package com.spring.biz.view.chat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.biz.chat.ChatHeaderVO;
import com.spring.biz.chat.ChatMessageVO;
import com.spring.biz.chat.ChatService;
import com.spring.biz.user.UserVO;
import com.spring.common.TIME_MAXIMUM;

@RestController
public class ChatAjaxController {

	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/chat/getChatMessageList.do")
	public List<ChatMessageVO> getChatMessageList(ChatHeaderVO vo, HttpSession session) {
		vo = chatService.getChatHeader(vo.getH_idx());
		UserVO uvo = (UserVO) session.getAttribute("userVO");
		if(vo.getFrom_id().equals(uvo.getU_id())) {
			chatService.updateStatusOpenChatHeader_FROM(vo.getH_idx());
		} else {
			chatService.updateStatusOpenChatHeader_TO(vo.getH_idx());
		}
		List<ChatMessageVO> messages = chatService.getChatMessageList(vo.getH_idx());
			System.out.println("vo:" + vo.getH_idx());
		return messages;
	}
	
	@RequestMapping("/chat/insertChatMessage.do")
	public List<ChatMessageVO> insertChatMessage(ChatMessageVO vo) {
		System.out.println("insertChatMessage.do 요청처리 >>h_idx: " + vo.getH_idx() + "content: " + vo.getContent() + "u_id: " + vo.getU_id() + "u_name: " + vo.getU_name() + "u_pic: " + vo.getU_pic());
		chatService.insertChatMessage(vo);
		ChatHeaderVO chvo = new ChatHeaderVO();
		chvo = chatService.getChatHeader(vo.getH_idx());
		System.out.println("chvooooooooooooooooooooooo:" + chvo.toString());
		chvo.setSubject(vo.getContent());
		
		chatService.updateSubject(chvo);
		chatService.updateStatus(chvo.getH_idx());
		chatService.updateUserRead(chvo, vo);
		List<ChatMessageVO> messages = chatService.getChatMessageList(chvo.getH_idx());
		System.out.println("vo:" + vo.getH_idx());
		return messages;
	}
	
	@RequestMapping("/chat/createChat.do")
	public List<ChatHeaderVO> createChat(String my_id, String target_id) throws ParseException {
		Integer h_idx;
		h_idx = chatService.findChatHeader(my_id, target_id);
		System.out.println("h_idx : " + h_idx);
		List<ChatHeaderVO> list;
		if (h_idx != null) {
			list = chatService.getChatHeaderList(my_id);
			for (ChatHeaderVO vo2 : list) {
				String timeString = vo2.getTime();
				SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				Date timeDate = format.parse(timeString);
				String time = TIME_MAXIMUM.formatTimeString(timeDate);
				System.out.println("몇분전 : " + time);
				vo2.setTime(time);
			}
			return list;
		} else {
			chatService.createChat(my_id, target_id);
			list = chatService.getChatHeaderList(my_id);
			for (ChatHeaderVO vo2 : list) {
				String timeString = vo2.getTime();
				SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				Date timeDate = format.parse(timeString);
				String time = TIME_MAXIMUM.formatTimeString(timeDate);
				System.out.println("몇분전 : " + time);
				vo2.setTime(time);
			}
			return list;
		}
	}
	
}
