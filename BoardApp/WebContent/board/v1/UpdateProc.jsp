<%@page import="com.bean.board.BoardDto"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//한글 처리
	request.setCharacterEncoding("UTF-8");
%>
<%--수정 DB작업을 위한 DAO객체 생성 --%>
<jsp:useBean id="dao" class="com.bean.board.BoardDao"/>

<%--수정한 데이터들을 DTO객체에 저장 --%>
<jsp:useBean id="dto" class="com.bean.board.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>


<%
	//수정할 글번호 가져오기
	int num =  Integer.parseInt(request.getParameter("num"));

	//수정할 글번호를 통해 수정할 글정보를 담고 있는 DTO객체 가져오기
	BoardDto tempDto = dao.getBoard(num);
	//DB에 저장된 수정할 글정보중!! DB에 저장된 패스워드값 가져오기
	String storedPass = tempDto.getPass(); // DB패스워드 
	//Upadate.jsp페이지에서 수정시 작성한 비밀번호 값 가져오기 
	String paramPass = dto.getPass(); //사용자가 입력한 패스워드 
	
	//Update.jsp페이지에서 수정시  입력한 비밀번호 값과  DB에 저장되어 있는 비밀번호 비교
	if(!paramPass.equals(storedPass)){
		
		System.out.println(storedPass);
		System.out.println(paramPass);
%>
	<script type="text/javascript">
		alert("입력하신 비밀번호가 올바르지 않습니다. 다시 입력해 주세요.");
		history.back();
	</script>
		
<%		
	}else{
		//DB에 있는 패스워드값과 사용자가 입력한 패스워드가 동일할때... 
		//실제 글수정 DB작업
		dao.updateBoard(dto);
		//List.jsp로 이동
		response.sendRedirect("List.jsp");
		
	}
	
%>








