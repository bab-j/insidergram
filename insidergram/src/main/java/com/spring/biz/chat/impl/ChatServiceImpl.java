package com.spring.biz.chat.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.chat.ChatHeaderVO;
import com.spring.biz.chat.ChatMessageVO;
import com.spring.biz.chat.ChatService;
import com.spring.biz.user.UserVO;

@Service("chatService")
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatHeaderDAO chatHeaderDAO;
	@Autowired
	private ChatMessageDAO chatMessageDAO;
	
	
	@Override
	public List<ChatHeaderVO> getChatHeaderList(UserVO vo) {
		return chatHeaderDAO.getChatHeaderList(vo);
	}

	@Override
	public List<ChatMessageVO> getChatMessageList(ChatHeaderVO vo) {
		return chatMessageDAO.getChatMessageList(vo);
	}

	@Override
	public void insertChatMessage(ChatMessageVO vo) {
		chatMessageDAO.insertChatMessage(vo);
	}
	
}
