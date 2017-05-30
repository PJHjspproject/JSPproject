<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDto"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//1. join.jsp에서 전달받은  작성한 회원가입내용을 담고 있는 request영역의 데이터 한글처리
request.setCharacterEncoding("UTF-8");
%>
<%-- 2. 회원정보를 DB에 저장하기위한 MemberDto 객체 생성 --%>
<jsp:useBean id="memberDto" class="member.MemberDto"/>

<%-- 2.1 request.getParameter() 한 모든 값들을.... 모든 set메소드를 호출하여  memberDto에 저장 --%>
<jsp:setProperty property="*" name="memberDto"/>

<%
	//2.2 reg_date 값 저장 시키기 위한  memberDto객체의 setReg_date()메소드를 호출하여 ...
	//현재 회원 가입 날짜 를  memberDto객체에 추가로 저장 하기 
	memberDto.setReg_date(new Timestamp(System.currentTimeMillis()));

	//3. 먼저 해야 할 일!!!!!!
	//회원 추가 DB작업 하는 파일 수정 (패키지 member  파일이름 MemberDAO)
	//insertMember() 메소드 추가하기~~~~~~~~~
	
	//4.회원추가(회원가입) DB작업 할 DAO객체 생성
	MemberDAO mDao = new MemberDAO();
	//4-1.회원가입 메서드 호출시.. 
	//join.jsp에서 요청받은  회원정보를 담고 있는 memberDto객체를 인자로 전달하여 insert DB작업하기
	mDao.insertMember(memberDto);
	//5. 회원가입에 성공 했다면 login.jsp로 이동 
	response.sendRedirect("login.jsp");
%>












