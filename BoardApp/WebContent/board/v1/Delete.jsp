<%@page import="sun.security.pkcs11.Secmod.DbMode"%>
<%@page import="com.bean.board.BoardDto"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");

	

%>
<jsp:useBean id="dao" class="com.bean.board.BoardDao"/>
<jsp:useBean id="dto" class="com.bean.board.BoardDto"/>

<%
	int num = Integer.parseInt(request.getParameter("num"));	
	BoardDto tempdto = dao.getBoard(num);
	String dbPass = tempdto.getPass();
	String paramPass = "";
	System.out.println(dbPass);
	System.out.println(paramPass);
	if(request.getParameter("pass") != null){
		//사용자가 입력한 패스워드값 paramPass변수에 저장
		paramPass = request.getParameter("pass");
		//(조건)만약에 DB패스워드와 사용자가 입력한 패스워드 값이 같지 않다면?
		if(!paramPass.equals(dbPass)){
			
%>	
			<script type="text/javascript">
				//경고창! -> 입력하신 비밀번호가 올바르지 않습니다.!
				alert("입력하신 비밀번호가 올바르지 않습니다.!");
				//이전 페이지로 이동
				history.back();			
			</script>		
<%			
			
		}else{//(조건)만약에 DB패스워드와 사용자가 입력한 패스워드 값이 동일 하다면?
			//삭제할 글번호를 deleteBoard(num)메소드로 넘겨서 글삭제DB작업하기
			dao.deleteBoard(num);
			//삭제에 성공 하면 List.jsp로 이동!
			response.sendRedirect("List.jsp");
		}
						
	}		

%>

<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		if (document.form.pass.value == "") {
		alert("패스워드를 입력하세요.");
		form.pass.focus();
		return false;
		}
		document.form.submit();
	}
</script>
</head>
<body>
<center>
<br><br>
<table width=50% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor=#dddddd height=21 align=center>
      사용자의 비밀번호를 입력해 주세요.</td>
 </tr>
</table>
<table width=70% cellspacing=0 cellpadding=2>
<form name=form method=post action="Delete.jsp" >
	<input type="hidden" name="num" value="<%=num%>">
 <tr>
  <td align=center>
   <table align=center border=0 width=91%>
    <tr> 
     <td align=center>  
	  <input type=password name=pass size=17 maxlength=15>
	 </td> 
    </tr>
    <tr>
     <td><hr size=1 color=#eeeeee></td>
    </tr>
    <tr>
     <td align=center>
	  <input type=button value="삭제완료" onClick="check()"> 
      <input type=reset value="다시쓰기"> 
      <input type=button value="뒤로" onClick="history.back()">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</form> 
</table>
</center>
</body>
</html>
