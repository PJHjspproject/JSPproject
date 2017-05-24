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
	/*글 상세보기 페이지*/
	//notice.jsp페이지에서 글제목을 클릭해서 절달하여 넘어온 num,pagenum 한글처리
	request.setCharacterEncoding("UTF-8");
	
//notice.jsp페이지에서 글제목을 클릭해서 전달하여 넘어온 값 변수에 저장
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	// BoardDAO 객체생성
	BoardDAO dao = new BoardDAO();
	
	dao.updateReadCount(num);
	
	BoardDto dto = dao.getBoard(num);
	String DBcontent= "";
	if(dto.getContent() !=null){
		DBcontent = dto.getContent().replace("\n", "<br>");
	}
	
	
	SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
	
	
	
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
	<h1>NoticeContent</h1>
	<table id="notice">
		<tr>
			<td>글번호</td>
			<td><%=dto.getNum()%></td>
			<td>글조회수</td>
			<td><%=dto.getReadcount() %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=dto.getName() %></td>
			<td>작성일</td>
			<td><%=s.format(dto.getDate())%></td>
		</tr>
		<tr>
			<td>글제목</td>
			<td colspan="3"><%=dto.getSubject() %></td>
			
		</tr>
		<tr>
			<td>글내용</td>
			<td colspan="3"><%=DBcontent%></td>
			
		</tr>
	</table>
	
	<%
		//각각의 페이지에서.. 로그인후  이동해 올때.. 세션 id 전달 받기
		String id = (String)session.getAttribute("id");
		//세션 값이 있으면  글쓰기 버튼 보이게 설정
		if(id != null){
	%>
	<div id="table_search">
		<input type="button" value="글 수정" class="btn" onclick="location.href='update.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
		<input type="button" value="글 삭제" class="btn" onclick="location.href='delete.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
		<input type="button" value="답글 쓰기" class="btn">
	
		
	<%		
		}
	%>
	<input type="button" value="목록보기" class="btn" onclick="location.href='notice.jsp'">
	</div>		
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




