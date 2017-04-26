<%@page import="dbcp.DBConnectionMgr"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	int no = Integer.parseInt(request.getParameter("no"));

%>
<jsp:useBean id="dao" class="mybean.SawonDao"/>
	<h2>삭제처리 되었습니다</h2>
	<a href="index.jsp">메인 화면으로</a>
<%
	dao.deleteSawon(no);
%>