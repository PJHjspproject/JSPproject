<%@page import="member.MemberDAO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글 처리	
request.setCharacterEncoding("UTF-8");

%>
    
    
<jsp:useBean id="dto" class="member.MemberDto"/>
<jsp:setProperty property="*" name="dto"/>

<%
	MemberDAO dao = new MemberDAO();

	int check = dao.updateMember(dto);
	
	if(check == 1){
		%>
		<script type="text/javascript">
			alert("수정 성공!");
			//notice.jsp로 이동. 이동시 pageNum값 전달
			location.href="../index.jsp";
		</script>
		<%
	}else{
		//만약에 check 변수값이 0일때 "비밀 번호 틀림" 메시지 띄워주고
		%>
		<script type="text/javascript">
		alert("수정실패!");
		//update.jsp로 이동(history.back)
		history.back();
		</script>
		<%
	}

%>

