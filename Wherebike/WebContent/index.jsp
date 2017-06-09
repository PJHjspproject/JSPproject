<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
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
  <div class="container">
    <div class="nav">
      <ul class="nav-list">
        <li class="nav-item"><a href="index.jsp" class="nav-link">홈으로</a></li>
        <li class="nav-item"><a href="" class="nav-link">내 자전거 찾기</a></li>
        <li class="nav-item"><a href="" class="nav-link">자전거 팁 공유</a></li>
        <li class="nav-item"><a href="" class="nav-link">미정</a></li>
      </ul>
    </div>
    <!-- //nav -->
    <div class="content">
      <h1>Hello World</h1>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit nam error ipsa commodi exercitationem fugiat praesentium tempore inventore voluptate dolore. Ipsa quisquam nemo enim explicabo aut accusantium ex ab perspiciatis.
      </p>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit nam error ipsa commodi exercitationem fugiat praesentium tempore inventore voluptate dolore. Ipsa quisquam nemo enim explicabo aut accusantium ex ab perspiciatis.
      </p>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit nam error ipsa commodi exercitationem fugiat praesentium tempore inventore voluptate dolore. Ipsa quisquam nemo enim explicabo aut accusantium ex ab perspiciatis.
      </p>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit nam error ipsa commodi exercitationem fugiat praesentium tempore inventore voluptate dolore. Ipsa quisquam nemo enim explicabo aut accusantium ex ab perspiciatis.
      </p>
    </div>
    <div class="nav_left">
		<form action="Member/loginpro.jsp" id="join" method="post" class="login-form">
      		<input type="text" placeholder="username" name="id" />
      		<input type="password" placeholder="password" name="password"/>
      		<button>login</button>
      		<p class="message">Not registered?<br/>
      		<a href="Member/join.jsp">Create an account</a></p>
    	</form>
    </div>
  </div>
  <!-- //container -->
    <div class="footer">
    <p class="copyright">&copy;copy</p>
  </div>
  <!-- //footer -->
</div>
<!-- //frame -->


</body>
</html>