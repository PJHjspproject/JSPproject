package controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CarConfirmBean;
import db.CarDAO;

/*예약확인 페이지에세 렌트카 예약 정보를 확인 하기위해 
 * 입력한 전화번호와 비밀번호를 전달받아
 * DB에 해당하는 레코드가 있는 검사하는 서블릿 클래스*/
@WebServlet("/CarReserveConfirmController.do")
public class CarReserveConfirmController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Pro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Pro(request, response);
	}


	protected void Pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberphone = request.getParameter("memberphone");
		String memberpass = request.getParameter("memberpass");
		
		CarDAO cdao = new CarDAO();
		
		//예약 확인을 위해 렌트 예약시 입력한 비회원 전화번호와 패스워드 값을 전달
		//조건 1	전화번호와 비밀번호를 기준으로 하여 검색
		//조건 2	현재 날짜 보다 이전예약 현황은 보여주면 안된다.
		//CarconfirmBean 렌트 예약 객체를 담고있는 백터 객체 리턴받기
		Vector<CarConfirmBean> vector = cdao.getAllCarOrder(memberphone,memberpass);
		
		request.setAttribute("v", vector);
		RequestDispatcher view =
		request.getRequestDispatcher("CarMain.jsp?center=CarReserveResult.jsp");
		view.forward(request, response);
		
		
	}
}
