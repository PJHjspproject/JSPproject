<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<!-- 결제하기 이미지 나타내기 -->
		<img alt="CarOrderController.do" src="img/haki.jpg" border="0">
		<%-- 결제하기 버튼을 눌럿을때 Controller 서블릿을 요청시 렌트 정보를 전달 --%>
		<form action="" method="post">
		<!-- 실제 예약에 관련한 데이터를 CarOrderController.java서블릿 파일로 전달 -->
		<input type="hidden" name="carno" value="${requestScope.cbean.carno }">
		<input type="hidden" name="carqty" value="${requestScope.cbean.carqty }">
		<input type="hidden" name="carreserveday" value="${requestScope.cbean.carreserveday }">
		<input type="hidden" name="carins" value="${requestScope.cbean.carins }">
		<input type="hidden" name="carwifi" value="${requestScope.cbean.carwifi }">
		<input type="hidden" name="carnavi" value="${requestScope.cbean.carnavi }">
		<input type="hidden" name="carbabyseat" value="${requestScope.cbean.carbabyseat }">
		<input type="hidden" name="carbegindate" value="${requestScope.cbean.carbegindate }">
		<p>
			<font size="13">차량 렌트 비용 : &#36;${requestScope.totalreserve}원</font>
		</p>
		<p>
			<font size="13">차량 옵션 비용 : &#36;${requestScope.totaloption}원</font>
		</p>
		<p>
			<font size="13">총 비용 : &#36;${totaloption+totalreserve}원</font>
		</p>
		<p>
			비회원 전화번호 예약:
				<input type="text" name="memberphone" size="10">&nbsp;&nbsp;&nbsp;
			비밀번호:
				<input type="password" name="memberpass" size="10">&nbsp;
				<input type="submit" value="결제하기">
		</p>
		</form>
	</center>

</body>
</html>