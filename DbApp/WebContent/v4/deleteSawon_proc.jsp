<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	
	String sql = "delete from tblsawon where no= '" +no+ "'";
	
	Connection con = null;
	
	Statement stmt = null;
	
	
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspbeginner";
	String id = "jspid";
	String pw = "jsppass";
	
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, id, pw);
		stmt = con.createStatement();
		stmt.executeUpdate(sql);

%>
	<h2>삭제처리 되었습니다</h2>
	<a href="index.jsp">메인 화면으로</a>


<%		
	}catch(Exception err){
		System.out.println("delectSawon_proc.jsp에서 DB연결 및 쿼리오류 :"+err);
		err.printStackTrace();
		
	}finally{
	
		if(stmt!=null)try{stmt.close();}catch(Exception estmt){}
		if(con!=null)try{con.close();}catch(Exception econ){}
	}
	
%>
