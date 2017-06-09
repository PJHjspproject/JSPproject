package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.org.apache.regexp.internal.recompile;

//데이터베이스와 연결하여 데이터베이스 작업 하는 클래스
public class MemberDAO {
	
	// DB연결 삼총사 
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	

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
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/wherebike");
		con = ds.getConnection();

		return con;
	}
	
	/* insertMenber()메소드 추가하기 */
	// MenberDto객체를 매개변수 인자로 전달받아 insert

	public int insertMember(MemberDto mdto) {
		int check=0;
		String sql = "";

		try {
			con = getConnection();
			sql = "insert into member(id,name,password,gender,age,email,phonenum,reg) values(?,?,?,?,?,?,?,?)";
			// ?를 제외한 insert 구문을 담은 insert구문을 실행할 pstmt 리턴

			pstmt = con.prepareStatement(sql);
			// ???값을 pstmt에 셋팅
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getName());
			pstmt.setString(3,mdto.getPassword());
			pstmt.setString(4,mdto.getGender());
			pstmt.setInt(5, mdto.getAge());
			pstmt.setString(6, mdto.getMail1()+"@"+mdto.getMail2());
			pstmt.setString(7, mdto.getPhonenum());
			pstmt.setTimestamp(8, mdto.getReg());
			check = pstmt.executeUpdate();
			
			// insert 쿼리 실행
		} catch (Exception e) {
			System.out.println("insertMember 메서드에서 오류 :" + e);
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return check;
	}//insertMember method end
	
	//회원가입을 위해 사용자가 입력한  id값을 매개변수 인자로 전달받아 DB에 사용자가 입력한 id값이 존재하는지 체크하여
	//아이디가 중복이라면 check에다 1을 저장 하여 리턴 중복이 아니라면 0을 리턴하여 출력;
	public int idCheck(String id){
		int check=0;//중복이 아닐때는 그대로 0을 출력하게 0으로 초기화
		String sql="";
		
		try{
			con = getConnection();
			sql = "select id from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				check = 1;
			}
			
		}catch(Exception e){
			System.out.println("idCheck 메소드 에러");
			e.printStackTrace();
		}finally{
			freeResource();
		}
		
		return check;
	}//idCheck method end

	public int userCheck(String id, String passwd) {
		String sql = "";
		// check =0 아이디는 일치하나 비밀번호 틀림
		// check =1 아이디 비밀번호 모두일치
		// check =-1 아이디가 틀릴시
		int check = 0;

		try {
			con = getConnection();
			sql = "select id,password from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {// 아이디가 존재한다!!!
				String mem_pw = rs.getString("password");
				// 로그인시 입력한 패스워드값과 DB에 저장되어있는 패스워드 값이 같으면?
				if (mem_pw.equals(passwd)) {
					check = 1;
				} else {// 비밀번호가 틀릴때
					check = 0;
				}
			} else {// 아이디가없을때 !!! 비밀번호 틀릴때와는 다르다
				check = -1;
			}

		} catch (Exception e) {
			System.out.println("userCheck 메서드 오류");
			e.printStackTrace();

		} finally {
			freeResource();
		}

		return check;
	}

}

