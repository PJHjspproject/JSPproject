<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	1번 폼태그에서 요청값을 담은 리퀘스트객체를 사용하여 
	다시 request.getParameter() 메소드를 이용하여 전달받아....
	1번폼태그의 이름,주소 인풋태그 하고싶은말 태그에 데이터 뿌리기
 -->
 
 <%
 		//한글처리
 		request.setCharacterEncoding("UTF-8");
 %>
 <%! 
 	//1번폼태그에서 인풋태그의 value값을 요청하는 메소드를 만들기
 	public String getParam(HttpServletRequest request , String param){
	 //request객체에 담겨있는 데이터가 있는 경우 
	 if(request.getParameter(param)!= null){
		 return request.getParameter(param);
	 }else{
		 //비어있는 값을 리턴
		 return "";
	 }
	 
 }
 %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function Check(f) {
		//두번째 form 태그에 접근하여 폼안에 있는 모든 input태그 수 구하기
		//forms[] 배열 : <form>에 접근
		//elements : <form>태그안에 있는 모든 input요소를 말한다 length : 길이
		var cnt = f.elements.length;
		
		//cnt변수값은 input태그 갯수
		//기본 cnt는 4개 여기서 파일갯수를 3개 더 포함하면 7개가된다.
		
		//누락된 파일업로드 위치를 나타낼 변수
		var filecnt = 1;
		/*
		두번째 폼태그에서 업로드된 파일개수를 사용자에 의해서 동적으로 입력받기떄문에
		두번째 폼태그안에 for문을 이용해서 input type 이 동적으로 만들어진다.
		동적으로 만들어진 input 태그 중에서 업로드할 경로를 지정해주시않은 태그가 있다면 x번째 파일이 누락되었다고 경고창을 띄움
		*/
		//반복문을 이용해 두번째 폼태그안에있는 모든 인풋태그 개수만큼 반복시킨다.
		for(i = 0 ; i<cnt;i++){
			//두번쨰 폼 내부에있는 인풋태그의 타입이 파일과 같고
			if(f.elements[i].type=="file"){
				//인풋파일 태그중에서 파일이 첨부안된 곳이있다면 
				if(f.elements[i].value== ""){
					//x번째 파일 첨부란이 누락되었다.
					var msg = filecnt + "번째 파일정보가 누락되어습니다. \n 확인해주세요";
					alert(msg);
					f.elements[i].focus();
					return;
				}//if(f.elements[i].value== "")  end
				
				//인풋태그의 타입이 file일때만 filecnt값을 1증가
				filecnt++;
			}//if(f.elements[i].type=="file") end
			
		}//for end
		f.submit(); //multu_pro.jsp로 전송
	}//check() end
	
</script>

</head>
<body>
<h1>다중 파일 업로드</h1>
<!-- 
	여러개의 파일을 업로드 : 여러개의 input 태그를 만드는데....
	이왕이면 정해진 개수를 만드는것보다 내가 원하는 개수만큼 늘려서 파일을 업로드하자


 -->
 
 <!--1.  1번 폼태그 -->
<form action="multi.jsp" method="post">
	이름 : <input type="text" name="name" value="<%=getParam(request, "name")%>"><p/>
	주소 : <input type="text" name="addr" value="<%=getParam(request, "addr")%>"><p/>
	하고싶은말 : 
	<textarea rows="3" cols="70" name="note"><%=getParam(request, "note")%></textarea><p/>
	추가할 파일 수 입력 : <input type="text" name="add" size="2">
	<input type="submit" value="추가">
</form>

<!--2. 변수선언 및 파일갯수 저장 -->
<%
	//추가할 파일 개수를 저장할 변수
	int filecnt = 0;
	//name 값이 add인 인풋태그에 요청값이 있으면..
	if(request.getParameter("add") !=null){
		filecnt = Integer.parseInt(request.getParameter("add"));
		
	}
%>
<!--3. 1번 폼태그에서 업로드할 파일수를 전달받아 업로드할 파일 개수만큼 for문을 이용하여 input태그를 만들기 -->
<form action="multi_pro.jsp" enctype="multipart/form-data" method="post">

	<input type="hidden" name="name" value="<%=getParam(request, "name")%>">
	<input type="hidden" name="addr" value="<%=getParam(request, "addr")%>">
	<input type="hidden" name="note" value="<%=getParam(request, "note")%>">
<%
	//업로드할 파일개수 for문이 돌아간 수만큼 생성
	for(int i=0;i<filecnt;i++){
%>
	<%=i+1 %>번째 파일선택 : <input type="file" name="upfile<%=i%>"><br/> 
<%
	}
%>
<input type="button" value="파일업로드" onclick="Check(this.form)">
</form>
</body>
</html>