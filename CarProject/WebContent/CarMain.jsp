<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL 태그를 사용하기 위해 선언 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오빠차 쇼핑몰</title>
<style type="text/css">
	/*오른쪽 밖여백 20 64 0 0*/	
	#login{
		margin: 20px 64px 0 0;
		font-size: 12px;
	}
	/*하이퍼링크 밑줄 없음 글자색#333*/
	#login a{
		text-decoration: none;
		color: #333;
	}
	#login a:HOVER {
	color :#F90;
	}
	/*왼쪽정렬 너비를 256 픽셀로 바깥여백을 60px 0 0 40px*/ 
	#logo{
		float: left;
		margin: 60px 0 0 40px;
	}
</style>
</head>
<body>

<!-- 센터 공간은 사용자로 부터 계속햇거 정보가 바뀌는 부분이기에 해당 Center.jsp의 정보를 읽어 들여야한다. -->
<c:set var="center" value="${param.center}"/>

<c:if test="${center == null }">
	<c:set var="center" value="inc/Center.jsp"/>
</c:if>

<center>
	<table width="1000" height="700">
		<!-- header - top.jsp -->
		<tr align="center">
			<td>
				<jsp:include page="inc/top.jsp"/>
			</td>
		</tr>
		<!-- center -->
		<tr>
			<td height="500" >
				<jsp:include page="${ center }"/>
			</td>
		</tr>
		<!-- footer  - bottom.jsp -->
		<tr>
			<td>
				<jsp:include page="inc/bottom.jsp"/>
			</td>
		</tr>

</table>
</center>
</body>
</html>