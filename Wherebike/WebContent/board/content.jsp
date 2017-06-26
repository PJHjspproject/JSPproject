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
<link href="../css/index.css" rel="stylesheet" type="text/css">
<link href="../css/content.css" rel="stylesheet" type="text/css">
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
		/* 글 상세보기 페이지 */
		// notice.jsp페이지에서 글제목을 클릭해서 전달하여 넘어온 num,pageNum 한글처리
		request.setCharacterEncoding("UTF-8");
		
		//num, pageNum 넘겨받기
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		//BoardDAO객체 생성
		BoardDAO dao = new BoardDAO();	
		
		//조회수 1증가
		dao.updateReadCount(num);
		
		//상세 내용을 볼 글에 대한 글 번호 넘겨서 DB로부터 글 정보(dto객체)리턴 받아오기
		BoardDto dto = dao.getBoard(num);
		
		//날짜 포맷 객체 생성
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		int DBnum = dto.getNum();
		int DBReadcount = dto.getReadcount();
		String DBName = dto.getName();
		Timestamp DBDate = dto.getDate();
		String DBSubject = dto.getSubject();
		String DBContent = "";
		//만약 글 내용이 존재한다면 !! // 글 내용 엔터처리
		if(dto.getContent() != null){
			DBContent = dto.getContent().replace("\n", "<br>");
		}
		//답변 달기에 이용할 변수값 받기
		int DBRe_ref = dto.getRe_ref();
		int DBRe_lev = dto.getRe_lev();
		int DBRe_seq = dto.getRe_seq();
		
		System.out.println(DBRe_ref);
		
%>
<body>
	<div class="frame">
		<jsp:include page="../inc/top.jsp" />

		<!-- //header -->
		<div class="container">
			<jsp:include page="../inc/nav.jsp" />
			<!-- //nav -->
			<div class="content">
				<h1>Notice Content</h1>
	<table class="notice">
		<tr>
			<td class="writeMenubar">글 번호</td>
			<td><%=DBnum %></td>
			<td class="writeMenubar">조회수</td>
			<td><%=DBReadcount %></td>
		</tr>
		<tr>
			<td class="writeMenubar">작성자</td>
			<td><%=DBName %></td>
			<td class="writeMenubar">작성일</td>
			<td><%=sdf.format(DBDate) %></td>
		</tr>
		<tr>
			<td class="writeMenubar">글 제목</td>
			<td colspan="3" ><%=DBSubject %></td>
		</tr>
		<tr class="con">
			<td> 글 내용</td>
			<td colspan="3" class="writebox"><%=DBContent %></td>
		</tr>	
	</table>
	
	<%
		//각각의 페이지에서.. 로그인후  이동해 올때.. 세션 id 전달 받기
		String id = (String)session.getAttribute("id");
		//세션 값이 있으면  글쓰기 버튼 보이게 설정
		if(id != null){
	%>
	<div id="table_search">
		<input type="button" value="글 수정" class="btn" onclick="location.href='update.jsp?num=<%=DBnum%>&pageNum=<%=pageNum%>'">
		<input type="button" value="글 삭제" class="btn" onclick="location.href='delete.jsp?num=<%=DBnum%>&pageNum=<%=pageNum%>'">
		<input type="button" value="답글 쓰기" class="btn" 
		onclick="location.href='rewrite.jsp?num=<%=DBnum%>&re_ref=<%=DBRe_ref%>&re_lev=<%=DBRe_lev%>&re_seq=<%=DBRe_seq%>'">	
	<%		
		}
	%>
	<input type="button" value="목록 보기" class="btn">
	</div>

				<div class="clear"></div>
				<div id="page_control"></div>


			</div>
			

			<!-- //footer -->
		</div>
		<jsp:include page="../inc/footer.jsp" />
		<!-- //frame -->
	</div>
</body>
</html>




