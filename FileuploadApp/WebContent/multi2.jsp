<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<script type="text/javascript">
		function addInput() {
			//추가할 파일 변수값 가져오기
			//document.[form의 id값].[input의 id값].value
			var filecnt = document.f.add.value;
			//div 태그 위치 주소 가져오기
			var div = document.getElementById("inputDiv");
			//추가할 파일 갯수만큼 가져오기<input type="file">을 생성해서div 태그에 추가!
			for(i=0;i<filecnt;i++){
				var msg = "<input type='file' name='upfile" + i +  "'/><br/>";	
				//div 영역안에 위의 <input type="file">를 누적
				div.innerHTML += msg;
			}
			
		}
		
		function fnElementsCheck(f){
			//전달받은 <form>태그 안에있는 모든 input태그의 갯수를 알아낸다.
			var cnt = f.elements.length;
			
			var filecnt = 1;
			
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
		}
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>다중 파일 업로드</h1>
<form action="multi_pro.jsp" name="f" method="post" enctype="multipart/form-data">
	이름 : <input type="text" name="name" value=""><p/>
	주소 : <input type="text" name="addr" value=""><p/>
	하고싶은말 : 
	<textarea rows="3" cols="70" name="note"></textarea><p/>
	추가할 파일 수 입력 : <input type="text" name="add" size="2">
	<input type="button" value="추가" onclick="addInput()"><br/><p/>
	<div id="inputDiv">
		<input type="button" value="전송" onclick="fnElementsCheck(this.form)"/>
	</div>
</form>
</body>
</html>