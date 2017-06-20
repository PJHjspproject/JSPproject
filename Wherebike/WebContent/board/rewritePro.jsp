<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
%>
<jsp:useBean id="dto" class="board.BoardDto"/>
<jsp:setProperty property="*" name="dto"/> 

<%
	dto.setDate(new Timestamp(System.currentTimeMillis()));
	dto.setIp(request.getRemoteAddr());

	BoardDAO dao = new BoardDAO();
	//자식글 답변내용 + 부모글의 그룹번호, 들여쓰기 번호, 위치번호)를 지니고 있는 dto객체 전달
	dao.reInsertBoard(dto);
	
	//이동 notice.jsp
	response.sendRedirect("board.jsp");
	
	
%>










</body>
</html>