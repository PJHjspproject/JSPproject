<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<center>
		<h1>차량 주문 수정 페이지</h1>
		<form action="CarConfirmUpdateController.do" method="post">
			<table width="1000" border="0" align="center">
				<tr align="center">
					<td rowspan="7" width="600">
						<img src="img/${dto.carimg }" width="500" border="0"><br/>
					</td>
					<td align="center" width="200">대여기간</td>
					<td align="center" width="200">
						<select name="carreserveday">
							<option value="1">1일</option>
							<option value="2">2일</option>
							<option value="3">3일</option>
							<option value="4">4일</option>
							<option value="5">5일</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="center">대여일</td>
					<td align="center">
						<input type="date" name="carbegindate" value="${dto.carbegindate}"> 
					</td> 
				</tr>
				<tr>
					<td align="center">차량수량</td>
					<td align="center">
						<select name="carqty">
							<option value="1">1대</option>
							<option value="2">2대</option>
							<option value="3">3대</option>
							<option value="4">4대</option>
							<option value="5">5대</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="center">보험적용</td>
					<td align="center">
						<select name="carins">
							<option value="1">적용(1일 만원)</option>
							<option value="0">미적용</option>
						</select>
					</td> 
				</tr>
				<tr>
					<td align="center">와이파이</td>
					<td align="center">
						<select name="carwifi">
							<option value="1">적용(1일 만원)</option>
							<option value="0">미적용</option>
						</select>
					</td> 
				</tr>
				<tr>
					<td align="center">베이비시트</td>
					<td align="center">
						<select name="carbabyseat">
							<option value="1">적용(1일 만원)</option>
							<option value="0">미적용</option>
						</select>
					</td> 
				</tr>
				<tr>
					<td align="center" colspan="2">
						비밀번호 입력 : <input type="password" name="memberpass" size="10">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="submit" value="수정하기">
					</td>
				</tr>
			
			</table>
			</form>
	</center>
</body>
</html>