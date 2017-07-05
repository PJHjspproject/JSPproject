package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.Response;

public class MemberFrontController extends HttpServlet {

	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//가상요청주소 가져오기
		// /CarProject/Memberjoin.me
		String RequestURI = req.getRequestURI();
		System.out.println(RequestURI);
		// /CarProject 얻기
		String contextPath = req.getContextPath();
		System.out.println(contextPath);
		// /Memberjoin.me 얻기
		String command = RequestURI.substring(contextPath.length());//11
		System.out.println(command);
		
		/*주소비교*/
		//페이지 이동방식 여부값, 이동페이지 경로값 저장하여 리턴해주는 객체를 저장할 참조변수 선언
		ActionForward forward = null;
		//자식 Action객체들을 담을 인터페이스 타입의 참조변수 선언
		Action action = null;
		//Top.jsp에서 join을 눌러 회원가입페이지로 이동하라는 요청이 들어 왔을때...
		if(command.equals("/MemberJoin.me")){
			//페이지 이동방식 여부값, 이동페이지 경로값 저장하여 리턴해주는 객체 생성
			forward = new ActionForward();
			//페이지 이동방식 여부값 false 저장하여 ->RequestDispatcher forward()방식
			forward.setRedirect(false);
			//이동할 페이지(회원가입 페이지) 경로 저장
			forward.setPath("./CarMain.jsp?center=member/join.jsp");
		//join.jsp에서 회원가입 작성후 가입요청이 들어왔을때....	
		}else if(command.equals("/MemberJoinAction.me")){
			//Join.jsp 회원가입 처리를 위한 Action개체
			action = new MemberJoinAction();
			
			try{
				//join.jsp에서 입력한 회원가입 내용을 담고있는 request영역을 execute메소드에 매개변수로 전달하여 회원가입 DB작업 후
				//회원가입에 성공하면 페이지 이동여부값과 이동할 페이지 주소를 담고있는 new ActionForward()객체를 리턴받는다.
				forward =action.execute(req, resp);
				
				
			}catch(Exception e){
				System.out.println("회원가입 실패 :"+e);
				
			}
		//회원가입후 로그인 화면으로 이동하라라는 요청이 들어왔을때 또는 Top.jsp에서 로그인 링크를 눌렀을때	
		}else if(command.equals("/MemberLogin.me")){
			
			forward = new ActionForward();
			
			forward.setRedirect(false);
			
			forward.setPath("./CarMain.jsp?center=member/login.jsp");
			
			
		}
		
		//실제주소이동
		if(forward!= null){
			if(forward.isRedirect()){//true sendRedirect
				resp.sendRedirect(forward.getPath());
			}else{//false forward()
				 RequestDispatcher view = req.getRequestDispatcher(forward.getPath());
				 view.forward(req, resp);
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	

}
