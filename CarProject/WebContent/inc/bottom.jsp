<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 빨간 라인 부분 -->
	<hr width="1000" size="3" color="red"/>
	
	<!-- 아래 로고 이미지 부분 -->
	<a href="#">
		<img src="img/bo.jpg" width="500" height="50" border="0">
	</a>
	<!-- 글 넣기 -->
	<font size="2">
		<b>
			<!-- 회사소개 이미지 링크를 눌렀을때.. 회사소개 페이지로 이동 -->
			<a href="CarMain.jsp?center=Company.jsp">
				<img src="img/sodog.jpg" border="0"> |
			</a>
			<!-- 개인정보 취급ㅂ방지 이미지 링크를 눌렀을때 Info.jsp 이동 -->
			<a href="CarMain.jsp?center=Info.jsp">
				<img src="img/info.jpg" border="0"> | 사이버 신문고 | 이용약관 | 인재채용
			</a>
		</b>
		<br/><br/>
		<!-- 글씨 크기 작게 -->
		<small>
			(주) SM렌탈 사업자 등록번호 214-98754-9874 통신판매업 신고번호 : 제 2010-충남-05호<br/>
			서울시 강남구 역삼동 역삼빌딩 2층 21<br/><br/>
			대표 전화 : 02-1234-5678<br/>
			FAX 번호 : 01-1234-5678
		</small>
		
	</font>
</body>
</html>