<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--구 방식 (스크립틀릿 방식) --%>
<%=request.getHeader("host")%><br/> <%--클라이언트가 요청한 서버측 주소 --%>
<%=request.getHeader("User-Agent")%><br/> <%-- 웹브라우저 정보 --%>
<hr/>
<br/><br/><br/>
<%--EL 표현식을 사용  --%>
${header.host }, ${header["host"] } <br/>
<%-- EL 표현식에서 중간에 -이나 특문이 들어가면 아먹힐 가능성이 있으므로 대괄호로 묶어서 쓰는건 권장 --%>
${header.["User-Agent"] }
.으로 접근할 경우 - 같은 기호가 붙은 변수이름을 사용하여 출력할수 없다.<br/>
["변수"]를 쓰는것을권장한다.
</body>
</html>