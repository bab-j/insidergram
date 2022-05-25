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

	public List<ChatHeaderVO> getChatHeaderList(UserVO vo) {
		System.out.println("===> MyBatis 사용 getFeedList() 실행");
		return mybatis.selectList("chatHeaderDAO.getChatHeaderList");
	}
}
