package myservlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TestServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req, resp);
	}
	//클라이언트로 부터 서블릿(TestServlet.java)으로 요청 받으면 오출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//사용자 요청을 응답받았으므로 응답을 해줄 cnt변수의 값을 생성하여...
		//자동으로 만들어지는 request영역에 100을 저장
		//request.setAttribute("cnt", 100);
		//session 객체 만들기
		//사용자가 TestServlet으로 요청을 하면 자동으로 생서오디는 request객체에 의해 만든다.
		HttpSession session =  request.getSession();
		session.setAttribute("cnt", 200);
	
		//요청에 대한 없무를 수행하는 페이지 경로를 RequestDispatcher객체에 저장하여 저장한 RequestDispatcher객체 리턴
		
		RequestDispatcher view =  request.getRequestDispatcher("AttributeTest.jsp");
		//실제 RequestDispatcher객체에 저장된 응답할 페이지로 이동하면서... request,response객체 영역을 전달		
		view.forward(request, response); // AttributeTest.jsp  request,response객체 영역을 전달
	}
	
	

}
