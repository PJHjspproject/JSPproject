<%@page import="mybean.SawonDto"%>
<%@page import="mybean.SawonDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="sun.font.CreatedFontTracker"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; chapstmtet=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; chapstmtet=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//수정할 직원 DB작업을 위한 DAO 객체 생성
	
	SawonDao dao = new SawonDao();

	//index.jsp에서 전달받은 수정할 직원 no 값을 리퀘스트에서 꺼내오기
	int no = Integer.parseInt(request.getParameter("no"));
	//수정할 지원 한사람에 대한 정보를 리턴해오는 메소드 호출시 수정할 직원 no을 전달
	SawonDto dto = dao.getSawon(no);
	
%>
<!-- 7.수정전 직원정보를 나타내면서 수정할 정보가 있으면 입력후 실제 직원정보 수정을 위한 DB작업 할 modifySawon_proc.jsp로 요청 -->

<form action="modifySawon_proc.jsp" method="post">
	<!--  수정할 직원 번호 input type hidden을 통해여 보이지않고 값만 전달 -->
	<input type="hidden" name="no" value="<%=no%>">
	
	<div align="center">
	<h1>직원 정보 수정</h1>
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" value="<%=dto.getId()%>"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value="<%=dto.getName()%>"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pass" value="<%=dto.getPass()%>"></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><input type="text" name="age" value="<%=dto.getAge()%>"></td>
		</tr>
		<tr>
			<th>근무지</th>
			<td>
				<select name="addr">
				<option value="서울"<%if(dto.getAddr().equals("서울")){%>selected<%}%>>서울</option>
				<option value="경기"<%if(dto.getAddr().equals("경기")){%>selected<%}%>>경기</option>
				<option value="인천"<%if(dto.getAddr().equals("인천")){%>selected<%}%>>인천</option>
				<option value="수원"<%if(dto.getAddr().equals("수원")){%>selected<%}%>>수원</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>내선번호</th>
			<td><input type="text" name="extension" value="<%=dto.getExtension()%>"></td>
		</tr>
		<tr>
			<th>부서명</th>
			<td>
				<select name="dept">
				<option value="영업"<%if(dto.getDept().equals("영업")){%>selected<%}%>>영업</option>
				<option value="기술"<%if(dto.getDept().equals("기술")){%>selected<%}%>>기술</option>
				<option value="기획"<%if(dto.getDept().equals("기획")){%>selected<%}%>>기획</option>
				<option value="개발"<%if(dto.getDept().equals("개발")){%>selected<%}%>>개발</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정" class="btn btn-default"/> &nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="취소" class="btn btn-danger" onclick="location='index.jsp'"/>
		</tr>
	</table>
	</div>
</form>
</body>
</html>