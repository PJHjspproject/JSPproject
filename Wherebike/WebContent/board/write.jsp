<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String id = (String)session.getAttribute("id");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/index.css">

</head>
<body>
	<div class="frame">
		<jsp:include page="../inc/top.jsp" />

		<!-- //header -->
		<div class="container">
			<jsp:include page="../inc/nav.jsp" />
			<!-- //nav -->
			<div class="content">
				<h1>Notice Write</h1>
				<form action="writePro.jsp" method="post">
					<table id="notice">
						<tr>
							<td>작성자</td>
							<td><input type="text" name="name" value="<%=id%>"
								readonly="readonly"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="passwd"></td>
						</tr>
						<tr>
							<td>글제목</td>
							<td><input type="text" name="subject"></td>
						</tr>
						<tr>
							<td>글내용</td>
							<td><textarea name="content" rows="13" cols="40"></textarea>
							</td>
						</tr>

					</table>
					<div id="table_search" style="padding-left: 60px">
						<input type="submit" value="글쓰기" class="btn"> <input
							type="reset" value="다시쓰기" class="btn"> <input
							type="button" value="글목록" class="btn"
							onclick="location.href='board.jsp'">
					</div>
				</form>

				<div class="clear"></div>
				<div id="page_control"></div>


			</div>
			<jsp:include page="../inc/login.jsp" />

			<!-- //footer -->
		</div>
		<jsp:include page="../inc/footer.jsp" />
		<!-- //frame -->
	</div>
</body>
</html>