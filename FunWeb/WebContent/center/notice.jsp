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

	
	//하나의 화면 마다 보여줄 글개수 15
	int pageSize = 5;
	
	//현재 보여질(선택한) 페이지번호 가져오기
	String pageNum = request.getParameter("pageNum");
	
	//현재 보여질(선택한) 페이지번호가 없으면 1페이지로 처리
	if(pageNum == null){
		pageNum = "1";
	}
	
	/*현재 보여질(선택한) 페이지 번호*/
	//현재 보여질(선택한) 페이지번호 "1" -> 기본정수 1로 변경
	int currentPage = Integer.parseInt(pageNum);
	
	
	/*각페이지 마다 위쪽에 첫번쨰로 보여질 시작 글번호 구하기*/
	//(현재 보여질 페이지번호 - 1) * 한페이지당 보여질 글개수 15
	int startRow = (currentPage - 1) * pageSize;
	
	
	//글조회수 또는 글목록 을 select하여 DB작업 하기 위한 DAO객체 생성
	BoardDAO boardDAO = new BoardDAO();

	//전체 글개수 리턴 받기 
	int count = boardDAO.getBoardCount();
	
	//게시판 글객체(Boarddto)를 저장하기 위한 용도  ArrayList
	ArrayList<BoardDto> arrayList = null;
	
	//만약  게시판에 글이 있다면...
	if(count > 0){
		//글목록 가져오기 
		//getBoardList(각페이지마다 맨위에 첫번쨰로 보여질 시작글번호, 한페이지당 보여줄 글개수);
		arrayList = boardDAO.getBoardList(startRow, pageSize);		
	}
	
	//날짜 포맷 객체 생성
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	
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
	<h1>Notice[전체글개수 : <%=count %>]</h1>
	<table id="notice">
		<tr>
			<th class="tno">No.</th>
		    <th class="ttitle">Title</th>
		    <th class="twrite">Writer</th>
		    <th class="tdate">Date</th>
		    <th class="tread">Read</th>
		</tr>
		<%
		if(count > 0){//DB게시판에 글이 있다.
			
			for(int i=0; i<arrayList.size(); i++){
				BoardDto dto =  arrayList.get(i);
		%>
			<tr onclick="location.href='content.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
				<td><%=dto.getNum() %></td>
			    <td class="left">
			    <%
			    	int wid = 0; // 답변 글에 대한 들여 쓰기 값 저장 변수
			    	//답변글에 대한 들여쓰기 값이 0보다 크다면
			    	if(dto.getRe_lev()>0){
			    		//들여쓰기 값 처리
			    		wid = dto.getRe_lev()*30;
			    %>
			    	<img alt="" src="../images/level.gif" width="<%=wid%>" height="15">
			    	<img alt="" src="../images/re.gif">
			    <%			
			    	}    
			    %>
			 	<%=dto.getSubject() %></td>
			    <td><%=dto.getName() %></td>
			    <td><%=sdf.format(dto.getDate()) %></td>
			    <td><%=dto.getReadcount() %></td>
			</tr>
		<%	
			}
			
		}else{//DB게시판에 글이 없다면
		%>	
		<tr>
			<td colspan="5"> 게시판에 글 없음</td>
		</tr>
		<%				
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
	<%
		if(count > 0){//count=전체 글 개수
			//전체 페이지수 구하기
			//전체 페이지수 = 전체 글 개수 / 한 페이지당 보여줄 글 수 + (전체 글 수를 한페이지에 보여줄 글 수로 나눈 나머지 값)
			int pageCount = (count / pageSize) + (count % pageSize == 0? 0 : 1);
		
			//한 화면에 보여줄 페이지 수
			int pageBlock = 3;
			
	/* 시작 페이지 번호 구하기 */
	// 1~10 => 1 , 11~20 => 11 , 21~30 => 21
	// {(현재 보여질 (선택한)페이지 번호 / 한 화면에 보여줄 페이지 수) 
	// - (현재 보여질 (선택한)페이지 번호를 한 화면에 보여줄 페이지수로 나눈 나머지 값)}
	// * 한 화면(블럭)에 보여줄 페이지 수 + 1
			
	int startPage = ((currentPage / pageBlock) - (currentPage % pageBlock==0? 1:0)) * pageBlock + 1;
		
	/* 끝 페이지 번호 구하기 */
	// 1~10 => 10, 11~20 => 20 ...
	// 시작 페이지 번호 + 현재 블럭에 보여질 페이지 수 - 1
	int endPage = startPage + pageBlock - 1;
			
	//만약에 끝 페이지 번호가 전체 페이지수보다 클 때
	if(endPage > pageCount){
		//끝 페이지 번호를 전체 페이지수로 저장
		endPage = pageCount;
		
	}
	//[이전]	시작 페이지 번호가 한 화면에 보여줄 페이지수보다 클 때.
	if(startPage > pageBlock){
		//[1][2][3]...[10]
						
	%> <a href="notice.jsp?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	<%
	}
	//[1][2][3]...[10]
	for(int i=startPage; i<=endPage; i++){
	%>
		<a href="notice.jsp?pageNum=<%=i%>">[<%=i%>]</a>
	<%
	}
	//[다음] 끝 페이지 번호가 전체 페이지수보다 작을 때.
	if(endPage < pageCount){
	%>
		<a href="notice.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
	<%
	}
	
}//바깥 if문
		
%>
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




