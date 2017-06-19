<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<img src="img/cis.jpg" border="0">
		<!-- 자동차 예약시 옵션선택하기 누를시 옵션 선택하기 페이지로 이동 -->
		<form action="CarMain.jsp?center=CarOption.jsp" method="post">
			<table width="1000" border="0">
				<tr align="center">
					<td rowspan="6" width="600"><img src="img/${bean.carimg}"
						width="500" border="0"></td>
					<td align="center" width="200">차량이름</td>
					<td align="center" width="200">${bean.carname}</td>
				</tr>
				<tr>
					<td align="center" width="200">대여수량</td>
					<td align="center" width="200"><select name="carqty">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
				</tr>
				<tr>
					<td align="center" width="200">차량분류</td>
					<td align="center" width="200">${bean.carcategory }</td>
				</tr>
				<tr>
					<td align="center" width="200">대여금액</td>
					<td align="center" width="200">${bean.carprice }</td>
				</tr>
				<tr>
					<td align="center" width="200">제조회사</td>
					<td align="center" width="200">${bean.carcompany}</td>
				</tr>
				<tr>
					<td align="center" width="200">
					<input type="hidden" name="carno" value="${bean.carno}">
					<input type="hidden" name="carimg" value="${bean.carimg}">
					<input type="hidden" name="carprice" value="${bean.carprice}">
					<input type="hidden" name="carcategory" value="${bean.carcategory}">
					<input type="button"
						value="이전(CarList.jsp)으로 이동" onclick="location.href='CarListController.do'">
					</td>
					<td align="center" width="200"><input type="submit"
						value="옵션선택하기"></td>
				</tr>
			</table>
		</form>
		<p>
		<b>차량 정보 상세 보기</b>
		${bean.carinfo }
	</center>
</body>
</html>