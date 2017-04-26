<%@page import="dbcp.DBConnectionMgr"%>
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
	//1. index.jsp에서 받아온 수정될 직원 번호 받아오기
	
	String no = request.getParameter("no");
	//2. 받아온 수정될 직원번호에 대한 직원 레코드 검색 select 문
	
	String sql = "select * from tblsawon where no = ?";
	
	Connection con = null;
	
	PreparedStatement pstmt = null;
	
	ResultSet rs = null;

	DBConnectionMgr pool = null;
	
	String s_id =null,s_name =null,s_pw =null,s_age =null,s_addr =null,s_extension =null,s_dept =null;
	
	try{
		pool = DBConnectionMgr.getInstance();
		con = pool.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(no));
		rs = pstmt.executeQuery();
		
		while(rs.next()){
		s_id = rs.getString("id");
		s_name = rs.getString("name");
		s_pw =rs.getString("pass");
		s_age = String.valueOf(rs.getInt("age"));
		s_addr = rs.getString("addr");
		s_extension =rs.getString("extension");
		s_dept =rs.getString("dept");
		}
		
		
	}catch(Exception err){
		System.out.println("modifySawon.jsp에서 DB연결 및 쿼리오류 :"+err);
		err.printStackTrace();
		
	}finally{
		pool.freeConnection(con, pstmt, rs);
	}
	
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
			<td><input type="text" name="s_id" value="<%=s_id%>"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="s_name" value="<%=s_name%>"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="s_pw" value="<%=s_pw%>"></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><input type="text" name="s_age" value="<%=s_age%>"></td>
		</tr>
		<tr>
			<th>근무지</th>
			<td>
				<select name="s_addr">
				<option value="서울"<%if(s_addr.equals("서울")){%>selected<%}%>>서울</option>
				<option value="경기"<%if(s_addr.equals("경기")){%>selected<%}%>>경기</option>
				<option value="인천"<%if(s_addr.equals("인천")){%>selected<%}%>>인천</option>
				<option value="수원"<%if(s_addr.equals("수원")){%>selected<%}%>>수원</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>내선번호</th>
			<td><input type="text" name="s_extension" value="<%=s_extension%>"></td>
		</tr>
		<tr>
			<th>부서명</th>
			<td>
				<select name="s_dept">
				<option value="영업"<%if(s_dept.equals("영업")){%>selected<%}%>>영업</option>
				<option value="기술"<%if(s_dept.equals("기술")){%>selected<%}%>>기술</option>
				<option value="기획"<%if(s_dept.equals("기획")){%>selected<%}%>>기획</option>
				<option value="개발"<%if(s_dept.equals("개발")){%>selected<%}%>>개발</option>
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