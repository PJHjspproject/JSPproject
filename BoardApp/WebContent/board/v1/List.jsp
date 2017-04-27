<%@page import="com.bean.board.BoardDto"%>
<%@page import="java.util.Vector"%>
<%@page import="com.bean.board.BoardDao"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<HTML>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check(){
		if(document.search.keyWord.value == ""){
			alert("검색어를 입력하세요.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
</script>
<BODY>
<center><br>
<h2>JSP Board</h2>

<%!
	String keyWord="", keyField="";
%>
<%
	//현재 List.jsp페이지의 검색란에 검색어를 입력했다면 한글처리
	request.setCharacterEncoding("UTF-8");
	//만약에 검색어가 입력되었다면
	if(request.getParameter("keyWord") != null){
		//검색 기준값과 검색어 저장 저장
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	//DB작업을위한 객체 생성
	BoardDao dao = new BoardDao();
	//게시판의 전체글목록 리스트를 뿌려주는 DB에 select작업을 위한 dao클래스의 메소드 호출
	//getBoardLiat메소드 호출시
	//검색기준값과 검색어를 넘겨주어 결과적으로 백터에 전체글들을 담아서
	//백터 자체에 리턴받기
	Vector v = dao.getBoardList(keyField, keyWord);
	
%>




<table align=center border=0 width=80%>
<tr>
	<td align=left>Total :  Articles(
		<font color=red>  1 / 10 Pages </font>)
	</td>
</tr>
</table>

<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
<tr>
	<td align=center colspan=2>
		<table border=0 width=100% cellpadding=2 cellspacing=0>
			<tr align=center bgcolor=#D0D0D0 height=120%>
				<td> 번호 </td>
				<td> 제목 </td>
				<td> 이름 </td>
				<td> 날짜 </td>
				<td> 조회수 </td>
			</tr>

<% 
				for(int i=0;i<v.size();i++){
 				BoardDto dto = (BoardDto)v.get(i);
%>
<tr align=center height=120%>
				<td><%=dto.getNum() %></td>
				<td><%=dto.getSubject() %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getRegdate() %></td>
				<td><%=dto.getCount() %></td>
			</tr>
			
			<%} %>

		</table>
	</td>
</tr>
<tr>

	
	<td><BR><BR></td>

</tr>

<tr>
	<td align="left">Go to Page </td>
	<td align=right>
		<a href="Post.jsp">[글쓰기]</a>
		<a href="javascript:list()">[처음으로]</a>
	</td>
</tr>
</table>
<BR>
<form action="List.jsp" name="search" method="post">
	<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
	<tr>
		<td align=center valign=bottom>
			<select name="keyField" size="1">
				<option value="name"> 이름
				<option value="subject"> 제목
				<option value="content"> 내용
			</select>

			<input type="text" size="16" name="keyWord" >
			<input type="button" value="찾기" onClick="check()">
			<input type="hidden" name="page" value= "0">
		</td>
	</tr>
	</table>
</form>
</center>	
</BODY>
</HTML>