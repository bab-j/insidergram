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
	public List<ChatHeaderVO> getChatHeaderList(String u_id) {
		return chatHeaderDAO.getChatHeaderList(u_id);
	}
	
	@Override
	public ChatHeaderVO getChatHeader(int h_idx) {
		return chatHeaderDAO.getChatHeader(h_idx);
	}

	@Override
	public List<ChatMessageVO> getChatMessageList(int h_idx) {
		return chatMessageDAO.getChatMessageList(h_idx);
	}

	@Override
	public void insertChatMessage(ChatMessageVO vo) {
		chatMessageDAO.insertChatMessage(vo);
	}

	@Override
	public void updateSubject(ChatHeaderVO vo) {
		chatHeaderDAO.updateSubject(vo);
		
	}

	@Override
	public void updateStatus(int h_idx) {
		chatHeaderDAO.updateStatus(h_idx);
		
	}

	@Override
	public void updateUserRead(ChatHeaderVO chvo, ChatMessageVO cmvo) {
		chatHeaderDAO.updateUserRead(chvo, cmvo);
		
	}

	@Override
	public void updateStatusOpenChatHeader_FROM(int h_idx) {
		chatHeaderDAO.updateStatusOpenChatHeader_FROM(h_idx);
	}

	@Override
	public void updateStatusOpenChatHeader_TO(int h_idx) {
		chatHeaderDAO.updateStatusOpenChatHeader_TO(h_idx);
	}

	@Override
	public Integer findChatHeader(String my_id, String target_id) {
		return chatHeaderDAO.findChatHeader(my_id, target_id);
	}

	@Override
	public List<ChatMessageVO> openChat(String my_id, String target_id) {
		return chatMessageDAO.openChat(my_id, target_id);
	}

	@Override
	public void createChat(String my_id, String target_id) {
		chatHeaderDAO.createChat(my_id, target_id);
	}

	
}
