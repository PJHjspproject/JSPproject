<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/index.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
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
    	<div id="map" style="width:600px; height:600px">
    	<script>
    	var map = new naver.maps.Map('map', {
    	    center: new naver.maps.LatLng(37.5666805, 126.9784147),
    	    zoom: 5,
    	    mapTypeId: naver.maps.MapTypeId.NORMAL
    	});

    	var infowindow = new naver.maps.InfoWindow();

    	function onSuccessGeolocation(position) {
    	    var location = new naver.maps.LatLng(position.coords.latitude,
    	                                         position.coords.longitude);

    	    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
    	    map.setZoom(10); // 지도의 줌 레벨을 변경합니다.

    	    infowindow.setContent('<div style="padding:20px;">' +"나의 자전거 위치!!"+'</div>');

    	    infowindow.open(map, location);
    	}

    	function onErrorGeolocation() {
    	    var center = map.getCenter();

    	    infowindow.setContent('<div style="padding:20px;">' +
    	        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "나의 자전거 위치!!!'</div>'");

    	    infowindow.open(map, center);
    	}

    	$(window).on("load", function() {
    	    if (navigator.geolocation) {
    	        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
    	    } else {
    	        var center = map.getCenter();

    	        infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');
    	        infowindow.open(map, center);
    	    }
    	});
    	

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