package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CarConfirmBean;
import db.CarDAO;



/*CarReserveResult.jsp에서 예약된 차량의 주문 id,차량의 이미지 이름을 전달 받는 서블릿*/
@WebServlet("/CarConfirmUpdateController.do")
public class CarConfirmUpdateController extends HttpServlet {

	protected void Pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		/*클라이언트 요청값 전달받기*/
		int orderid = Integer.parseInt(request.getParameter("orderid"));
		String carimg = request.getParameter("carimg");
		
		CarDAO cdao = new CarDAO();
		CarConfirmBean cbean = cdao.getOneOrder(orderid);
		cbean.setCarimg(carimg);
		request.setAttribute("dto",cbean);
		RequestDispatcher view =
				request.getRequestDispatcher("CarMain.jsp?center=CarconfirmUpdate.jsp");
				view.forward(request, response);
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Pro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Pro(request, response);
	}
}
