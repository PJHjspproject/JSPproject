<%@page import="java.sql.PreparedStatement"%>
<%@page import="sun.font.CreatedFontTracker"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="mybean.SawonDao"/>
<jsp:useBean id="dto" class="mybean.SawonDto"/>
<jsp:setProperty property="*" name="dto"/>

<%
	dao.modifySawon(dto);
%>
	<h2>수정처리 되었습니다</h2>
	<a href="index.jsp">메인 화면으로</a>

