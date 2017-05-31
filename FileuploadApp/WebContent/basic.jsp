<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/* multipartRequest 클래스 : 파일업로드를 직접적으로 담당하는 클래스 
		cos.jar파일에 정의되었다
 */
 response.setCharacterEncoding("UTF-8");
 //현재 실행중인 웹프로젝트에 대한 정보를 지니고 있는 객체 얻기
 ServletContext ctx = getServletContext();

// 현재 실행중인 웹프로젝트에 대한 정보 객체의 getRealPath()메소드를 이용하여...
// 가상경로를 실제경로로 바꿔주기

//업로드할 실제 서버경로
String realPath = ctx.getRealPath("upload");

//가상경로는 /upload
/*
실제 경로 : C:/javascript/.metadata/.plugins/org.eclipse.wst.server.core
/tmp0/wtpwebapps/FileuploadApp/upload/
*/
/*업로드 할 수 있는 최대 파일 크기 지정*/
int max = 10*1024*1024;
//파일 업로드
//인수1. basic.html에서 전달받은 request영역
//인수2. 업로드 된 파일의 위치 
//인수3. 업로드한 파일의 최대 크기
//인수4. 파일이름이 한글인 경우 인코딩타입지정
//인수5. 인자는 똑같은 파일을 업로드 할 경우 중복 방지를 위하여 파일이름을 변환해주는 기능
	MultipartRequest multi = 
		new MultipartRequest(request,"D:/",max,"UTF-8",new DefaultFileRenamePolicy());

	String user = multi.getParameter("user");
	String title = multi.getParameter("title");
	
	out.println(user+","+title);
	
	//업로드한 파일을 Enumeration 타입으로 반환한다.
	Enumeration e = multi.getFileNames();
	
	while(e.hasMoreElements()){
		String name = (String)e.nextElement();
		out.println("클라이언트가 업로드한 파일 원본 이름 : " + multi.getOriginalFileName(name)+ "<br/>");
		out.println("서버에 실제로 업로드된 파일의 이름 : " + multi.getFilesystemName(name)+"<br/>");
		//서버의 업로드된 파일의 정보를 객체로 얻어온다
		File f = multi.getFile(name);
		out.print("파일크기 :" +f.length() + "byte<br/>");
	}
	


%>