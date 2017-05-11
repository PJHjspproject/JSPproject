package myservlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.Dog;
import mybean.Person;

public class TestServlet3 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req, resp);
	}
	//클라이언트로 부터 서블릿(TestServlet2.java)으로 요청 받으면 오출되는 메소드
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Person p =new Person();
		p.setName("홍길동");
		Dog d = new Dog();
		d.setName("시츄");
		p.setDog(d);

		req.setAttribute("person", p);

		RequestDispatcher view =  req.getRequestDispatcher("BeanTest.jsp");
		
		view.forward(req,res);
		
	
	}
	
	

}
