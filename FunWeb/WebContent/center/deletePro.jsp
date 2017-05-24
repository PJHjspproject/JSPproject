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
<h1>deletePro.jsp</h1>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//세션값 가져오는 이유 로그인시 글삭제 작업 비활성화 하고 로그인후 작업가능하게
	//login.jsp 페이지로 이동
	//글번호 , 페이지 넘버 ,비밀번호
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");

%>
<%--액션태그로 BoardBean 객체 생성 --%>
<%--request 값을 전달받아 BoardDto에 저장 --%>
<jsp:useBean id="dto" class="board.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>

<%

	BoardDAO dao = new BoardDAO();
	int check = dao.deleteBoard(num, passwd);
	System.out.println("글삭제 결과(0은 실패 1은 성공)"+check);
	if(check==1){
	%>
		<script type="text/javascript">
			alert("글삭제 성공!");
			location.href="notice.jsp?pageNum=<%=pageNum%>";
		</script>
	<% 
	}else{
	%>
		<script type="text/javascript">
		alert("글삭제실패!");
		history.back();
		</script>
	<%	
	}
	
	
%>

</body>
</html>