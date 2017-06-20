<%@page import="board.BoardDto"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF8"%>
<%
	//한글 처리	
	request.setCharacterEncoding("UTF-8");
	
	//pageNum가져오기
	String pageNum = request.getParameter("pageNum");

%>
<jsp:useBean id="dto" class="board.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>

<%
BoardDAO dao = new BoardDAO(); //DB 수정 작업


//수정 성공하면 check == 1

//수정 실패하면 check == 0

int check = dao.updateBoard(dto);

//만약에 check 변수값이 1일때 "수정 성공" 메시지 띄워주고
if(check == 1){
	%>
	<script type="text/javascript">
		alert("수정 성공!");
		//notice.jsp로 이동. 이동시 pageNum값 전달
		location.href="notice.jsp?pageNum=<%=pageNum%>";
	</script>
	<%
}else{
	//만약에 check 변수값이 0일때 "비밀 번호 틀림" 메시지 띄워주고
	%>
	<script type="text/javascript">
	alert("비밀 번호 틀림!");
	//update.jsp로 이동(history.back)
	history.back();
	</script>
	<%
}





%>





