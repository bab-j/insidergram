package com.spring.biz.chat;

import java.util.List;

import com.spring.biz.user.UserVO;

public interface ChatService {
	List<ChatHeaderVO> getChatHeaderList(UserVO vo);
}
