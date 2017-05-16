package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//데이터베이스와 연결하여 데이터베이스 작업 하는 클래스
public class MemberDAO {
	
	// DB연결 삼총사 
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	

	//자원 해체 메소드
	
	public void freeResource() {
		if (rs != null)try {	rs.close();	} catch (Exception ers) {	System.out.println("rs 객체 close 오류"+ers);	}
		if (pstmt != null)try {pstmt.close();} catch (Exception epstmt) {System.out.println("pstmt 객체 close 오류"+epstmt);}
		if (con != null)try {con.close();} catch (Exception econ) { System.out.println("con 객체 close 오류"+econ);}
	}


	// 디비 연결 메서드
	private Connection getConnection() throws Exception {
		// 삼총사
		//Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();

		return con;
	}

	/* insertMenber()메소드 추가하기 */
	// MenberDto객체를 매개변수 인자로 전달받아 insert

	public void insertMember(MemberDto mdto) {

		String sql = "";

		try {
			con = getConnection();
			sql = "insert into  member(id,passwd,name,reg_date,age,gender,email,address,tel,mtel) values(?,?,?,?,?,?,?,?,?,?)";
			// ?를 제외한 insert 구문을 담은 insert구문을 실행할 pstmt 리턴
			pstmt = con.prepareStatement(sql);
			// ???값을 pstmt에 셋팅
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPasswd());
			pstmt.setString(3, mdto.getName());
			pstmt.setTimestamp(4, mdto.getReg_date());
			pstmt.setInt(5, mdto.getAge());
			pstmt.setString(6, mdto.getGender());
			pstmt.setString(7, mdto.getEmail());
			pstmt.setString(8, mdto.getAddress());
			pstmt.setString(9, mdto.getTel());
			pstmt.setString(10, mdto.getMtel());

			pstmt.executeUpdate();
			
			// insert 쿼리 실행
		} catch (Exception e) {
			System.out.println("insertMember 메서드에서 오류 :" + e);
			e.printStackTrace();
		} finally {
			freeResource();
		}
	}
}

