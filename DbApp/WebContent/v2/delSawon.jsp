<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no = request.getParameter("no");
	
	Connection con = null;
	
	PreparedStatement pstmt = null;
	
	String sql = "delete from tblsawon where no=?";

	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspbeginner";
	String id = "jspid";
	String pw = "jsppass";

	
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, id, pw);
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,Integer.parseInt(no));
		pstmt.executeUpdate();

%>
	<h2>삭제처리 되었습니다</h2>
	<a href="index.jsp">메인 화면으로</a>


<%		
	}catch(Exception err){
		System.out.println("delectSawon_proc.jsp에서 DB연결 및 쿼리오류 :"+err);
		err.printStackTrace();
		
	}finally{
	
		if(pstmt!=null)try{pstmt.close();}catch(Exception epstmt){}
		if(con!=null)try{con.close();}catch(Exception econ){}
	}

%>