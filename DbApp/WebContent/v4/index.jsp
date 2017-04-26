<%@page import="mybean.SawonDao"%>
<%@page import="mybean.SawonDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbcp.DBConnectionMgr"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>Insert title here</title>

<script type="text/javascript">
	//직원 데이터를 삭제할때 한번더 물어보기
	function fnDel(no){
		//메세지 박스에 "확인","취소" 선택을 해을때 true /false값을 반환
		var result = confirm("데이터를 정말로 삭제 하시겟습니까?");
		
		//"확인" 버튼을 클릭 하였으면 delSawon.jsp삭제 페이지로 이동 이동시 삭제할 직원 no을 이동 
		if(result==true){
			location.href="delSawon.jsp?no=" +no;
		}
		
	}


</script>
<meta name="viewpoint " content="width=device-width; initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 <style type="text/css">
 	.table{
 		width: 50%
 	}
 </style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	//검색기능 <form>태그에서 요청받은 검색기준값, 검색어  전달받아 저장
	String search = request.getParameter("search");
	String searchText = request.getParameter("searchText");
	

	//SawonDao dao2 =new SawonDao();
%>
<%-- 중요!!!! 데이터베이스 작업을 위한 getList메소드 호출용 객체 생성 --%>
<jsp:useBean id="dao" class="mybean.SawonDao"/>

<%--순서1 --%>
<h1 align="center">대선주자 정보 리스트</h1>

<%--직원 추가(회원가입)페이지로 이동하는 링크 --%>
<div align="center">
<a href="addSawon.jsp">대선의원 추가</a>
</div>
<%-- 검색기능 검색기준값 + 검색어 --%>
<div align="center">
<form action="index.jsp" method="post">
	<select name="search">
		<option value="id">ID</option>
		<option value="addr">근무지</option>
		<option value="dept">부서명</option>
	</select>
	<input type="text" name="searchText" />
	<input type="submit" value="검색" />
</form>
</div>
<%--직원 정보 리스트 --%>
<div align="center">
<table class="table table-condensed table-bordered">
	<tr>
		<th width="5%">ID</th>
		<th width="5%">이름</th>
		<th width="5%">나이</th>
		<th width="5%">근무지</th>
		<th width="5%">부서명</th>
		<th width="6%">내선번호</th>
		<th width="3%">수정</th>
		<th width="3%">삭제</th>
	</tr>
	<%--한사람찍 직원정보 뿌려주기 --%>
<%
		ArrayList arrayList = dao.getList(search, searchText);

		for(int i=0;i<arrayList.size();i++){
			SawonDto dto = (SawonDto)arrayList.get(i);
			
%>	
		<tr>
			<td><%=dto.getId() %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getAge() %></td>
			<td><%=dto.getAddr() %></td>
			<td><%=dto.getExtension() %></td>
			<td><%=dto.getDept() %></td>
			<td><a href="modifySawon.jsp?no=<%=dto.getNo()%>">수정</a></td>
			<!-- 정말로 삭제 하시겟습니까?? 물어본다. -->
			<td><a href="javascript:fnDel(<%=dto.getNo()%>)">삭제</a></td>
				
		</tr>
<% 
		}
	
%>
</table>
</div>
</body>
</html>