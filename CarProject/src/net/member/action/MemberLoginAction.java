package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

/*
 login.jsp에서 사용자가 입력한 id와 pass를  MemberDAO클래스에 userCheck메소드로 전달하여..
 사용자가 입력한 id와 pass값과,  DB에 있는 id,pass값을 비교하여 로그인 처리하기.
 */

public class MemberLoginAction implements Action{

	//alt + shift + s + v
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//login.jsp에서 사용자가 입력한 id와 pass 파라미터 가져오기
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		//DB작업을 위한 객체 생성
		MemberDAO mdao = new MemberDAO();
		
		//login.jsp에서 사용자가 입력한 id와 pass를 userCheck메소드로 전달하여..
		//사용자가 입력한 id,pass 와  DB에 있는  id,pass값을 비교하여 로그인 처리하기
		//check = 1 -> 아이디, 비밀번호 맞음
		//check = 0 -> 아이디맞음, 비밀번호 틀림
		//check = -1 -> 아이디 틀림
		int check = mdao.userCheck(id, pass);
		
		//check == 0  "비밀번호틀림" 뒤로 이동(login.jsp)
		if(check == 0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		
		//check == -1 "아이디 틀림"  뒤로 이동(login.jsp)
		}else if(check == -1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;			
			
		}
		
		//check == 1
		//DB에 있는 아이디,비밀번호와..
		//login.jsp에서 입력한 아이디, 비밀번호가 일치할떄..
		
		//세션 객체 얻기
		HttpSession session = request.getSession();
		
		//login.jsp화면에서 입력한 아이디를 세션객체영역에 저장
		session.setAttribute("id", id);
		
		/*로그인 성공시..CarMain.jsp페이지로 이동 시킨다.*/
		//페이지 이동방식 여부값, 이동페이지 경로 값 저장하여 리턴 해주는 객체 생성
		ActionForward forward = new ActionForward();
		
		//페이지 이동여부값 true로저장
		//true   Response.sendRedirect()  <- 이방식은 이동할 페이지 주소 경로 노출함.
		forward.setRedirect(true);
		
		forward.setPath("./Main.me");// CarMain.jsp로 이동
		
		//페이지 이동 방식 여부값 true와 
		//이동할 페이지 주소를 담고 있는  new ActionForward()객체를  MemberFrontController로 리턴
		return forward;
	}

	
	
	
	
	
}
