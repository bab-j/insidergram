package com.spring.biz.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.user.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserDAO() {
		System.out.println(">> UserDAO() 객체 생성");
	}
	
	public UserVO getUser(UserVO vo) {
		System.out.println("===> MyBatis 사용 getUser() 실행");
		
		return mybatis.selectOne("userDAO.getUser", vo);
	}
	
	public int confirmID(UserVO vo) { 
		System.out.println("===> MyBatis 아이디 확인@!@!@!@!@"); 
		System.out.println("mybatis.selectOne(\"userDAO.confirmID\", ID) : " + mybatis.selectOne("userDAO.confirmID", vo)); 
		 
		return mybatis.selectOne("userDAO.confirmID", vo); 
	}
	
	public void insertUser(UserVO vo) {
		mybatis.insert("userDAO.insertUser", vo);
	}
	
	public int findId(UserVO vo) { 
		 
		return mybatis.selectOne("userDAO.findId", vo); 
	}
}
