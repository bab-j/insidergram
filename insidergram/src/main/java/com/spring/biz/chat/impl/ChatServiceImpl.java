package com.spring.biz.chat.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.biz.chat.ChatService;

public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatHeaderDAO chatHeaderDAO;
	@Autowired
	private ChatMessageDAO chatMessageDAO;
}
