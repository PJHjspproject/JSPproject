<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 <script type="text/javascript">
 
 	function winopen() {
 		//회원가입시 아이디를 입력하지 않았을시 
		if(document.fr.id.value==""){
			alert("아이디를 입력하세요");
			document.fr.id.focus();
			return;
		}
		//작은창을 열기 join_IDCheck.jsp width=400 height=200
		var fid = document.fr.id.value;//폼태그에 아이디값 변수에저장
		window.open("join_IDCheck.jsp?userid="+fid , "", "width=400, height=200")
		
	}
	
 
 </script>
 
 
 
 
</head>
<body>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문메인이미지 -->
		<div id="sub_img_member"></div>
		<!-- 본문메인이미지 -->
		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="#">Join us</a></li>
				<li><a href="#">Privacy policy</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->
		<!-- 본문내용 -->
		<article>
			<h1>Join Us</h1>
			<form action="joinPro.jsp" id="join" method="post" name="fr">
				<fieldset>
					<legend>Basic Info</legend>
					<label>아이디</label> 
					<input type="text" name="id" class="id">
					<input type="button" value="아이디중복체크" class="dup" onclick="winopen()"><br>
					
					<label>비밀번호</label> 
					<input type="password" name="passwd"><br>
					
					<label>비밀번호 확인</label> 
					<input type="password" name="passwd2"><br>
					
					<label>이름</label> 
					<input type="text" name="name"><br>
					
					<label>이메일</label> 
					<input type="email" name="email"><br>
					
					<label>이메일 확인</label> 
					<input type="email" name="email2"><br>
				</fieldset>

				<fieldset>
					<legend>선택사항</legend>
					<label>주소</label> 
					<input type="text" name="address"><br>
					
					<label>집 번호</label> 
					<input type="text" name="tel"><br>
					
					<label>휴대폰번호</label> 
					<input type="text" name="mtel"><br>
					
					<label>나이</label> 
					<input type="text" name="age"><br>
					
					<label>성별</label>
					<input type="radio" name="gender" value="남자" >남
					<input type="radio" name="gender" value="여자" >여<br/>
					
					
				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<input type="submit" value="회원가입" class="submit"> 
					<input type="reset" value="다시 작성" class="cancel">
				</div>
			</form>
		</article>
		<!-- 본문내용 -->
		<!-- 본문들어가는 곳 -->

		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>