package com.spring.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;
	
	public UserServiceImpl() {
		System.out.println(">> UserServiceImpl() 객체 생성");
	}
	
	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public int confirmID(UserVO vo) { 
		return userDAO.confirmID(vo); 
	}

	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
		
	}

	@Override
	public int findId(UserVO vo) {
		return userDAO.findId(vo);
	}

	@Override
	public List<UserVO> searchUser(String u_id) {
		// TODO Auto-generated method stub
		return userDAO.searchUser(u_id);
	}
}
