<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<img alt="" src="img/naeyeok.jpg">
		<p>
		<p>
		<table width="1000" border="1">

			<!-- CarListController에서 넘겨받은 request영역안에 있는 백터 사이즈 만큼 반복 -->

			<!-- 4열씩 자동차 이미지, 내용 뿌려주기 위해 4번 마다 <tr>태그를 열어준다. -->
			<tr align="center">
				<td align="center" width="150">차량 이미지</td>
				<td align="center" width="100">차량명</td>
				<td align="center" width="50">대여일</td>
				<td align="center" width="50">대여기간</td>
				<td align="center" width="100">대여금액</td>
				<td align="center" width="70">보험여부</td>
				<td align="center" width="70">무선와이파이</td>
				<td align="center" width="70">네비게이션</td>
				<td align="center" width="70">베이비시트</td>
				<td align="center" width="100">수정</td>
				<td align="center" width="100">삭제</td>
			</tr>
			<c:forEach var="v" items="${requestScope.v }">
				<tr>
					<td align="center" width="150"><img src="img/${v.carimg}"
						width="140" height="90"></td>
					<td align="center" width="100">${v.carname }</td>
					<td align="center" width="50">${v.carbegindate}</td>
					<td align="center" width="50">${v.carreserveday }</td>
					<td align="center" width="100">${v.carprice }</td>
					<td align="center" width="70">
						<c:if test="${v.carins==1 }">가입</c:if>
						<c:if test="${v.carins==0 }">미가입</c:if>
					</td>
					<td align="center" width="70">
						<c:if test="${v.carwifi==1 }">사용</c:if>
						<c:if test="${v.carwifi==0 }">미사용</c:if>
					</td>
					<td align="center" width="70">
						<c:if test="${v.carnavi==1 }">사용</c:if>
						<c:if test="${v.carnavi==0 }">미사용</c:if>
					</td>
					<td align="center" width="70">
						<c:if	test="${v.carbabyseat==1 }">사용</c:if> 
						<c:if	test="${v.carbabyseat==0 }">미사용</c:if>
					</td>
					<td align="center" width="100">
						<button onclick="location.href='CarConfirmUpdateController.do?orderid=${v.orderid}&carimg=${v.carimg }'">수정</button>
					</td>
					<td align="center" width="100">
						<button onclick="location.href='CarMain.jsp?center=CarConfirmDelete.jsp?orderid=${v.orderid}'">삭제</button>
					</td>
				</tr>
			</c:forEach>

		</table>
	</center>
</body>
</html>