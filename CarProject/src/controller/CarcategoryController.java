package controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CarDAO;
import db.CarListBean;

/*
 CarReservation.jsp에서  소형, 중형, 대형  하나를 선택해서  자동차 검색 요청이 들어오는 서블릿 클래스  
 */
@WebServlet("/CarcategoryController.do")
public class CarcategoryController extends HttpServlet {
	
	//doGet, doPost 방식으로 데이터 가 넘어오던 말던 모두 현재 메소드에서 요청 받기 
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//CarList.jsp 또는  CarReservation.jsp에서 사용자가 선택한 카테고리값을 먼저 읽어드림.
		String carcategory = request.getParameter("carcategory");
		
		//자바빈 객체 생성
		CarDAO cdao = new CarDAO();
		
		Vector<CarListBean> v = cdao.getCategoryCarList(carcategory);
		
		request.setAttribute("v", v);
		
		RequestDispatcher view = 
					request.getRequestDispatcher("CarMain.jsp?center=CarList.jsp");
		view.forward(request, response);
		
		
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			requestPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			requestPro(request, response);
	}

}
