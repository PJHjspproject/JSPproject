<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
<h1>DB연결 테스트</h1>
<%

		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspbeginner";
		String id = "jspid";
		String pw = "jsppass";

		try{
			
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(url, id, pw);
			out.println("연결성공");
		}catch(Exception e){
			out.println("Exception e :"+e.getMessage());
			
		}
%>

</body>
</html>