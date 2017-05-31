<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("UTF-8");
	//업로드할 실제 서버경로 얻기
	//String realFolder=getServletContext().getRealPath("upload");
	String realFolder="D:/";
	/*업로드할수있는 파일의 최대크기  지정 100MB*/
	int max = 100 *1024 * 1024;
	MultipartRequest multi = new MultipartRequest(request,realFolder,max,"UTF-8",new DefaultFileRenamePolicy());
	
	String name = multi.getParameter("name");
	String addr = multi.getParameter("addr");
	String note = multi.getParameter("note");
	
	//서버에 실제로 업로드된 파일의 "이름" 들을 저장할 컬렉션 객체 생성
	ArrayList saveFiles = new ArrayList();
	//클라이언트가 업ㄹ로드한 파일을 원본이름 하나하나씩 저장할 ArrayList객체 생성
	ArrayList originFiles = new ArrayList();
	
	Enumeration e = multi.getFileNames();
	
	while(e.hasMoreElements()){
		String filename = (String)e.nextElement();
		//서버에 실제로 업로드된 파일의 이름 하나씩 ArrayList객체에 담기
		saveFiles.add(multi.getFilesystemName(filename));
		//클라이언트가 업로드한 파일의 원본이름 하나씩 ArrayList 객체에 담기
		originFiles.add(multi.getOriginalFileName(filename));
		
		
	}

%>

<ul>
	<li>이름 : <%=name %></li>
	<li>주소 : <%=addr %></li>
	<li>하고싶은 말 :<%=note %></li>
</ul>
<hr/>
파일리스트<br/>
<ul>
	<%
		for(int i=0; i<saveFiles.size(); i++){
	%>
		<li>
			<a href="download.jsp?path=upload&name=<%=saveFiles.get(i)%>"><%=originFiles.get(i) %></a>
		</li>
	<%
		} 
	%>
</ul>