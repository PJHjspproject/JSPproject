<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/index.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=6sCoyc9ou7qZ5MrO4nVk">
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
    	    center: new naver.maps.LatLng(37.3595704, 127.105399),
    	    mapTypeControl: true,
    	    mapTypeControlOptions: {
    	        style: naver.maps.MapTypeControlStyle.DROPDOWN
    	    }
    	});

    	var bicycleLayer = new naver.maps.BicycleLayer();

    	var btn = $('#bicycle');

    	naver.maps.Event.addListener(map, 'bicycleLayer_changed', function(bicycleLayer) {
    	    if (bicycleLayer) {
    	        btn.addClass('control-on');
    	    } else {
    	        btn.removeClass('control-on');
    	    }
    	});

    	bicycleLayer.setMap(map);

    	btn.on("click", function(e) {
    	    e.preventDefault();

    	    if (bicycleLayer.getMap()) {
    	        bicycleLayer.setMap(null);
    	    } else {
    	        bicycleLayer.setMap(map);
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