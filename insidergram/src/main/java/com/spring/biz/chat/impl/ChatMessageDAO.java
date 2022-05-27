package com.spring.biz.chat.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.chat.ChatHeaderVO;
import com.spring.biz.chat.ChatMessageVO;

@Repository
public class ChatMessageDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ChatMessageVO> getChatMessageList(ChatHeaderVO vo) {
		System.out.println("===> MyBatis 사용 getchatMessageList() 실행" + vo.toString());
		return mybatis.selectList("chatMessageDAO.getChatMessageList", vo);
	}
	
	public void insertChatMessage(ChatMessageVO vo) {
		System.out.println("===> MyBatis 사용 insertChatMessage() 실행" + vo.toString());
		mybatis.insert("chatMessageDAO.insertChatMessage", vo);
	}
}
