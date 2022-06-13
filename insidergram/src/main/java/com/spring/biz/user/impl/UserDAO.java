package com.spring.biz.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.chat.ChatHeaderVO;
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
		System.out.println(
				"mybatis.selectOne(\"userDAO.confirmID\", ID) : " + mybatis.selectOne("userDAO.confirmID", vo));

		return mybatis.selectOne("userDAO.confirmID", vo);
	}

	public void insertUser(UserVO vo) {
		mybatis.insert("userDAO.insertUser", vo);
	}

	public int findId(UserVO vo) {

		return mybatis.selectOne("userDAO.findId", vo);
	}

	public List<UserVO> searchUser(String u_id) {
		return mybatis.selectList("userDAO.searchUser", u_id);
	}

	public UserVO getUserInfo(String u_id) {
		System.out.println("===> MyBatis 사용 getUser() 실행");

		return mybatis.selectOne("userDAO.getUserInfo", u_id);
	}

	public void deleteAccount(String u_id) {
		List<ChatHeaderVO> chList = mybatis.selectList("chatHeaderDAO.getChatHeaderList", u_id);
		System.out.println("chList:>>" + chList.toString());
		for (ChatHeaderVO chvo : chList) {
			//챗 메세지들 삭제
			mybatis.delete("chatMessageDAO.deleteChatMessages", chvo.getH_idx());
			//채팅방 삭제
			mybatis.delete("chatHeaderDAO.deleteChatHeader", chvo.getH_idx());
		}
		//작성한 댓글 삭제
		mybatis.delete("commDAO.deleteComments", u_id);
		//게시글 삭제
		mybatis.delete("feedDAO.deleteFeeds", u_id);
		//팔로우정보 삭제
		mybatis.delete("feedDAO.deleteFollow", u_id);
		//좋아요 삭제
		mybatis.delete("feedDAO.deleteLikes", u_id);
		//저장리스트 삭제
		mybatis.delete("feedDAO.deleteSaves", u_id);
		//계정삭제
		mybatis.delete("userDAO.daleteAccount", u_id);
		}
	
	public String forgetId(UserVO vo) {
		System.out.println("다오vo: " + vo.toString());
		Map<String, String> map = new HashMap<String, String>();
		return mybatis.selectOne("userDAO.forgetId", vo);
	}
}
