package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CarDAO;
import db.CarOrderBean;


@WebServlet("/CarConfirmDeleteController.do")
public class CarConfirmDeleteController extends HttpServlet {

	protected void Pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int orderid = Integer.parseInt(request.getParameter("orderid"));
		String memberpass = request.getParameter("memberpass");
		
		CarDAO dao = new CarDAO();
		int result = dao.carOrderDelete(orderid,memberpass);
		/*1시 삭제성공 0시 삭제실패 즉 패스워드 오류*/
		if(result!= 0){
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();//알람 띄우기위해
			out.println("<script>");
			out.println("alert('렌트가 예약정보를 삭제 하였습니다');");
			out.println("location.href='CarListController.do'");
			out.println("</script>");
			
		}else{
			request.setAttribute("result", result);//0
			RequestDispatcher dis = request.getRequestDispatcher("CarMain.jsp?center=CarConfirmDelete.jsp");
			dis.forward(request, response);
			
		}
		
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Pro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Pro(request, response);
	}

}
