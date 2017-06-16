<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	
	if(id == null){ //세션값이 없는 경우 
%>    
<div class="nav_left">
		<form action="../Member/loginpro.jsp" id="join" method="post" class="login-form">
      		<input type="text" placeholder="username" name="id" />
      		<input type="password" placeholder="password" name="password"/>
      		<button>login</button>
      		<p class="message">가입이 안되어있습니까?<br/>
      		<a href="../Member/join.jsp">회원가입</a></p>
    	</form>
    </div>
<%
	}else{
%>   		
		<div class="nav_left">
		<%=id %>님 환영합니다.<br/>
		<a href="../Member/logout.jsp">logout</a>
		
		 </div>
<% 
	}
%>
 
