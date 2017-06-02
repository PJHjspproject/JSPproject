<%@page import="member.MemberDAO"%>
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
	//login.jsp에서  아이디와 비밀번호 받기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	MemberDAO dao = new MemberDAO();
	//로그인 처리 메소드
	//1-> 둘다 맞음 0-> 비밀번호만 틀림 -1 -> 둘다 틀림
	int newCheck = dao.userCheck(id,passwd);
	//DB 아이디 패스워드  == 로그이시 입력한 아이디 비밀번호 일때
	if(newCheck ==1){
		//로그인시 화면에서 입력한 아이디를 세션영역에 저장
		session.setAttribute("id", id);
		response.sendRedirect("../index.jsp");
		System.out.println(newCheck);
	}else if(newCheck==0){//비밀번호 틀림
		System.out.println(newCheck);
%>
	<script type="text/javascript">
		
		alert("비밀번호 틀렸어 멍충아");
		history.back();
	</script>
<% 		
	}else{//check =-1
		System.out.println(newCheck);
%>
	<script type="text/javascript">
		alert("아이디없어 멍충아");
		history.go(-1);
	</script>
<%		
	}
	
%>
</body>
</html>