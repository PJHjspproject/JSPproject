<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 메인 로그 이미지 추가 클릭시 메인페이지(CarMain.jsp)로 이동-->
	<div id="logo">
	<a href="CarMain.jsp"><img src="img/RENT.jpg" width="300" height="80" border="0"></a>
	</div>
	<!-- 로그인 |회원가입 만들기  -->
	<table width="1000" height="5">
		<tr>
			<td align="right" colspan="5">
				<%
					String id = (String)session.getAttribute("id");
				
					if(id==null){
				%>
					<div id="login">
						<a href="./MemberLogin.me">login</a>| 
						<a href="./MemberJoin.me">Join</a>
					</div>	
						
						
				<%
					}else{
				%>	
					<div id="login">
						<%=id %>님 환영!&nbsp;&nbsp;
						<a href="./MemberLogout.me">Logout</a>| 
						<a href="./MemberJoin.me">Join</a>
					</div>	
				<%	
					}
				%>
				
			</td>
		</tr>
	</table>
	<!-- 메뉴 만들기 -->
	<table width="1000" background="img/aa.jpg" height="5">
		<tr align="center" bgcolor="red">
			<td>
				<a href="CarMain.jsp?center=CarReservation.jsp">
					<img src="img/bb.jpg"><!-- 예약하기 메뉴 -->
				</a>
			</td>
			<td>
				<a href="CarMain.jsp?center=CarReserveConfirm.jsp">
					<img src="img/cc.jpg"><!-- 예약 확인 메뉴  -->
			</a>
			</td>
			<td>
				<a href="">
					<img src="img/dd.jpg"><!-- 자유게시판 메뉴  -->
				</a>
			</td>
			<td>
				<a href="CarMain.jsp?center=CarEvent.jsp">
					<img src="img/even.jpg"><!-- 이벤트 메뉴  -->
				</a>
			</td>
			<td>
				<a href="">
					<img src="img/ee.jpg"><!-- 고객센터 메뉴  -->
				</a>
			</td>
		</tr>
	</table>
</body>
</html>