<%@page import="mybean.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="test" class="mybean.TestBean"/>
<jsp:setProperty property="name" name="test" value="컴퓨터"/>
<jsp:setProperty property="price" name="test" value="1500000"/>
<%--액션태그 getProperty 대신 EL태그를 사용하여 getter 메소드 호출하여 반환값 출력 --%>
상품명 : ${test.name}<br/>
가격 : ${test.price} <br/>
<hr/><hr/>
<%-- 스크립트 엘리먼트로 자바코드 사용하여 출력 --%>
<%
	request.setCharacterEncoding("UTF-8");
	Person p =(Person)request.getAttribute("person");//키값을 적자
%>
견주이름 : <%=p.getName() %><br/>
견 이름 : <%=p.getDog().getName() %><br/>
<hr/><hr/>
<%-- EL을 사용하여 출력 --%>

견주이름 : ${ requestScope.person.name }<br/>
견 이름 : ${ person.dog.name}<br/>
</body>
</html>