<%@page import="java.sql.Timestamp"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");

%>

<jsp:useBean id="MemberDto" class="member.MemberDto"/>
<jsp:setProperty property="*" name="MemberDto"/>

<%
	MemberDto.setReg(new Timestamp(System.currentTimeMillis()));
	MemberDAO dao = new MemberDAO();

	int result = dao.insertMember(MemberDto);
	
	if(result==1){
%>
	<script type="text/javascript">
		alert("회원가입 성공");
		location.href = "../index.jsp";
	</script>
<% 		
	}else{
%>
	<script type="text/javascript">
		alert("회원가입 실패");
		history.go(-1);
	</script>	

<%
	}
	
	
	
%>
