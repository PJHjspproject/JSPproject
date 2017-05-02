<%@page import="com.bean.board.BoardDao"%>
<%@page import="com.bean.board.BoardDto"%>
<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dao" class="com.bean.board.BoardDao"/>
<jsp:useBean id="dto" class="com.bean.board.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	dto.setIp(request.getRemoteAddr());
	//now() 함수를 쓰지 않을시
	//dto.setRegdate(new Timestamp(System.currentTimeMillis()));
	//dto에 글쓴 현재시간을 넘긴다.
	dao.insertBoard(dto);
	response.sendRedirect("List.jsp");
%>

<%
/*
	BoardDao dao = new BoardDao();
	BoardDto dto = new BoardDto();
	
	String name = request.getParameter("name");
	//이런식으로 넣고
	dto.setName(name);
	dao.insertBoard(dto);
	*/
%>


%>


	
	