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

public class TestServlet2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req, resp);
	}
	//클라이언트로 부터 서블릿(TestServlet2.java)으로 요청 받으면 오출되는 메소드
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String[] favorFood ={"짜장면","삼겹살","순대국","돈가스,콩국수"};
		//request영역에 favorFood배열 담기
		req.setAttribute("food", favorFood);
		
		//컬렉션 종류 Vector,ArrayList, HashMap, HashSet 
		//문자열 객체를 담기 위한 가변길이 객체 배열생성
		ArrayList favorMove = new ArrayList();
		//좋아하는 영화 제목을 ArrayList 객체에 담기
		favorMove.add("영웅본색");
		favorMove.add("배트맨");
		favorMove.add("슈퍼맨");
		favorMove.add("아이언맨");
		favorMove.add("바람과함께 사라지다");
		favorMove.add("변호인");
		//컬렉션객체에 request 영역에 담아서 array_collection.jsp로 전송
		req.setAttribute("movie", favorMove);
		//HashMap (키에 대응한 값을 묶어서 쌍으로 저장)
		/*좋아하는 도시이름을 HashMap에 담기*/
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("tiger", "서울시 강남구");//put(키,값)
		map.put("lion", "경기도 의정부시");
		map.put("sin", "인천시 만안구");
		map.put("kim","서울시 강남구");
		
		req.setAttribute("address", map);
		
		//요청에 대한 업무를 수행하는 페이지 경로를 RequestDispactchar 객체에 저장하여
		//저장한 RequestiEispacter
		RequestDispatcher view =  req.getRequestDispatcher("array_Collection.jsp");
		
		view.forward(req,res);
		
	
	}
	
	

}
