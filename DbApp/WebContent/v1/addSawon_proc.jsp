<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String s_id = request.getParameter("s_id");
	String s_name = request.getParameter("s_name");
	String s_pw = request.getParameter("s_pw");
	String s_age = request.getParameter("s_age");
	String s_addr = request.getParameter("s_addr");
	String s_extension = request.getParameter("s_extension");
	String s_dept = request.getParameter("s_dept");
	
	String sql = "insert into tblSawon(id, name, pass, age, addr, extension, dept) "
			   + "values('" + s_id + "', '" + s_name + "',  '" + s_pw +"', " + 
			   s_age + ",   '" + s_addr + "',  '" + s_extension + "', '" + s_dept + "')";
/*
	String sql = "insert into tblsawon(id,name,pass,age,addr,extension,dept)" + "values ('" + s_id + "','"
			+ s_name + "','" + s_pw + "','" + s_age + "','" + s_addr + "','" + s_extension + "','" + s_dept
			+ "')";

*/
	/*Connection 삼총사!!*/
	Connection con = null;

	Statement stmt = null;

	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspbeginner";
	String id = "jspid";
	String pw = "jsppass";
	
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url,id,pw);
		stmt = con.createStatement();
		
		stmt.executeUpdate(sql);
%>
	<h2>직원 정보가 잘 추가 되었습니다.</h2>
	<a href="addSawon.jsp">입력 화면으로</a>
	<a href="index.jsp">메인 화면으로</a>
<%
	}catch(Exception err){
		System.out.println("addSawon_proc.jsp에서 DB 연결 또는 SQL구문 오류" + err);
		err.printStackTrace();
	}finally{
		
		if(stmt!=null)try{stmt.close();}catch(Exception estmt){}
		if(con!=null)try{con.close();}catch(Exception econ){}
	}
%>