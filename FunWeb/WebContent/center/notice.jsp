<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css?ver=1" rel="stylesheet" type="text/css">
<link href="../css/subpage.css?=ver=1" rel="stylesheet" type="text/css">
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
	//DB작업 객체 생성
	BoardDAO dao = new BoardDAO();
	
	//글 갯수 리턴
	int count = dao.getBoardCount();
	//게시판 글객체를 저장하기 위한 용도
	ArrayList<BoardDto> arr = null;
	SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
	if(count>0){
		//글 목록 리턴
		arr = dao.getBoardList();
	}
	
	System.out.println(count);
	
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
	<h1>Notice[전체 글 갯수 : <%=count %>]</h1>
	<table id="notice">
		<tr align="center"><th class="tno">No.</th>
		    <th class="ttitle">Title</th>
		    <th class="twrite">Writer</th>
		    <th class="tdate">Date</th>
		    <th class="tread">Read</th></tr>
		    <%
		    	if(count==0){
		    		%>
		    		<tr>
		    		<td colspan="5">글이 없습니다.</td>
		    		</tr>
		    		<%
		    	}else{
		    	for(int i=0;i<arr.size();i++){
		    		BoardDto dto = (BoardDto)arr.get(i);
		    		%>
		    		<tr>
		    		<td class="tno"><%=dto.getNum()%></td>
		    		<td class="ttitle"><%=dto.getSubject()%></td>
		    		<td class="twrite"><%=dto.getName() %></td>
		    		<td class="tdate"><%=s.format(dto.getDate())%></td>
		    		<td class="tread"><%=dto.getReadcount()%></td>
		    		</tr>
		    		
			    <%	
		    	
		    	}
		    	
		    	}
		    %>

	</table>
	
	<%
		//각각의 페이지에서.. 로그인후  이동해 올때.. 세션 id 전달 받기
		String id = (String)session.getAttribute("id");
		//세션 값이 있으면  글쓰기 버튼 보이게 설정
		if(id != null){
	%>
	<div id="table_search">
		<input type="button" value="글쓰기" class="btn" onclick="location.href='write.jsp'">
	</div>		
		
	<%		
		}
	%>
	<div id="table_search">
		<input type="text" name="search" class="input_box">
		<input type="button" value="search" class="btn">
	</div>
	<div class="clear"></div>
	<div id="page_control">
	<a href="#">Prev</a>
	<a href="#">1</a><a href="#">2</a><a href="#">3</a>
	<a href="#">4</a><a href="#">5</a><a href="#">6</a>
	<a href="#">7</a><a href="#">8</a><a href="#">9</a>
	<a href="#">10</a>
	<a href="#">Next</a>
	</div>
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




