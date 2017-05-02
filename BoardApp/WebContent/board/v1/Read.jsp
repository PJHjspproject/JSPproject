<%@page import="com.bean.board.BoardDto"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function list(){
		
		location.href="List.jsp";
	}
	function update(){
		location.href="Update.jsp";
	}

</script>
</head>

<%

	request.setCharacterEncoding("UTF-8");

	out.println(request.getParameter("num")+","+request.getParameter("keyField")+","
				+request.getParameter("keyWord"));
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

%>
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
	 <td bgcolor=#ffffe8><input type="text" name="name" value="<%=dto.getName()%>"></td>
	 <td align=center bgcolor=#dddddd width=10%> 등록날짜 </td>
	 <td bgcolor=#ffffe8><input type="text" name="regdate" value="<%=dto.getRegdate()%>"></td>
	</tr>
    <tr>
	 <td align=center bgcolor=#dddddd width=10%> 메 일 </td>
	 <td bgcolor=#ffffe8 ><input type="text" name="email" value="<%=dto.getEmail()%>"></td> 
	 <td align=center bgcolor=#dddddd width=10%> 홈페이지 </td>
	 <td bgcolor=#ffffe8 ><a href="<%=dto.getHomepage() %>" target="_new"><input type="text" name="email" value="<%=dto.getHomepage()%>"></a></td> 
	</tr>
    <tr> 
     <td align=center bgcolor=#dddddd> 제 목</td>
     <td bgcolor=#ffffe8 colspan=3><input type="text" name="name" value="<%=dto.getSubject()%>"></td>
   </tr>
   <tr> 
    <td colspan=4></td>
   </tr>
   <tr>
    <td colspan=4 align=right>
     로 부터 글을 남기셨습니다./  조회수 : 
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2> 
	<hr size=1>
	[ <a href="javascript:list()">목 록</a> | 
	<a href="javascript:update()">수 정</a> |
	<a href="">삭 제</a> ]<br>
  </td>
 </tr>
</table>
</body>
</html>
