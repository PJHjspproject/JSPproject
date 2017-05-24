<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	
	request.setCharacterEncoding("UTF-8");
	//세션값 가져오는 이유 로그인시 글쓰기 작업 비활성화 하고 로그인후 작업가능하게
	//login.jsp 페이지로 이동
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String pass = request.getParameter("passwd");
	String id = (String)session.getAttribute("id");
	//세션값 x시 login.jsp로 이동
	if(id==null){
		response.sendRedirect("../member/login.jsp");
	}
	
%>
<%--액션태그로 BoardBean 객체 생성 --%>
<%--request 값을 전달받아 BoardDto에 저장 --%>
<jsp:useBean id="dto" class="board.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>

<%
	dto.setDate(new Timestamp(System.currentTimeMillis()));
	dto.setIp(request.getRemoteAddr());

	BoardDAO dao = new BoardDAO();
	int check = dao.updateBoard(dto);
	System.out.println("업데이트 결과"+check);
	if(check==1){
	%>
		<script type="text/javascript">
			alert("글수정 성공!");
			location.href="notice.jsp";
		</script>
	<% 
	}else{
	%>
		<script type="text/javascript">
		alert("글수정실패!");
		history.back();
		</script>
	<%	
	}
	
	
%>
