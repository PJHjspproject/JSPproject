<%@page import="sun.font.CreatedFontTracker"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String s_id = request.getParameter("s_id");
	String s_name = request.getParameter("s_name");
	String s_pw = request.getParameter("s_pw");
	String s_age = request.getParameter("s_age");
	String s_addr = request.getParameter("s_addr");
	String s_extension = request.getParameter("s_extension");
	String s_dept = request.getParameter("s_dept");
	//2. 받아온 수정될 직원번호에 대한 직원 레코드 검색 select 문
	
	String sql = "update tblsawon set id='"+s_id+"', name='"+s_name+"', pass='"+s_pw+
	"', age='"+s_age+"', addr='"+s_addr+"', extension='"+s_extension+
	"', dept='"+s_dept+"' where no='"+no+"'";
						
	
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
	<h2>수정처리 되었습니다</h2>
	<a href="index.jsp">메인 화면으로</a>


<%		
	}catch(Exception err){
		System.out.println("modifySawon_proc.jsp에서 DB연결 및 쿼리오류 :"+err);
		err.printStackTrace();
		
	}finally{
	
		if(stmt!=null)try{stmt.close();}catch(Exception estmt){}
		if(con!=null)try{con.close();}catch(Exception econ){}
	}
	
%>