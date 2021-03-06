package com.spring.biz.chat;

import java.util.List;

import com.spring.biz.user.UserVO;

public interface ChatService {
	List<ChatHeaderVO> getChatHeaderList(String u_id);
	List<ChatMessageVO> getChatMessageList(int h_idx);
	void insertChatMessage(ChatMessageVO vo);
	void updateSubject(ChatHeaderVO vo);
	ChatHeaderVO getChatHeader(int h_idx);
	void updateStatus(int h_idx);
	void updateUserRead(ChatHeaderVO chvo, ChatMessageVO cmvo);
	void updateStatusOpenChatHeader_FROM(int h_idx);
	void updateStatusOpenChatHeader_TO(int h_idx);
	Integer findChatHeader(String my_id, String target_id);
	List<ChatMessageVO> openChat(String my_id, String target_id);
	void createChat (String my_id, String target_id);
}
