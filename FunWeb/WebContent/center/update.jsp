<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<%
	// 세션값 가져오기 
	// 세션값을 가져오는 이유 : 글수정 화면에 이름을 뿌려주기 위한 용도 
	String id = (String)session.getAttribute("id");
	//세션값이 없으면 login.jsp로 이동 해서 !!  로그인을 하고  글을 써라!!!
	if(id == null){
		response.sendRedirect("../member/login.jsp");
	}
	//수정할 글번호, 페이지 넘버 가져오기 
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");


	BoardDAO dao = new BoardDAO(); 
	BoardDto dto = dao.getBoard(num);
	
	String passwd = dto.getPasswd();
	String subject = dto.getSubject();
	String content = dto.getContent().replace("\n", "<br/>");
%>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
	<h1>Notice Update</h1>
	<form action="updatePro.jsp?pageNum=<%=pageNum%>" method="post">
		<input type="hidden" name="num" value="<%=num%>">
		
		<table id="notice">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=id %>" readonly="readonly"> </td>
			</tr> 
			<tr>
				<td>비밀번호(입력해야 글수정)</td>
				<td><input type="password" name="passwd"> </td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" name="subject" value="<%=subject%>"></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea name="content"  rows="13" cols="40"  ><%=dto.getContent()%></textarea> </td>
			</tr>
	
		</table>
		<div id="table_search">
			<input type="submit" value="글수정" class="btn">
			<input type="reset" value="다시쓰기" class="btn">
			<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'">
		</div>
	</form>
	
	<div class="clear"></div>
	<div id="page_control"></div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>