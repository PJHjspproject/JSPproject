<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String id = (String)session.getAttribute("id");
	
	
	
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/slide.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="js/slide.js"></script>

</head>
<body>
<div class="frame">
  <div class="header">
    <div class="logo_picture">
    	<img alt="logo" src="image/logo.png">
    	<img alt="logo" src="image/logo_text.png">
    </div>
  </div>
  <!-- //header -->
  <!-- a -->
  <div class="container">
    <div class="nav">
      <ul class="nav-list">
        <li class="nav-item"><a href="index.jsp" class="nav-link">홈으로</a></li>
        <li class="nav-item"><a href="map/map.jsp" class="nav-link">내 자전거 찾기</a></li>
        <li class="nav-item"><a href="board/board.jsp" class="nav-link">자전거 팁 공유</a></li>
        <li class="nav-item"><a href="map/map2.jsp" class="nav-link">내 주변 자전거 지도</a></li>
      </ul>
    </div>
    <!-- //nav -->
    <div class="content">
      <div class="slide">
		<ul class="slide_ul">
			<li><a href="#"><img src="image/hybrid.jpg" alt="bike"></a></li>
			<li><a href="#"><img src="image/MTB.jpg" alt="bike"></a></li>
			<li><a href="#"><img src="image/motor.jpg" alt="bike"></a></li>
			<li><a href="#"><img src="image/bike.jpg" alt="bike"></a></li>
		</ul>
	 </div>
    </div>
    <%
    if(id == null){
    %>
    <div class="nav_left">
		<form action="Member/loginpro.jsp" id="join" method="post" class="login-form">
      		<input type="text" placeholder="username" name="id" />
      		<input type="password" placeholder="password" name="password"/>
      		<button>login</button>
      		<p class="message">가입이 안되어있으신가요???<br/>
      		<a href="Member/join.jsp">회원가입 하러가기</a></p>
    	</form>
    </div>
    <%
    } else{
     %>
    	<div class="nav_left">
		<%=id %>님 환영합니다.<br/>
		<%
			id = (String)session.getAttribute("id");
		
		%>
		<a href="Member/logout.jsp">logout</a>&nbsp;&nbsp;&nbsp;
		<a href="Member/updatemember.jsp">회원정보수정</a>
		 </div>
     <%
     	
     %>
     <%
    }
     %>
  </div>
  <!-- //container -->
  <div class="footer">
    <p class="copyright">&copy;Where your Bike?</p>
  </div>
  <!-- //footer -->
</div>
  
<!-- //frame -->


</body>
</html>