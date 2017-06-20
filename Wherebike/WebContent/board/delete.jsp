<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/index.css" rel="stylesheet" type="text/css">

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
	// 세션값을 가져오는 이유 : 글 삭제 화면에서 로그인 처리를 위해 가져옴.
	String id = (String)session.getAttribute("id");

	// 세션값이 없으면 login.jsp로 이동해서 !!  로그인을 하고  삭제해라!!!
	if(id == null){
		response.sendRedirect("../Member/login.jsp");
	}
	// content.jsp에서 삭제할 글 번호, 페이지 넘버값 가져오기.
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	
	
	
	
	
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
<jsp:include page="../inc/nav.jsp"/>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
	<h1>Notice Delete</h1>
	<form action="deletePro.jsp?pageNum=<%=pageNum %>" method="post">
		<!-- deletePro.jsp로 이동시 .. 삭제할 글 번호 전달 히든으로 -->
		<input type="hidden" name="num" value="<%=num%>">
		<table id="notice">
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"> </td>
			</tr>
		</table>
		<div id="table_search">
			<input type="submit" value="글 삭제" class="btn">
			<input type="reset" value="다시 쓰기" class="btn">
			<input type="button" value="글 목록" class="btn" 
				   onclick="location.href='board.jsp?pageNum=<%=pageNum%>'">
		</div>
	</form>	
	<div class="clear"></div>
	<div id="page_control"></div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>




