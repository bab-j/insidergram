package com.spring.biz.board;

public class BoardTest {

	public static void main(String[] args) {
		BoardVO vo = new BoardVO();
		vo.setTitle("테스트2");
		vo.setWriter("홍길동2");
		vo.setContent("테스트2-내용");
/*		
		BoardDAO dao = new BoardDAO();
		dao.insertBoard(vo);
*/		
		
/*		
		vo.setSeq(3);
		System.out.println("수정전 DB데이터 vo : " + dao.getBoard(vo));
		vo.setTitle("테스트3");
		vo.setWriter("홍길동3");
		vo.setContent("테스트3-내용");
		System.out.println("수정할 데이터 vo : " + vo);
		dao.updateBoard(vo);
		System.out.println("수정후 DB데이터 vo : " + dao.getBoard(vo));
		
		System.out.println("---------------");
		vo.setSeq(6);
		System.out.println("삭제전 DB데이터 vo : " + dao.getBoard(vo));
		dao.deleteBoard(vo);
		System.out.println("삭제후 DB데이터 vo : " + dao.getBoard(vo));
		
		
		System.out.println("======================");
		List<BoardVO> list = dao.getBoardList();
		for (BoardVO board : list) {
			System.out.println(board);
		}
*/
	}

}
