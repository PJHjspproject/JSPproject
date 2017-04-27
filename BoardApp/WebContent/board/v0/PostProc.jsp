<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dao" class="com.bean.board.BoardDao"/>
<jsp:useBean id="dto" class="com.bean.board.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>


<%
	dao.insertBoard(dto);
%>f