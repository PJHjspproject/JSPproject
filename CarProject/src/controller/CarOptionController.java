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

/*CarOption.jsp에서 예약하기 버튼을눌럿을때 요청을 받는 서블릿 클래스*/
@WebServlet("/CarOptionController.do")
public class CarOptionController extends HttpServlet {

	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*<input type="hidden">으로 넘긴값을 사용하기위해 request영역에 담겨있는것을 꺼내와 변수에 저장*/
		int carqty = Integer.parseInt(request.getParameter("carqty"));
		int carprice = Integer.parseInt(request.getParameter("carprice"));
		int carreserveday = Integer.parseInt(request.getParameter("carreserveday"));
		int carno = Integer.parseInt(request.getParameter("carno"));
		
		//보험비 적용 여부 받기 
		/*
		 * 	보험적용 1일일시 :값 1을받기
		 * 보험 미적용이면 : 값 0받기 
		 * */
		
		int carins = Integer.parseInt(request.getParameter("carins"));
		
		//WIFI 적용 여부 받기 
		/*
		 * 	WIFI 1일사용시 :값 1을받기
		 * WIFI 미적용이면 : 값 0받기 
		 * */
		int carwifi = Integer.parseInt(request.getParameter("carwifi"));
		
		//네비게이션 적용 여부 받기 
		/*
		* 	보험적용시 무료 :값 1을받기
		*  보험 미적용이면 역시 무료 : 값 0받기 
		*/
				
		int carnavi = Integer.parseInt(request.getParameter("carnavi"));
		
		//베이비시트 적용 여부 받기 
		/*
		 * 	보험적용 1일일시 :값 1을받기
		 * 보험 미적용이면 : 값 0받기 
		 * */
		int carbabyseat = Integer.parseInt(request.getParameter("carbabyseat"));
		/*차량 대여 가격 = 수량 * 대여기간 * 차량가격*/
		int totalreserve = carqty * carreserveday * carprice;
		/*옵션 가격 = 각종옵션에 대여기간과 수량을 곱해서 리턴*/
		int totaloption = ((carins * carreserveday)+(carwifi * carreserveday)+(carbabyseat * carreserveday))*10000*carqty;
		
		//Carorder.jsp쪽으로 선택했던 데이터들을 모두 넘겨주기 먼저 CarOption.jsp에서 넘겨받은 클래스 들을 자바빈(CarOrderBean.java)클래스에 담기 
		CarOrderBean cbean = new CarOrderBean();
		cbean.setCarno(carno);
		cbean.setCarqty(carqty);
		cbean.setCarins(carins);
		cbean.setCarreserveday(carreserveday);
		cbean.setCarnavi(carnavi);
		cbean.setCarwifi(carwifi);
		cbean.setCarbabyseat(carbabyseat);
		cbean.setCarbegindate(request.getParameter("carbegindate"));
		//CarOrder.jsp으로 데이터를 넘기기위해 request 영역에 저장
		request.setAttribute("cbean", cbean);
		request.setAttribute("totalreserve", totalreserve);
		request.setAttribute("totaloption", totaloption);
		RequestDispatcher dis = request.getRequestDispatcher("CarMain.jsp?center=CarOrder.jsp");
		dis.forward(request, response);
				
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

}
