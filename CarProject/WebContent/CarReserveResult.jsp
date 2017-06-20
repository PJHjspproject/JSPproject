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

	<table width="1000" border="0" height="470">
			<c:set var="j" value="0"/>
			<!-- CarListController에서 넘겨받은 request영역안에 있는 백터 사이즈 만큼 반복 -->
			<c:forEach var="v" items="${requestScope.v }">
				<!-- 4열씩 자동차 이미지, 내용 뿌려주기 위해 4번 마다 <tr>태그를 열어준다. -->
					<tr align="center">
						<td><!-- 선택하는 자동차를 렌트하기위해.. 서블릿 요청시.. 차번호 전달 -->
							<img alt="" src="img/${v.carimg}" width="220" height="180"></td>
							<td> 차량명 : ${v.carname }<br/>
									대여금액 : ${v.carprice }<br/>
									렌트주문번호 : ${v.orderid }<br/>
									대여할 일수 : ${v.carreserveday }<br/>
									차량명 : ${v.carname }<br/>
									차량 인수 : ${v.carqty }<br/>
							</td>
							<td>
								<input type="button" value="예약수정"><br/>
								<input type="button" value="예약삭제">
							</td>
				<c:set var="j" value="${j+1 }"/>		
				</tr>
			</c:forEach>

	</table>
</body>
</html>