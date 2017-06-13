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
/*전체 차량보기라는 버튼을 클릭했을때 클라이언트의 요청을 받는 서블릿 클래스 입니다.*/
@WebServlet("/CarListController.do")
public class CarListController extends HttpServlet {

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*전체 차량 보기 검색*/	
		
		CarDAO cdao = new CarDAO();
		//실제 데이터베이스에 접근하여 자동차 정보를 보두 검색해서 백터에 저장
		Vector<CarListBean> vector= cdao.getAllCarlist();
		
		//carList.jsp화면에 보여질 뷰페이로 이동시킬때 request객체에 담어서 보내줍니다.
		request.setAttribute("v", vector);
		RequestDispatcher dis =
		request.getRequestDispatcher("CarMain.jsp?center=CarList.jsp");
		dis.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		service(request, response);
	}

}
