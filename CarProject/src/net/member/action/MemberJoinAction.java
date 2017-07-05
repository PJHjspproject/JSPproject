package net.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import net.member.db.MemberBean;
/*외원가입 폼에서 입력한 정보들을 MemberBean(DTO)객체에 저장시킨다.
 * 저장시킨 Memberbean객체를 DB작업을 하기위한 DAO객체의 메소드에 전달하여 회원가입시킨다.
 * 성공시 로그인 페이지로 이동시키기 위해....
 * 페이지 이동방식 여부값과 이동페이지 경로값을 new ActionForward()객체에 저장하여
 *  MemberFrontController.java에게 리턴에주는 역할을 함*/
import net.member.db.MemberDAO;


public class MemberJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		request.setCharacterEncoding("UTF-8");
		//클라이언트에 요청정보를 DTO에 저장
		MemberBean mb = new MemberBean();
		mb.setId(request.getParameter("id"));
		mb.setPass(request.getParameter("pass"));
		mb.setName(request.getParameter("name"));
		mb.setEmail(request.getParameter("name"));
		mb.setDate(new Timestamp(System.currentTimeMillis()));
		mb.setAddress(request.getParameter("address"));
		mb.setPhone(request.getParameter("phone"));
		mb.setMobile(request.getParameter("mobile"));
		
		//회원가입 성공 여부 변수 선언
		
		boolean result = false;
		//DAO객체 생성
		MemberDAO dao = new MemberDAO();
		//insertMember 를 실행하여 가입성공하면 true 실패하면 false
		result = dao.insertMember(mb);
		//회원가입 실패하면 null을 리턴
		if(result==false){
			System.out.println("회원가입 실패");
			return null;
		}
		//회원가입 성공시로그인 페이지로 페이지이동방식 여부값 이동페이지 경로값을 저장하여 리턴
		ActionForward forward = new ActionForward();
		//페이지 이동방식 여부값 true로 저장
		forward.setRedirect(true);
		//경로값 설정
		forward.setPath("./MemberLogin.me");
		//리턴
		return forward; 

	}

}
