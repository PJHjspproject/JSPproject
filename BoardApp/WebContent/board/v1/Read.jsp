<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.bean.board.BoardDto"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function fnList(){
		document.list.action = "List.jsp";
		document.list.submit();
	}
	function update(){
		location.href="Update.jsp";
	}

</script>
</head>

<%

	request.setCharacterEncoding("UTF-8");


%>

<body>
<%-- 순서1. 글 조회수 증가 , 글 상세 보기 --%>
<jsp:useBean id="dao" class="com.bean.board.BoardDao"/>
<%
//순서2 List.jsp페이지에서 글 제목을 클릭했을때 전달받는 3개의값 저장 
	int num = Integer.parseInt(request.getParameter("num"));
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
//순서3 글 상세보기 DB작업후 반환받는 DTO객체를 저장하는 getBoard메소드 호출
	BoardDto dto=dao.getBoard(num);
//순서4 글 보여주기
	String name = dto.getName();
	String email = dto.getEmail();
	String homepage = dto.getHomepage();
	String subject = dto.getSubject();
	Timestamp regdate = dto.getRegdate();
	String Content = dto.getContent();
	String Ip = dto.getIp();
	int count = dto.getCount();
%>
<%-- 글 조회수 포함 상세내용 뿌려주기 --%>
<br><br>
<table align=center width=70% border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td bgcolor=9CA2EE height=25 align=center class=m>글읽기</td>
 </tr>
 <tr>
  <td colspan=2>
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr>

	 <td align=center bgcolor=#dddddd width=10%> 이 름 </td>
	 <td bgcolor=#ffffe8><%=name%></td>
	 <td align=center bgcolor=#dddddd width=10%> 등록날짜 </td>
	 <td bgcolor=#ffffe8><%=regdate%></td>
	</tr>
    <tr>
	 <td align=center bgcolor=#dddddd width=10%> 메 일 </td>
	 <td bgcolor=#ffffe8 ><%=email%></td> 
	 <td align=center bgcolor=#dddddd width=10%> 홈페이지 </td>
	 <td bgcolor=#ffffe8 ><a href="<%=homepage %>" target="_new">http://<%=homepage %></a></td> 
	</tr>
    <tr> 
     <td align=center bgcolor=#dddddd> 제 목</td>
     <td bgcolor=#ffffe8 colspan=3><%=subject%></td>
   
   </tr>
   <tr> 
    <td colspan=4><%=Content %></td>
   </tr>
   <tr>
    <td colspan=4 align=right>
     <%=Ip %>>로 부터 글을 남기셨습니다./  조회수 : <%=count %>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2> 
	<hr size=1>
	[ <a href="#" onclick="fnList()">목 록</a> | 
	<a href="Update.jsp?num=<%=num%>">수 정</a> |
	<a href="Delete.jsp?num=<%=num%>">삭 제</a> ]<br>
  </td>
 </tr>
</table>
<form action="List.jsp" name="list" method="post">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
</form>
</body>
</html>
