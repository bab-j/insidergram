package com.spring.biz.user;

public interface UserService {
	UserVO getUser(UserVO vo);
	int confirmID(UserVO vo);
}
