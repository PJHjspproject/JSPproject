<%@page import="java.text.SimpleDateFormat"%>
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
	function fnlist(){
		document.list.action = "List.jsp";
		document.list.submit();
	}
	function fnRead(num) {
		document.read.num.value = num;
		document.read.submit();
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
	//[처음으로]링크를 클릭했을때 (List.jsp가 재요청 됬을시) 
	if(request.getParameter("reload")!=null){
		//만약 List.jsp페이지로 다시 요청받은 값이 true와 같을때..
		if(request.getParameter("reload").equals("true")){
		
			keyWord ="";
		}
		
	}
	
	
	
	//DB작업을위한 객체 생성
	BoardDao dao = new BoardDao();
	//게시판의 전체글목록 리스트를 뿌려주는 DB에 select작업을 위한 dao클래스의 메소드 호출
	//getBoardLiat메소드 호출시
	//검색기준값과 검색어를 넘겨주어 결과적으로 백터에 전체글들을 담아서
	//백터 자체에 리턴받기
	Vector v = dao.getBoardList(keyField, keyWord);
	//날짜형식을 지정하는 객체
	SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
	
	
	
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


<tr align=center height=120%>
<%if(v.isEmpty()){
%>

<td colspan="5">글이없습니다.</td>
<% 
}else{

	for(int i=0;i<v.size();i++){
		BoardDto dto = (BoardDto)v.get(i);
%>
			<tr align="center">
				<td><%=dto.getNum() %></td>
				<%--게시판 글 리스트 중에서 제목을 클릭할때 함수 호출하여  from태그 실행 --%>
				<td><a href="#" onclick="fnRead('<%=dto.getNum() %>')"><%=dto.getSubject() %></a></td>
				<td><%=dto.getName() %></td>
				<td><%=s.format(dto.getRegdate())%></td>
				<td><%=dto.getCount() %></td>
			</tr>
			
			<% }} %>

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
		<a href="javascript:fnlist()">[처음으로]</a>
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
<%-- 현재 List.jsp페이지가 리로드 하는지 안하는 구별하기 위한 값 true를 다시 List.jsp로--%>
<form name="list" method="post">
	<input type="hidden" name="reload" value="true">
</form>
<%--글제목 클릭시 Read.jsp로 선택한 글번호 글을 선택하기위해 검색한 검색기준값 검색한 검색어 --%>
<form action="Read.jsp" name="read" method="post">
	<input type="hidden" name="num">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
</form>
</BODY>
</HTML>