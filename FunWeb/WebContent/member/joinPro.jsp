<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javafx.scene.input.DataFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//1. join.jsp에서 전달받은 회원가입 내용을 담고있는 request영역에 데이터 한글처리
request.setCharacterEncoding("UTF-8");


//2. 회원정보를 DB에 저장하기위한 MemberDto 객체 생성
%>
<jsp:useBean id="dto" class="member.MemberDto"/>
<jsp:setProperty property="*" name="dto"/>
<!-- request안에있는 모든값을 꺼내오고 Dto에있는 set 메소드로 호출한다. -->

<%

	dto.setReg_date(new Timestamp(System.currentTimeMillis()));
	MemberDAO mdao = new MemberDAO();
	mdao.insertMember(dto);
	response.sendRedirect("login.jsp");
/* String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String mtel = request.getParameter("mtel");
	
	dto.setId(id);
	dto.setPasswd(passwd);
	dto.setName(name); */
/*	dto.setAge(age);
	dto.setGender(gender);
	dto.setEmail(email);
	dto.setTel(tel);
	dto.setMtel(mtel);
	 */
	 
	 
	 //3. 선행작업
	 //회원 추가 Db작업 하는 파일 수정 (패키지 member 파일이름 MemberDAO)
	 //insertMember() 메소드 추가하기
	 
%>