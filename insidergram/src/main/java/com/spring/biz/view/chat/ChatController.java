package com.spring.biz.view.chat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.spring.common.TIME_MAXIMUM;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;

	public ChatController() {
		System.out.println("============= ChatController() 객체 생성 ==================");
	}

	@RequestMapping("/chat/getChatHeaderList.do")
	public String getChatHeaderList(Model mo, HttpSession session) throws ParseException {
		UserVO vo = (UserVO) session.getAttribute("userVO");
		System.out.println("userVOOOOOOOOOOOOOO" + vo.toString());
		List<ChatHeaderVO> list = chatService.getChatHeaderList(vo.getU_id());

		// 시간구하기(~~전)
		for (ChatHeaderVO vo2 : list) {
			String timeString = vo2.getTime();
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date timeDate = format.parse(timeString);
			String time = TIME_MAXIMUM.formatTimeString(timeDate);
			System.out.println("몇분전 : " + time);
			vo2.setTime(time);
		}
		System.out.println("listtttttttttttttttttt" + list);
		mo.addAttribute("chatHeaderList", list);
		return "board/dm_test";
	}

	@RequestMapping("/chat/feedToDm.do")
	public String feedToDm(String my_id, String target_id, Model mo) throws ParseException {
		System.out.println("u_id:>>" + my_id + ", tid:>>" + target_id);
		Integer h_idx;
		h_idx = chatService.findChatHeader(my_id, target_id);
		List<ChatHeaderVO> list;
		if (h_idx != null) {
			list = chatService.getChatHeaderList(my_id);
			for (ChatHeaderVO vo2 : list) {
				String timeString = vo2.getTime();
				SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:SS");
				Date timeDate = format.parse(timeString);
				String time = TIME_MAXIMUM.formatTimeString(timeDate);
				System.out.println("몇분전 : " + time);
				vo2.setTime(time);
			}
			mo.addAttribute("chatHeaderList", list);

		} else {
			chatService.createChat(my_id, target_id);
			h_idx = chatService.findChatHeader(my_id, target_id);
			list = chatService.getChatHeaderList(my_id);
			for (ChatHeaderVO vo2 : list) {
				String timeString = vo2.getTime();
				SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:SS");
				Date timeDate = format.parse(timeString);
				String time = TIME_MAXIMUM.formatTimeString(timeDate);
				System.out.println("몇분전 : " + time);
				vo2.setTime(time);
			}
			mo.addAttribute("chatHeaderList", list);

		}
		mo.addAttribute("h_idx", h_idx);
		return "board/dm_test";
	}
}
