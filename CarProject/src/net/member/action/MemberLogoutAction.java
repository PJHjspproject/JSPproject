package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//세션값 초기화
		HttpSession session = request.getSession();
		session.invalidate();
		
		
		//페이지 이동 방식 여부값, 이동경로를 저장하고 있는 ActionForward()객체 생성
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./Main.me");
		return forward; 
		
		
		
		
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		out.println("<script>");
//		out.println("alert('로그아웃');");
//		out.println("location.href='./Main.me';");
//		out.println("</script>");
//		out.close();
//	
//		return null;
		
		
		
	}

}







