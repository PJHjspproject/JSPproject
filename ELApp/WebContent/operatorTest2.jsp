<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String num1 =request.getParameter("num1");

%>
<%--EL 표현식 사용 --%>
전달받은 숫자 2개: x= ${param.num1 }, y= ${param.num2 }<br/><br/>
<%--참고! EL은 절달받은 값은 자동 캐스팅이 된다. 문자열 +  문자열  숫자를 방지--%>
x + y = ${param.num1 + param.num2 }<br/><br/>


<%--삼항연산자 --%>
x가 y가 같은가?<br/>

${ (param.num1==param.num2)? "예" : "아니오" }<br/>

<%--id 값 입력받았는지  --%>

안녕하세요 ${empty param.id ? "guest" : param.id}님!!!<br/>
</body>
</html>