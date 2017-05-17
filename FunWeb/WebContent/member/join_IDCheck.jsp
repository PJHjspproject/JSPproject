<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function result() {
		//join_IDCheck.jsp창을 오픈하게 해준 join.jsp = join_IDCheck.jsp창페이지  
	 	opener.document.fr.id.value = document.nfr.userid.value;
		
		window.close();
		
	}
</script>

</head>
<body>
<%
	//join.jsp winopen함수에 의해서 userid값 가져오기
	//중복확인 버튼 form태그로 부터 전달받은 userid값 받아오기
	String id = request.getParameter("userid");
	//아이디 중복 체크 DB작업을 위한 DAO 객체 생성
	MemberDAO mdao = new MemberDAO();
	
	//MemberDAO 클래스에 아이디 중복체크 유무 값 가져오기 위한 DB작업 idCheck()메소드 추가하기
	
	//전달받은 사용자가 입력한 id값을 idChack()메소드로 전달하여 
	//메소드의 리턴값으로 중복체크 유무값 가져오기
	//check 1 ->아이디중복 check 0 ->중복이 아님
	int check = mdao.idCheck(id);
	
	if(check ==0){
	out.print("사용가능한 아이딘데");
%>
	<%--사용가능한 id시 버튼 누러서 부모창에 ID값 나타내기 --%>
<input type="button" value="사용함" onclick="result()">
<form action="join_IDCheck.jsp" method="post" name="nfr">
		<input type="text" name="userid" value="<%=id%>">
		<input type="submit" value="중복확인">
</form>
		
<%  	
	}else{
		out.print("중복인뒈에");
%>

<% 
	}
%>
</body>
</html>