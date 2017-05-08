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
	request.setCharacterEncoding("UTF-8");//한글처리는 자바코드로 해야한다.
	
%>
<%-- ${param.키값 --%>
이름 : ${param.name }<br/>
아이디 : ${param.id }<br/>
<%--벨류값이 같으면 paramValues를 이용하여 배열로 읽어올수 있다. --%>
첫번째 음식 : ${paramValues.food[0] }<br/>
두번째 음식 : ${paramValues.food[1] }<br/>

<br/>
<%-- <%
	String hoddy[] =  request.getParameterValues("hoddy");//자바코드로 할 경우 전부 체크를 안할시 예외발생...
%>
<ul>
	<li><%=hoddy[0] %></li>
	<li><%=hoddy[1]  %></li>
	<li><%=hoddy[2]  %></li>
</ul> --%>

<ul>
	<li>${paramValues.hoddy[0] }</li>
	<li>${paramValues.hoddy[1] }</li>
	<li>${paramValues.hoddy[2] }</li>
</ul>
</body>
</html>