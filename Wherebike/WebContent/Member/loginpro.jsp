<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberDAO dao = new MemberDAO();

	int logincheck = dao.userCheck(id, password);
	if(logincheck == 1){
		//로그인화면에서 입력한 아이디를 세션영역에 저장
		session.setAttribute("id", id);	
		//index.jsp로 이동
		response.sendRedirect("../index.jsp");
			
	}else if(logincheck == 0){// 비밀번호 틀림!!
	%>
		<script>
			alert("비밀번호 틀림");
			history.back(); // login.jsp 이전 페이지로 이동
		</script>

	<%	
	}else{ // check == -1   아이디 없음, 이전 페이지로 이동
	%>
		<script>
			alert("아이디 없음");
			history.back(); // login.jsp 이전 페이지로 이동
		</script>
	<%	
	}
	%>
	
