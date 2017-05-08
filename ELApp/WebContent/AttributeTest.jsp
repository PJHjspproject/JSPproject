<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>서블릿으로부터 데이터를 전달받음</h1>
<%--스크립틀릿 방식 --%>
<%
	int cnt =1000;
%>
스크립트 엘리먼트 : <%=cnt+10 %> cnt->변수라고 부름<br/>
cnt 값을 EL로 표현 : ${cnt+10 } , ${requestScope.cnt + 10 } , ${sessionScope.cnt + 10}
<br/><br/>
스크립트 엘리먼트 태그로 표현한 cnt는 변수라 부른다.<br/>
EL로 표현한 cnt는 Attribute라 부름<br/>
<%--
	requestScope , sessionScope 등등을 지정해주지 않으면
	EL로 표현한 cnt Attribute는 어느 영영부터 찾는가.
	처음에는 PageScope cnt Attribute영역을 찾고
	그다음에는 requestScopr cnt Attribute영역을 찾는다.
	그다음엔 sessionScope cnt Attribute영역을 찾고
	Application영역에서 cnt Attribute를 찾게됨 
 --%>
</body>
</html>