<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>Insert title here</title>

<script type="text/javascript">
	//직원 데이터를 삭제할때 한번더 물어보기
	function fnDel(no){
		//메세지 박스에 "확인","취소" 선택을 해을때 true /false값을 반환
		var result = confirm("데이터를 정말로 삭제 하시겟습니까?");
		
		//"확인" 버튼을 클릭 하였으면 delSawon.jsp삭제 페이지로 이동 이동시 삭제할 직원 no을 이동 
		if(result==true){
			location.href="delSawon.jsp?no=" +no;
		}
		
	}


</script>
<meta name="viewpoint " content="width=device-width; initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 <style type="text/css">
 	.table{
 		width: 50%
 	}
 </style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	//검색기능 <form>태그에서 요청받은 검색기준값, 검색어  전달받아 저장
	String search = request.getParameter("search");
	String searchText = request.getParameter("searchText");
	


%>


<%--순서1 --%>
<h1 align="center">직원 정보 리스트</h1>

<%--직원 추가(회원가입)페이지로 이동하는 링크 --%>
<div align="center">
<a href="addSawon.jsp">직원 추가(회원가입)</a>
</div>
<%-- 검색기능 검색기준값 + 검색어 --%>
<div align="center">
<form action="index.jsp" method="post">
	<select name="search">
		<option value="id">ID</option>
		<option value="addr">근무지</option>
		<option value="dept">부서명</option>
	</select>
	<input type="text" name="searchText" />
	<input type="submit" value="검색" />
</form>
</div>
<%--직원 정보 리스트 --%>
<div align="center">
<table class="table table-condensed table-bordered">
	<tr>
		<th width="5%">ID</th>
		<th width="5%">이름</th>
		<th width="5%">나이</th>
		<th width="5%">근무지</th>
		<th width="5%">부서명</th>
		<th width="6%">내선번호</th>
		<th width="3%">수정</th>
		<th width="3%">삭제</th>
	</tr>
<%-- DB연결 --%>	

<%
		//1. DB연결을 위한 객체를 담을 변수
		Connection con = null;
		//2.DB연결후 DB에 SQL 쿼리 실행할 객체를 담을 변수
		Statement stmt = null;
		//3.ResultSet 객체 - DB로 부터 select된 결과값을 임시로 저장하는 객체
		//단 하나의 테이블만을 저장할수 있는 구조이다. 반드시 처음에는 데이터를 가리키는 포인터를 한칸 이동 시켜야함
		ResultSet rs = null;
		//TODO :driverName, url,id,pw 변수 선언
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspbeginner";
		String id = "jspid";
		String pw = "jsppass";
		//sql문을 저장할 변수
		//sql문을 저장할 변수
		String sql = "";
		
		//3번쨰 sql구문 문비 : 검색어가 입력했다면? 입력되지않았다면?
		try{
			//검색어가 입력되어있지 않다면  모든 직원을 검색하게
			if(searchText.isEmpty()){
				sql ="select * from tblsawon";
			}else{
				sql = "select * from tblsawon where " + search + " like '%" + searchText + "%'";  
			}

		}catch(NullPointerException e){//처음에 검색어가 입력되지 않았을때.. 모든직원벙보 리스트 뿌려주기 예외처리
			//index.jsp가 실행되면 첫화면에 모든 사원의 리스트가 뿌려진다.
			sql = "select * from tblSawon";
					
		}
		
	//순서4 DB연결
	
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, id, pw);
		//DB에 sql구문을 전달 및 sql 구문 
		stmt =con.createStatement();
		//Select 만 executeQuery만을 실행
		rs = stmt.executeQuery(sql);
		//SQL 실행 구문을 실행후 검색한 결과값은 ResultSet객체에 담긴다.
		while(rs.next()){//테이블에 컬럼명을 커서 포인터로 가르키는데
			/*하나의 직원 정보 ResultSet에서 (rs에서) 꺼내오기
			DB로 부터 Select결과값중 ResultSet객체에 저장된 하나의 DB레코드 정보중 no값 꺼내와서 저장
			*/
			String s_no = String.valueOf(rs.getInt("no"));        //정수를 우겨넣으면 문자를 반환한다.
			String s_id = rs.getString("id");
			String s_name=rs.getString("name");
			String s_pw=rs.getString("pass");
			int s_age= rs.getInt("age");
			String s_addr=rs.getString("addr");
			String s_dept=rs.getString("dept");
			String s_extension=rs.getString("extension");
%>
			<tr>
				<td><%=s_id%></td>
				<td><%=s_name %></td>
				<td><%=s_age %></td>
				<td><%=s_addr %></td>
				<td><%=s_dept %></td>
				<td><%=s_extension %></td>
				<td><a href="modifySawon.jsp?no=<%=s_no%>">수정</a></td>
				<!-- 정말로 삭제 하시겟습니까?? 물어본다. -->
				<td><a href="javascript:fnDel(<%=s_no%>)">삭제</a></td>
				
			</tr>
<% 	
		}
		
	}catch(Exception err){
		System.out.println("index.jsp에서 오류 :"+err);
		
	}finally{//자원 해제 무조건실행된다.
		if(rs!=null)try{rs.close();}catch(Exception ers){}
		if(stmt!=null)try{stmt.close();}catch(Exception estmt){}
		if(con!=null)try{con.close();}catch(Exception econ){}
				
	}
%>
	
</table>
</div>
</body>
</html>