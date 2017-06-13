package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CarDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon(){
		try{
			//1. WAS서버와 연결된 웹 프로젝트의 모든 정보를 가지고 있는 컨텍스트 객체 생성
			Context init = new InitialContext();
			//2. 연결된 WAS 서버에서 커넥션풀 거져오기
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
			//3. 커넥션 풀에서 미리 연결된 DB연결 객체 가져 오기
			con = ds.getConnection();
			
			
		}catch(Exception e){
			System.out.println("DB연결 오류 :" + e);
		}//catch end
	}//getCon() end
	/*3총사 자원 해제 메소드*/	
	public void freeResource() {
		if (rs != null)try {	rs.close();	} catch (Exception ers) {	System.out.println("rs 객체 close 오류"+ers);	}
		if (pstmt != null)try {pstmt.close();} catch (Exception epstmt) {System.out.println("pstmt 객체 close 오류"+epstmt);}
		if (con != null)try {con.close();} catch (Exception econ) { System.out.println("con 객체 close 오류"+econ);}
	}//freeResource() end
	
	/*전체 차량 검색 메소드*/
	public Vector<CarListBean> getAllCarlist() {
		String sql="";
		//select한 결과물을 CarListean 객체에 담아서 CarListBean객체들을 다시 Vector에 담아 
		//리턴할 Vector 객체 생성
		Vector<CarListBean> v = new Vector<CarListBean>();
		//검색한 모든 차량정보 중에서 차량 하나의 정보를 저장할 객체에 대한 변수 선언
		CarListBean bean = null;
		try{
			//DB연결객체 저장
			getCon();
			sql = "select * from carlist";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean = new CarListBean();
				bean.setCarno(rs.getInt(1));//차번호담기 carno 의 데이터형은 int이므로 getInt메서드 이용
				bean.setCarname(rs.getString(2));//차이름 담기
				bean.setCarcompany(rs.getString(3));//차 제조사명 담기
				bean.setCarprice(rs.getInt(4));//차 가격담기
				bean.setCarusepeople(rs.getInt(5));//차 인승 담기
				bean.setCarinfo(rs.getString(6));//차 정보담기
				bean.setCarimg(rs.getString(7));//차 이미지 파일명 담기
				bean.setCarcategory(rs.getString(8));// 차 종류담기
				
				v.add(bean);//백터에 담기
			}//try end
		}catch(Exception e){
			System.out.println("getAllCarlist() 메소드 오류 : "+e);
		}finally{
			freeResource();
		}//finally end
		
		return v;
	}//getAllCarlist() 메소드 end
	
}//class end
