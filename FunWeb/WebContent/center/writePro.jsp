<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	//세션값 가져오는 이유 로그인시 글쓰기 작업 비활성화 하고 로그인후 작업가능하게
	//login.jsp 페이지로 이동
	
	String id = (String)session.getAttribute("id");
	//세션값 x시 login.jsp로 이동
	if(id==null){
		response.sendRedirect("../member/login.jsp");
	}
	request.setCharacterEncoding("UTF-8");
%>
<%--액션태그로 BoardBean 객체 생성 --%>
<%--request 값을 전달받아 BoardDto에 저장 --%>
<jsp:useBean id="dto" class="board.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>

<%
	dto.setDate(new Timestamp(System.currentTimeMillis()));
	dto.setIp(request.getRemoteAddr());

	BoardDAO dao = new BoardDAO();
	
	int check = dao.insertBoard(dto);
	if(check==1){
	%>
		<script type="text/javascript">
			alert("글쓰기 성공!");
			location.href="notice.jsp";
		</script>
	<% 
	}else{
	%>
		<script type="text/javascript">
		alert("글쓰기실패!");
		history.back();
		</script>
	<%	
	}
	
%>

</body>
</html>