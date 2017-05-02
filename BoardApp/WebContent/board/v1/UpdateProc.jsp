<%@page import="com.bean.board.BoardDto"%>
<%@page import="com.bean.board.BoardDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="dao" class="com.bean.board.BoardDao"/>
<jsp:useBean id="dto" class="com.bean.board.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>


<%
	dao.updateBoard(dto);
	
%>

<h2>수정이 완료되었습니다.</h2>
	<a href="List.jsp">메인 화면으로</a>
	