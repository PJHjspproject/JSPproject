<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dao" class="com.bean.board.BoardDao"/>
<jsp:useBean id="dto" class="com.bean.board.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	dto.setIp(request.getRemoteAddr());
%>

<%
	dao.insertBoard(dto);
%>

<h2>글이 잘 추가 되었습니다.</h2>
	<a href="List.jsp">메인 화면으로</a>
	