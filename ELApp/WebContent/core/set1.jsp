<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSTL에 코어 라이브러리를 사용하기위해서 URI속석을 코어 라이브러리가 존재하는 곳으로 설정 하고 ,접두가 속성인 prefix값은 c로 절정한다.
 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL 코어 라이브러리 사용 예제</h1>
<%
	/*자바코드로 변순 선언*/
	//단점 : set1.jsp에서만 사용가능한 지역변수이다.
	int num1 =7;
	int num2 =7;
	int sum = num1+num2;
%>
<%=sum %>
<br/><br/>
<%-- 코어라이브러리 안에 있는 set 태그 c는 접두사 
<c:set>을 이용해여 num3와 num4 변수를 선언하여 값을 각각 할당한다.--%>
<c:set var="num3" value="5"/>
<c:set var="num4" value="3"/>
<%-- EL태그를 활용하여 num3 * num4의 값을 result변수에 저장 --%>
<c:set var="result" value="${num3*num4}"/>

${num3 }와 ${num4 }의 곱의 결과는 ${result }이다.
<hr/>
<%-- c:set을 이용하여 각각의 변수의 값을 할당하고 각각의 변수를 request영역에 담기 --%>
<c:set var="code" value="80012" scope="request"/>
<c:set var="name" value="온습도계" scope="request"/>
<c:set var="price" value="15000" scope="request"/>
<%--페이지 이동시 리퀘스트 영역 전달 
제어권은 넘어갔다가 set2.jsp를 실행한후에 완료하면 다시 받아온다--%>
<jsp:forward page="set2.jsp"/>



</body>
</html>