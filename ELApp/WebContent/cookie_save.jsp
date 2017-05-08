<%@page import="java.net.URLEncoder"%>
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
	//쿠키객체에 데이터 저장하기
	//쿠키 데이터 저장할 변수명 name과 name 변수에 저장할 "홍길동"문자열 인코딩해 넣기
	Cookie nameCook = new Cookie("name",URLEncoder.encode("홍길동","UTF-8"));
	Cookie ageCook = new Cookie("age","24");
	
	nameCook.setMaxAge(60*60*24);//이름쿠키 저장시간 하루
	ageCook.setMaxAge(60*60*24);//나이쿠키 저장시간 하루
	
	//사용자에게 전달하기위해 response객체에 쿠키객체 추가하기
	response.addCookie(nameCook);
	response.addCookie(ageCook);
%>

<a href="cookie_restore.jsp">여기를 눌러주세여</a><br/>

cookie_save.jsp페이지를 실행하여 클라이언트 요청에 의한 쿠키값이 잘 저장되었는지 확인해보기<br/>

방법1<br/>
인터넷 익스플로러[인터넷 옵션]->[일반]->[설정]->[파일보기]를 눌러서 쿠기파일 찾기<br/>

방법2<br/>
cookie_save.jsp페이지를 실행한 인터넷익스플로러창에 javascript:document.cookie 입력흐 엔터<br/>


</body>
</html>