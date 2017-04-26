<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//1. index.jsp에서 받아온 수정될 직원 번호 받아오기
	
	String no = request.getParameter("no");
	//2. 받아온 수정될 직원번호에 대한 직원 레코드 검색 select 문
	
	String sql = "select * from tblsawon where no = '"+no+"' ";
	
	Connection con = null;
	
	Statement stmt = null;
	
	ResultSet rs = null;
	
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspbeginner";
	String id = "jspid";
	String pw = "jsppass";
	
	String s_no=null,s_id =null,s_name =null,s_age =null,s_addr =null,s_extension =null,s_dept =null;
	
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, id, pw);
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			s_no = String.valueOf(rs.getInt("no"));
			s_id = rs.getString("id");
			s_name = rs.getString("name");
			s_age = String.valueOf(rs.getInt("age"));
			s_addr = rs.getString("addr");
			s_extension =rs.getString("extension");
			s_dept =rs.getString("dept");
			
		}
		
	}catch(Exception err){
		System.out.println("modifySawon.jsp에서 DB연결 및 쿼리오류 :"+err);
		err.printStackTrace();
		
	}finally{
		if(rs!=null)try{rs.close();}catch(Exception ers){}
		if(stmt!=null)try{stmt.close();}catch(Exception estmt){}
		if(con!=null)try{con.close();}catch(Exception econ){}
	}
	
%>
<form action="deleteSawon_proc.jsp" method="post">
 <input type="hidden" name="no" value="<%=no%>">
 	<div align="center">
	<h1>직원 정보 삭제</h1>
	<table>
		<tr>
			<th>아이디</th>
			<td><%=s_id%></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=s_name%></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><%=s_age%></td>
		</tr>
		<tr>
			<th>근무지</th>
			<td><%=s_addr%></td>
		</tr>
		<tr>
			<th>내선번호</th>
			<td><%=s_extension%></td>
		</tr>
		<tr>
			<th>부서명</th>
			<td><%=s_dept%></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="삭제" class="btn btn-default"/> &nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="취소" class="btn btn-warning" onclick="location='index.jsp'"/>
		</tr>
	</table>
	</div>
 
 
</form>
</body>
</html>