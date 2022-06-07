package com.spring.biz.chat.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.chat.ChatHeaderVO;
import com.spring.biz.chat.ChatMessageVO;
import com.spring.biz.user.UserVO;

@Repository
public class ChatHeaderDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ChatHeaderDAO() {
		System.out.println(">> ChatHeader() 객체 생성");
	}

	public List<ChatHeaderVO> getChatHeaderList(UserVO vo) {
		System.out.println("===> MyBatis 사용 getchatList() 실행" + vo.toString());
		return mybatis.selectList("chatHeaderDAO.getChatHeaderList", vo);
	}
	
	public ChatHeaderVO getChatHeader(int h_idx) {
		return mybatis.selectOne("chatHeaderDAO.getChatHeader", h_idx);
	}
	
	public void updateSubject(ChatHeaderVO vo) {
		mybatis.update("chatHeaderDAO.updateSubject", vo);
	}
	
	public void updateStatus(int h_idx) {
		mybatis.update("chatHeaderDAO.updateStatus", h_idx);
	}
	
	public void updateUserRead(ChatHeaderVO chvo, ChatMessageVO cmvo) {
		if(cmvo.getU_id().equals(chvo.getFrom_id())) {
			mybatis.update("chatHeaderDAO.updateFromUserRead", chvo);
		} else {
			mybatis.update("chatHeaderDAO.updateToUserRead", chvo);
		}
	}
	
	public void updateStatusOpenChatHeader_FROM(int h_idx) {
		mybatis.update("chatHeaderDAO.updateStatusOpenChatHeader_FROM", h_idx);
	}
	
	public void updateStatusOpenChatHeader_TO(int h_idx) {
		mybatis.update("chatHeaderDAO.updateStatusOpenChatHeader_TO", h_idx);
	}
	
	public int findChatHeader(String my_id, String target_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("my_id", my_id);
		map.put("target_id", target_id);
		
		return mybatis.selectOne("chatHeaderDAO.findChatHeader", map);
	}
	
	public void createChat(String my_id, String target_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("my_id", my_id);
		map.put("target_id", target_id);
		mybatis.insert("chatHeaderDAO.createChat", map);
	}
	
	
	
}
