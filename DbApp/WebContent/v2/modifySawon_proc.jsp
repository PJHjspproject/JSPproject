<%@page import="dbcp.DBConnectionMgr"%>
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
	String no = request.getParameter("no");
	String s_id = request.getParameter("s_id");
	String s_name = request.getParameter("s_name");
	String s_pw = request.getParameter("s_pw");
	String s_age = request.getParameter("s_age");
	String s_addr = request.getParameter("s_addr");
	String s_extension = request.getParameter("s_extension");
	String s_dept = request.getParameter("s_dept");
	//2. 받아온 수정될 직원번호에 대한 직원 레코드 검색 select 문
	
	
	String sql = "update tblsawon set id=?,name=?,pass=?,age=?,addr=?,extension=?,dept=? where no=?";
	/*String sql = "update tblsawon set id='"+s_id+"', name='"+s_name+"', pass='"+s_pw+
	"', age='"+s_age+"', addr='"+s_addr+"', extension='"+s_extension+
	"', dept='"+s_dept+"' where no='"+no+"'";*/
						
	
	Connection con = null;
	
	PreparedStatement pstmt = null;
	
	DBConnectionMgr pool = null;

	
	try{
		pool = DBConnectionMgr.getInstance();
		con = pool.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, s_id);
		pstmt.setString(2, s_name);
		pstmt.setString(3, s_pw);
		pstmt.setInt(4, Integer.parseInt(s_age));
		pstmt.setString(5, s_addr);
		pstmt.setString(6, s_extension);
		pstmt.setString(7, s_dept);
		pstmt.setInt(8, Integer.parseInt(no));
		pstmt.executeUpdate();

%>
	<h2>수정처리 되었습니다</h2>
	<a href="index.jsp">메인 화면으로</a>


<%		
	}catch(Exception err){
		System.out.println("modifySawon_proc.jsp에서 DB연결 및 쿼리오류 :"+err);
		err.printStackTrace();
		
	}finally{
		pool.freeConnection(con, pstmt);
	}
	
%>