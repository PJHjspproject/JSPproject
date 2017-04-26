<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//DB연결하기!
	try{
		//Context 객체 생성 javax.naming.Context ,javax.naming.InitialContext
		Context init = new InitialContext(); //서버에 자원 관리 객체로 JNDI 네임스페이스 공간안에 연결된 객체를 생성
		//lookup 메소드를 통해서 namespace 공간에 등록된 jdbc/jspbeginner에 해당하는 커넥션풀 객체(Data)를 찾아서 리턴 받는다.
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		//커넥션풀 (DataSource)에서 DB와 미리 연결된 Connection객체를 리턴받아 저장
		Connection con = ds.getConnection();
		
		if(con!=null){
			out.println("연결 성공........");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		
	}

%>

</body>
</html>