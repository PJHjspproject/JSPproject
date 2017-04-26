<%@page import="dbcp.DBConnectionMgr"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

%>

<!-- DB작업을 위한 객체 생성 -->
<jsp:useBean id="dao" class="mybean.SawonDao"/>

<!--  addSawon.jsp에서 전달받은 request영역에 값을 꺼내에서 SawonDto객체에 저장한다. -->
<jsp:useBean id="dto" class="mybean.SawonDto"/>
<jsp:setProperty property="*" name="dto"/>

<%
	//insert 작업할 메소드 호출할때.. 위에 dto 객체 전달

	dao.setSawon(dto);
%>

	<h2>직원 정보가 잘 추가 되었습니다.</h2>
	<a href="addSawon.jsp">입력 화면으로</a>
	<a href="index.jsp">메인 화면으로</a>
