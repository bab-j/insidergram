package com.spring.biz.chat.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<ChatMessageVO> openChat(String my_id, String target_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("my_id", my_id);
		map.put("target_id", target_id);
		
		return mybatis.selectList("chatMessageDAO.openChat", map);
	}
}
