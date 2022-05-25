package com.spring.biz.feed.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.feed.FeedVO;


@Repository
public class FeedDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public FeedDAO() {
		System.out.println(">> BoardDAOMybatis() 객체 생성");
	}

	//글 입력
	public void insertBoard(FeedVO vo) {
		System.out.println("===> MyBatis 사용 insertBoard() 실행");
		mybatis.insert("boardDAO.insertBoard", vo);
	}
	
	//글 수정
	public void updateBoard(FeedVO vo) {
		System.out.println("===> MyBatis 사용 updateBoard() 실행");
		mybatis.update("boardDAO.updateBoard", vo);
	}

	//글 삭제
	public void deleteBoard(FeedVO vo) {
		System.out.println("===> MyBatis 사용 deleteBoard() 실행");
		mybatis.delete("boardDAO.deleteBoard", vo);
	}

	//글 하나 조회
	public FeedVO getBoard(FeedVO vo) {
		System.out.println("===> MyBatis 사용 getBoard() 실행");
		return mybatis.selectOne("boardDAO.getBoard", vo);
	}

	//글 목록 조회
	public List<FeedVO> getBoardList(FeedVO vo) {
		System.out.println("===> MyBatis 사용 getBoardList() 실행");
		return mybatis.selectList("boardDAO.getBoardList", vo);
	}
	
	//글 목록 조회
	public List<FeedVO> getBoardList2(FeedVO vo) {
		System.out.println("===> MyBatis 사용 getBoardList() 실행");
		List<FeedVO> list = null;
		
		// 검색조건 값이 없을 때 기본값 설정
			
		return list;
	}

}
