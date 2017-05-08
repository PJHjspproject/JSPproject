<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--스크립트 엘리먼트 방식 --%>

<%
	Cookie[] cookies = request.getCookies();//리턴형이 Cookie[] 배열로 리턴
	
	for(int i =0;i<cookies.length; i++){
		if(cookies[i].getName().equals("name")){
	%>
	 	<%=URLDecoder.decode(cookies[i].getValue(), "UTF-8") %>
	<%
				
		}
	}
%>

<hr/>
<br/><br/><br/>

<%--EL언어로 사용방식 : 이미 cookie라는 내장객체의 담겨있음 --%>

name : ${cookie.name.value}, ${cookie.name["value"]},<br/> ${cookie["name"]["value"]} -> JSTLCustom태그로 처리가능 EL로는 디코더 불가!!
age : ${cookie.age.value }<br/>
EL에서는 +,-,크다(gt),작다(lt),크거나 같다(ge) ,작거나 같다(le),같다(eq)  같은걸 제공한다.  

</body>
</html>