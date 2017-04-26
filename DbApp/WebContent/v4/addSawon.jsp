<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta name="viewpoint " content="width=device-width; initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%--순서 1. 회원가입 페이지 register.jsp에서 요청할 값들을 자바빈클래스(RegisterDto)클래스에 저장하기 위해
		mybean.tip 패키지에 DTO클래스 만들기 --%>
<h1 align="center">회원가입 페이지</h1>
<form action="addSawon_proc.jsp" method="post">
	<div align="center">
	<h1>직원 추가</h1>
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pass"></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><input type="text" name="age"></td>
		</tr>
		<tr>
			<th>근무지</th>
			<td>
				<select name="addr">
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="인천">인천</option>
				<option value="수원">수원</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>내선번호</th>
			<td><input type="text" name="extension"></td>
		</tr>
		<tr>
			<th>부서명</th>
			<td>
				<select name="dept">
				<option value="영업">영업</option>
				<option value="기술">기술</option>
				<option value="기획">기획</option>
				<option value="개발">개발</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="가입" class="btn btn-default"/> &nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="취소" class="btn btn-danger" onclick="location='index.jsp'"/>
		</tr>
	</table>
	</div>
</form>

</body>
</html>