package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CarDAO;
import db.CarOrderBean;

/*CarOrder.jsp에서 전달한 요청정보를 전달받는 서블릿*/
@WebServlet("/CarOrderController.do")
public class CarOrderController extends HttpServlet {


	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//CarOrder.jsp에서 넘겨받은 클래스 들을 자바빈클래스에 담기
		CarOrderBean cbean = new CarOrderBean();
		cbean.setCarno(Integer.parseInt(request.getParameter("carno")));
		cbean.setCarqty(Integer.parseInt(request.getParameter("carqty")));
		cbean.setCarreserveday(Integer.parseInt(request.getParameter("carreserveday")));
		cbean.setCarbegindate(request.getParameter("carbegindate"));
		cbean.setCarins(Integer.parseInt(request.getParameter("carins")));
		cbean.setCarwifi(Integer.parseInt(request.getParameter("carwifi")));
		cbean.setCarnavi(Integer.parseInt(request.getParameter("carnavi")));
		cbean.setCarbabyseat(Integer.parseInt(request.getParameter("carbabyseat")));
		cbean.setMemberphone(request.getParameter("memberphone"));
		cbean.setMemberpass(request.getParameter("memberpass"));
		CarDAO cdao = new CarDAO();
		/*CarDAO클래스에 주문현황을 DB에저장하는 메소드를 만들기(자바빈 객체를 전달하여 insert) -> 저장할것들이 자바빈 객체에 저장되어있다*/
		
		cdao.insertCarOrder(cbean);
	
		//CarList.jsp로 이동하기 위해서 작성
		RequestDispatcher dis = request.getRequestDispatcher("CarListController.do");
		dis.forward(request, response);
	}


	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

}
