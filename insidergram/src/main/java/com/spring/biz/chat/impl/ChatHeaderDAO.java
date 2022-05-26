package com.spring.biz.chat.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.chat.ChatHeaderVO;
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
}
