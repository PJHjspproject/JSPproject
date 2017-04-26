<%@page import="dbcp.DBConnectionMgr"%>
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

	DBConnectionMgr pool = null;
	
	try{
		pool = DBConnectionMgr.getInstance();
		con = pool.getConnection();
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
	
		pool.freeConnection(con, pstmt);
	}

%>