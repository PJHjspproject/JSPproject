<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
private String getBrowser(HttpServletRequest request) {
    String header =request.getHeader("User-Agent");
    if (header.contains("MSIE")) {
           return "MSIE";
    } else if(header.contains("Chrome")) {
           return "Chrome";
    } else if(header.contains("Opera")) {
           return "Opera";
    }
    return "Firefox";
}
	
%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//multi_pro.jsp페이지로 부터  request영역 전달 받아.. 파일가상경로 와, 파일명 꺼내오기
	String name = request.getParameter("name");
	String path = request.getParameter("path");
	

	/*가상경로 upload폴더를 전달하여---> 업로드한 실제 서버경로 구하기*/
	String realPath = getServletContext().getRealPath(path);
	String header = getBrowser(request);
	//out.println(realPath);

	/*
		(설명) 실행가능한 파일일지라도 무조건 다운로드 받게 처리 해야하는데...
		그러기위해서는 지금까지는?  클라이언트  <--- 응답(파일) ----- 서버 할떄.....
		응답 파일데이터  +  응답할 파일데이터에 대한 헤더 정보(어떤형식,누구한테전달,어떻게만들어졌고,응답데이터크기)
		등등..... 응답할 파일 데이터의 헤더 정보 또한 같이 클라이언트의 웹브라우저에 전달 해야 한다.
	*/

	//다운로드 파일을 서버에서 클라이언트의 브라우저로 내보내기 전에 헤더정보 설정하기
	response.setContentType("Application/x-msdownload");//다운로드 문서형식으로 내보내겠다고 수정하기
	//클라이언트의 웹브라우저에서 이코드를 인식함!
	
	
	
	//업로드된 서버에 있는 파일에 직접적으로 접근할수 있는 파일 객체 생성
	File file = new File(realPath + "/" +name);
	
	//이미 정해져 있는 헤더정보를 담는 Content-Disposition변수 값을?  첨부파일 이름을 저장 해주기
	if(header.contains("MSIE")){
		String docName = URLEncoder.encode(name,"UTF-8").replaceAll("\\", "%20");
		response.setHeader("Content-Disposition", "attachment; filename=" + docName + ";");
		
	}else{
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(name,"UTF-8") + ";");
	}
	

	//서버에 있는 파일의 데이터를  1024바이트 씩 읽어 들이기위한 단위
	byte[] data = new byte[1024];

	//http://blog.naver.com/gueri0322/221004308155  <---설명 보기  

	//만약에  다운로드할 파일이  file형식이 맞다면?
	if (file.isFile()) {
		out.clear();
		try {
			/*서버에 있는 다운로드할 파일의 내용을 읽어 들이기 위한 통로 준비 */
			// new FileInputStream(file) : 
			//다운로드할 실제 파일객체 가 가리키는 파일을 1바이트씩 읽어 들이기 위한 스트림 통로 만들기
			// new BufferedInputStream(new FileInputStream(file)) : 
			//파일객체가 가리키는 파일 데이터 모두를 1바이트씩 읽어 들여서..
			//별도 내부버퍼 공간에 모아두었다가....
			//한꺼번에 파일자체를 읽어 들이기 위한 통로 만들기 
			BufferedInputStream input = new BufferedInputStream(new FileInputStream(file));

			/*사용자에게 파일을 출력, 내보내기(다운로드)하기위한 통로 준비*/
			BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream());

			int read;

			while ((read = input.read(data)) != -1) {//read()메소드의 반환값은 읽어들이기 성공한 바이트수를 반환
				//전체 data배열의 0부터 1024개 바이트씩 묶어서 출력 버퍼에 내보낸다.
				output.write(data, 0, read);
			}
			//출력버퍼 공간이 가득 차지 않아도 파일내용을 강제적으로 사용자의 화면에 뿌려주는 기능을 제공한다.
			output.flush(); // 강제로 출력버퍼에서 데이터 비우기 
			output.close(); //자원 닫기
			input.close(); //자원 닫기

		} catch (Exception err) {
			err.printStackTrace();
		}

	}
%>