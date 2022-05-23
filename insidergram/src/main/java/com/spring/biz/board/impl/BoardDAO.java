package com.spring.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.board.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public BoardDAO() {
		System.out.println(">> BoardDAOMybatis() 객체 생성");
	}

	//글 입력
	public void insertBoard(BoardVO vo) {
		System.out.println("===> MyBatis 사용 insertBoard() 실행");
		mybatis.insert("boardDAO.insertBoard", vo);
	}
	
	//글 수정
	public void updateBoard(BoardVO vo) {
		System.out.println("===> MyBatis 사용 updateBoard() 실행");
		mybatis.update("boardDAO.updateBoard", vo);
	}

	//글 삭제
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> MyBatis 사용 deleteBoard() 실행");
		mybatis.delete("boardDAO.deleteBoard", vo);
	}

	//글 하나 조회
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> MyBatis 사용 getBoard() 실행");
		return mybatis.selectOne("boardDAO.getBoard", vo);
	}

	//글 목록 조회
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> MyBatis 사용 getBoardList() 실행");
		return mybatis.selectList("boardDAO.getBoardList", vo);
	}
	
	//글 목록 조회
	public List<BoardVO> getBoardList2(BoardVO vo) {
		System.out.println("===> MyBatis 사용 getBoardList() 실행");
		List<BoardVO> list = null;
		
		// 검색조건 값이 없을 때 기본값 설정
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		if ("TITLE".equals(vo.getSearchCondition())) {
			list = mybatis.selectList("boardDAO.getBoardList_T", vo.getSearchKeyword());
		} else if ("CONTENT".equals(vo.getSearchCondition())) {
			list = mybatis.selectList("boardDAO.getBoardList_C", vo.getSearchKeyword());
		}
		
		return list;
	}

}
