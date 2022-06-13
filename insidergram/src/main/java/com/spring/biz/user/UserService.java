package com.spring.biz.user;

import java.util.List;

public interface UserService {
	UserVO getUser(UserVO vo);
	int confirmID(UserVO vo); 
	void insertUser(UserVO vo);
	int findId(UserVO vo);
	List<UserVO> searchUser(String u_id);
	UserVO getUserInfo(String u_id);
	void deleteAccount(String u_id);
	String forgetId(UserVO vo);
	String forgetPwd(UserVO vo);
}
