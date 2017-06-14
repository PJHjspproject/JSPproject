<%@page import="java.util.Vector"%>
<%@page import="db.CarDAO"%>
<%@page import="db.CarListBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	CarDAO cdao =new CarDAO();
	String Carcategory = request.getParameter("carcategory");
	Vector v =(Vector)request.getAttribute("v");
	
	
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색한 차량리스트들</title>
</head>
<body>
	<center>
		<!-- <차량 정보 보기> 이미지 적용  -->
		<img src="img/cis.jpg" border="0">
		<!-- 실제 전체차량에 관한 이미지 뿌려주기 -->
		
		<form action="CarcategoryController.do" method="post">
		<table width="1000" border="0" height="470">
		

		
			
<%
	for(int i=0 ; i<v.size(); i++){
		if(i%2==0){
%>
	<tr align="center">
<% 			
		}
		CarListBean cbean = (CarListBean)v.get(i);
		String img = cbean.getCarimg();
		int carprice = cbean.getCarprice();
		String carname =cbean.getCarname();
%>		
		<td>
		<img src="img/<%=img%>" width="220" height="180"><br/>
		차 가격: <%=carprice %><br/>
		차량 명: <%=carname %><br/>
		</td>
			
		
<%
	}
%>
		</tr>
<%-- 	
			<c:set var="j" value="0" />
			<!-- CarListController에서 넘겨받은 리퀘스트 영역안에 있는 백터 사이즈 만큼 반복 -->
			<c:forEach var="v" items="${requestScope.v}">
				<!-- 4열식 자동차 이미지와 내용을 뿌려주기 위해서 4개의 자동차 정보를 뿌려줄때 마다 <tr>태그를 열어준다 -->
				<c:if test="${j%4 == 0}">
					<tr align="center">
				</c:if>
				<td>
					<img alt="자동차이미지" src="img/${v.carimg }" width="220" height="180"><br/>
					차량명 : ${v.carname }<br/>
					대여금액 : ${v.carprice }
					
					
				</td>
				<c:set var="j" value="${j+1}"/>
			</c:forEach>
			 </tr> --%>
			 <tr height="70">
			 	<td colspan="4" align="center">
			 		차량검색 : <select name="carcategory">
									<option value="Small">소형</option>
									<option value="Mid">중형</option>
									<option value="Big">대형</option>			 		
			 					</select>
			 					&nbsp;&nbsp;&nbsp;
			 					
			 					<input type="submit" value="차량검색">
			 	</td>
			 </tr>	
			 					
		</table>
		</form>
	</center>
</body>
</html>