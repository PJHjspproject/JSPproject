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
<h1>writePro.jsp</h1>
<%
	//세션값 가져오는 이유 : 
	//로그인 을 하지않고 글쓰기 작업시!!!!        다시 로그인 처리 하기 위해.....
	//login.jsp페이지로 이동시킬 목적.
	
	//세션값 가져오기 
	String id = (String)session.getAttribute("id");
	
	//세션값이 없으면 login.jsp로 이동!(로그인 하고 게시판에 글을써라!!!!!)
	if(id == null){
		response.sendRedirect("../member/login.jsp");
	}
	
	//write.jsp페이지에서 글쓴내용을 전달받아 한글처리
	request.setCharacterEncoding("UTF-8");
%>
	<%--액션태그로 .....BoardBean객체 생성  --%>
	<jsp:useBean id="dto" class="board.BoardDto"/>
	<%--액션태그로.... request요청값을 전달받아서  BardBean에 저장!!! --%>
	<jsp:setProperty property="*" name="dto"/>
<%
	//추가로  현재 글쓴날짜를  BoardBean객체에 저장!!
	dto.setDate(new Timestamp(System.currentTimeMillis()));
	//추가로 글쓴 사람의 ip주소를   BoardBean객체에 저장!!
	dto.setIp(request.getRemoteAddr());

	//데이터베이스 글추가 작업을 위한 DAO객체 생성
	BoardDAO dao = new BoardDAO();
	
	//insertBoard()메소드(게시판 글추가 메소드 )를  호출시.... 
	//글쓴 내용을 저장하고 있는 BoardBean객체를 전달하여  DB작업함.
	int result = dao.insertBoard(dto); //insert
	
	if(result == 1){ //글추가 성공
%>
	<script type="text/javascript">
		alert("글추가 성공");
		location.href = "notice.jsp";
	</script>
<%		
	}else {
%>	
	<script type="text/javascript">
		alert("글쓰기 실패");
		history.go(-1);
	</script>	
<%		
	}
	
	
// 	//이동 notice.jsp
// 	response.sendRedirect("notice.jsp");
%>





</body>
</html>









