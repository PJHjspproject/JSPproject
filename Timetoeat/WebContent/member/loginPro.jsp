<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//1. login.jsp페이지로부터 id passwd 파라미터 값 가져오기 
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

//2. DB작업할 객체 생성
MemberDAO memberDAO = new MemberDAO();

//3. MemberDAO클래스에 .... 
//로그인 처리시.. 사용하는 메소드 userCheck()메소드 추가하기 
//설명) 입력받은 id,passwd값과  DB에 있는 id,passwd값 확인하여 로그인 처리 

//check = 1 -> 아이디맞음, 비밀번호 맞음
//      = 0 -> 아이디 맞음, 비밀번호 틀림
//      = -1 -> 아이디 틀림
int newcheck = memberDAO.userCheck(id, passwd);

//DB 아이디,비밀번호  == 로그인시 입력한 아이디,비밀번호  일떄....
if(newcheck == 1){
	//로그인화면에서 입력한 아이디를 세션영역에 저장
	session.setAttribute("id", id);	
	//index.jsp로 이동
	response.sendRedirect("../index.jsp");
		
}else if(newcheck == 0){// 비밀번호 틀림!!
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