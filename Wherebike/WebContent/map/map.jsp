<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/index.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=W5qCf23nmGNVZY0je3N5">
</script>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");

	if(id==null){
%>		
	<script type="text/javascript">
		alert("로그인후 시도하세요");
		location.href='../index.jsp';
	</script>	
	
<%
	}else{
%>


<div class="frame">
 <jsp:include page="../inc/top.jsp"/>
  
  <!-- //header -->
  <div class="container">
    <jsp:include page="../inc/nav.jsp"/>
    <!-- //nav -->
    <div class="content">
    	<div id="map" style="width:400px; height:600px">
    	<script>
	var mapOptions = {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
	};
	//지도를 삽입할 HTML 엘리먼트 또는 HTML 엘리먼트의 id를 지정합니다.
	var mapDiv = document.getElementById('map'); // 'map' 으로 선언해도 동일

	//옵션 없이 지도 객체를 생성하면 서울시청을 중심으로 하는 11레벨의 지도가 생성됩니다.
	var map = new naver.maps.Map(mapDiv);
	
</script>
			</div>
    </div>
	<jsp:include page="../inc/login.jsp"/>
  </div>
  <!-- //container -->
 	<jsp:include page="../inc/footer.jsp"/>
  <!-- //footer -->
</div>
<!-- //frame -->

<%
	}
%>
</body>
</html>