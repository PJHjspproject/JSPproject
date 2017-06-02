<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>deletePro.jsp</h1>
<%

	//delete.jsp(글 삭제시 비밀번호를 작성하는 페이지)에서 삭제할 글 번호, 페이지 넘버값, 작성한 비밀번호 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
	
	//DB객체 생성
	BoardDAO dao = new BoardDAO();
	
	int check = dao.deleteBoard(num,passwd);
	// check == 1. "삭제 성공!" 메시지창 띄우기 -> notice.jsp로 이동
	// check == 0. "비밀번호 틀림" 메시지창 띄우기	-> delete.jsp로 이동(뒤로 이동)	
	
	if(check == 1){
	%>
	<script type="text/javascript">
		alert("삭제 성공!")
		location.href="notice.jsp?pageNum=<%=pageNum%>";
	</script>	
	<%	
	}else{
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림!")
		history.back();
	</script>	
	<%		
	}
%>
	
	









</body>
</html>