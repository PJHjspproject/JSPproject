<%@page import="member.MemberDto"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String id = (String)session.getAttribute("id");
	System.out.println(id);
	MemberDAO dao = new MemberDAO();
	MemberDto dto = dao.getMember(id);
	String newid = dto.getId();
	String name = dto.getName();
	String password = dto.getPassword();
	String phonenum = dto.getPhonenum();
	int age = dto.getAge();
	
	

%>

<!-- css 파일 분리 -->
<link rel="stylesheet" type="text/css" href="../css/index.css">
<link rel="stylesheet" type="text/css" href="../css/join.css">

<script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.userInfo.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
        }
    </script>

</head>
<body>
	<!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	<div class="frame">
		<jsp:include page="../inc/top.jsp" />
		


		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
		<div class="container">
		<jsp:include page="../inc/nav.jsp"/>
			<div class="content">
				<form method="post" action="updatepro.jsp" name="userInfo"
					onsubmit="return checkValue()">
					<b><font size="6" color="gray">회원수정</font></b>
					<table>
						<tr>
							<td id="title">아이디</td>
							<td><input type="text" name="id" maxlength="50"  value="<%=newid%>" readonly="readonly"> <input
								type="button"></td>
						</tr>

						<tr>
							<td id="title">비밀번호</td>
							<td><input type="password" name="password" maxlength="50">
							</td>
						</tr>

						<tr>
							<td id="title">비밀번호 확인</td>
							<td><input type="password" name="passwordcheck"
								maxlength="50"></td>
						</tr>

						<tr>
							<td id="title">이름</td>
							<td><input type="text" name="name" maxlength="50" value="<%=name%>"></td>
						</tr>

						<tr>
							<td id="title">성별</td>
							<td><input type="radio" name="gender" value="남" checked>남
								<input type="radio" name="gender" value="여" checked>여</td>
						</tr>

						<tr>
							<td id="title">나이</td>
							<td><input type="text" name="age" value="<%=age %>" /></td>
						</tr>

						<tr>
							<td id="title">이메일</td>
							<td><input type="text" name="mail1" maxlength="50">@
								<select name="mail2">
									<option>naver.com</option>
									<option>daum.net</option>
									<option>gmail.com</option>
									<option>nate.com</option>
							</select></td>
						</tr>

						<tr>
							<td id="title">휴대전화</td>
							<td><input type="text" name="phonenum" value="<%=phonenum%>"/></td>
						</tr>
						<tr>
							<td id="title">주소</td>
							<td><input type="text" id="sample4_postcode" placeholder="우편번호">
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="RoadAddress" placeholder="도로명주소" name="RoadAddr">
<input type="text" id="jibunAddress" placeholder="지번주소" name="JibunAddr">
<span id="guide" style="color:#999"></span></td>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('RoadAddress').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
						</tr>
					</table>
					<br> 
					<input type="submit" value="수정하기" /> 
					<input type="reset" value="취소">
				</form>
			</div>
		</div>
		<jsp:include page="../inc/footer.jsp" />
	</div>

</body>
</html>