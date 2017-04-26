package com.bean.board;

import java.util.Vector;

/*
dao 클래스는 DB작업을 하는 클래스이다.
dao 클래스를 만들때 팀프로젝트를 한다면
철수는 자유게시판을 만들고, 영희는 취업게시판을 만든다고 한다면
자유게시판에도 글을 읽어오는 기능이 있고 취업게시판에도 글을 읽어오는 기능있다 할때
위두개의 게시판에서 똑같은 글을 읽어오는 기능한다.

문제점 : 똑같은 글을 읽어오는 기능의 메소드를 만든다할때
각각 메소드의 이름을 달리해서 만들어주면 팀원끼리 혼란이 올것이다.

그래서 하나의 메소드에 이름을 정해서 (원칙을 정해) 사용한다면...
메소드를 찾아보기도 쉽고 편리할 것이다.

결론 : 어떠한 기준(원칙)을 정해줄수 있게 하는 것이 인터페이스
 interface = 규칙
*/
//인터페이스에는 상수와 추상메소드만이 들어갈수있다.
//추상메소드의 이름(규칙)을 정해놓은 인터페이스
public interface IBoardDao {
	//DB에 있는 글들을 select해서 가져와서 전체 글리스트를 뿌려주기 위한 추상메소드(틀,규격)
	
	
	//검색기준값과 검색어를 전달 받는메소드 글리스트 검색해서 뿌려주는 메소드
	public Vector getBoardList(String keyField, String keyWord);//선언부
		
	//글쓰기 기능 추상메소드	 dto객체
	public void insertBoard(BoardDto dto);
	//글수정 추상메소드 dto객체
	public void updateBoard(BoardDto dto);
	//글 삭제 추상메소드 글번호를 전달받음
	public void deleteBoard(int no);
	
	//게시판 전체글중 하나의 글 상세보기 기능 추상메소드
	
	public BoardDto getBoard(int num);//select해서 no 받아서 dto객체 다시 리턴
	
	//글 답변기능 추상메소드
	
	public void replyBoard(BoardDto dto);
	
}
