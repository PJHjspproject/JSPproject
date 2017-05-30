<%@page import="board.BoardDto"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
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
/*글 수정 페이지를 위한 글 상세보기*/

//세션값 가져오기
String id = (String)session.getAttribute("id");

//세션 값이 없으면 login.jsp로 이동 <--- 로그인하고 수정!
if(id == null){
	response.sendRedirect("../member/login.jsp");
}

//request영역의 데이터 한글처리
request.setCharacterEncoding("UTF-8");

//content.jsp에서 글 수정 버튼을 클릭했을 때. 
//전달 받은 num,pageNum값 request영역에서 꺼내오기
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");

//DB작업할 객체 생성
BoardDAO dao = new BoardDAO();	
//글 수정 상세 내용을 볼 글에 대한 글 번호를 전달하여 DB로부터 검색한 글 정보를
//dto객체에 담아서 dto객체 자체를 리턴한다.
BoardDto dto= dao.getBoard(num);

int DBnum = dto.getNum(); //수정할 글 번호 리턴
String DBName = dto.getName(); //작성자
String DBSubject = dto.getSubject(); //글 제목
String DBContent = dto.getContent().replace("\n", "<br>");
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
	<form action="updatePro.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="pageNum" value="<%=pageNum %>">
	<table id="notice">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=DBName%>" readonly="readonly"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td>글 제목</td>
			<td><input type="text" name="subject" value="<%=DBSubject%>"></td>
		</tr>
		<tr>
			<td>글 내용</td>
			<td><textarea name="content" rows="13" cols="40"><%=DBContent%></textarea></td>
		</tr>	
	</table>	
	<div id="table_search">
		<input type="submit" value="글 수정" class="btn">
		<input type="reset" value="다시 작성" class="btn">	
		<input type="button" value="목록 보기" class="btn"
			   onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'">
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




