package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CarDAO;
import db.CarListBean;


@WebServlet("/CarInfoController.do")
public class CarInfoController extends HttpServlet {
	
	
	protected void pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int carno = Integer.parseInt(request.getParameter("carno"));
		
		CarDAO cdao =new CarDAO();
		CarListBean bean = cdao.getOneCar(carno);
		
		request.setAttribute("bean", bean);
		RequestDispatcher view =
		request.getRequestDispatcher("CarMain.jsp?center=CarInfo.jsp");
		view.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		pro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		pro(request, response);
	}

}
