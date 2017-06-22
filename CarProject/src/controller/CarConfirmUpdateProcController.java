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

/*CarfonfirmUpdate.jsp에서 주문 아이디를 차량예약주문 을 다시 수정처리하는 서블릿*/
@WebServlet("/CarConfirmUpdateProcController.do")
public class CarConfirmUpdateProcController extends HttpServlet {

	protected void Pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int orderid = Integer.parseInt(request.getParameter("orderid"));
		System.out.println(orderid);
		int carreserveday = Integer.parseInt(request.getParameter("carreserveday"));
		int carqty = Integer.parseInt(request.getParameter("carqty"));
		int carins = Integer.parseInt(request.getParameter("carins"));
		int carwifi = Integer.parseInt(request.getParameter("carwifi"));
		int carbabyseat = Integer.parseInt(request.getParameter("carbabyseat"));
		String carbegindate = request.getParameter("carbegindate");
		String memberpass = request.getParameter("memberpass");
		
		CarOrderBean cbean = new CarOrderBean();
		cbean.setOrderid(orderid);
		cbean.setCarreserveday(carreserveday);
		cbean.setCarqty(carqty);
		cbean.setCarins(carins);
		cbean.setCarwifi(carwifi);
		cbean.setCarbabyseat(carbabyseat);
		cbean.setCarbegindate(carbegindate);
		cbean.setMemberpass(memberpass);
		
		CarDAO dao = new CarDAO();
		int result = dao.carOrderUpdate(cbean);
		if(result==1){
			
			System.out.println("수정성공");
			RequestDispatcher view =
			request.getRequestDispatcher("CarMain.jsp");
			view.forward(request, response);
		}else{
			System.out.println("수정실패");
			RequestDispatcher view =
					request.getRequestDispatcher("CarMain.jsp?center=CarList.jsp");
					view.forward(request, response);
		}
		
	
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Pro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Pro(request, response);
	}

}
