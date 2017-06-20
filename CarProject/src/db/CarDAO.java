package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.swing.plaf.basic.BasicScrollPaneUI.ViewportChangeHandler;

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
	
	
	public Vector<CarListBean> getCategoryCarList(String carcategory) {
		
		Vector<CarListBean> v = new Vector<CarListBean>();
		CarListBean bean = null;
		
		try{
			getCon();
			String sql = "select * from carlist where carcategory=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, carcategory);
			
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
				
				v.add(bean);
			}
			
		}catch(Exception e){
			System.out.println("getCarCategorylist() 메소드 오류 : "+e);
		}finally{
			freeResource();
		}
		return v;
	}//getCategoryCarList() 메소드 end
	
	
	public CarListBean getOneCar(int carno) {
				
		CarListBean bean = null;
		
		try {
			//DB연결
			getCon();
			//SELECT준비 : getOneCar메소드의 매개변수로 전달받은 carno에 해당하는 차량 검색
			String sql = "select * from carlist where carno=?";
			//?를 제외한 SELECT구문을 저장한 PreparedStatement객체(SELECT실행 객체) 리턴 
			pstmt = con.prepareStatement(sql);
			//pstmt에 ?(carno)값 셋팅
			pstmt.setInt(1, carno);
			//SELECT검색후 그결과 값을 ResultSet객체에 저장하여 ResultSet객체 자체를 리턴 받아 rs에 저장
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				//rs에서 꺼내온  값을 저장하기 위한 용도의 DTO객체 생성
				bean = new CarListBean();
				//rs에서 꺼내온값을 DTO에 저장
				bean.setCarno(rs.getInt(1));//차번호 저장 
				bean.setCarname(rs.getString(2));//차이름 담기
				bean.setCarcompany(rs.getString(3));//차제조사 담기
				bean.setCarprice(rs.getInt(4));//차가격 담기
				bean.setCarusepeople(rs.getInt(5));//차인승 담기
				bean.setCarinfo(rs.getString(6));//차정보 담기
				bean.setCarimg(rs.getString(7));//차이미지명 담기
				bean.setCarcategory(rs.getString(8));//차종류(소형,중형,대형)중 하나 담기 
			}
			
		}catch(Exception e){
			System.out.println("getCarCategorylist() 메소드 오류 : "+e);
		}finally{
			freeResource();
		}
		
		return bean;
	}//getOneCar end
	
	//렌트 주문현황을 DB에 저장하는 메소드
	public void insertCarOrder(CarOrderBean cbean) {
		
		CarListBean bean = null;
		
		try{
			getCon();
			String sql="insert into carorder(carno,carqty,carreserveday,carbegindate,carins,carwifi,carnavi,carbabyseat,"
					+"memberphone,memberpass) values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			/*pstmt.set.. DB저장하기*/
			pstmt.setInt(1, cbean.getCarno());
			pstmt.setInt(2, cbean.getCarqty());
			pstmt.setInt(3, cbean.getCarreserveday());
			pstmt.setString(4, cbean.getCarbegindate());
			pstmt.setInt(5, cbean.getCarins());
			pstmt.setInt(6, cbean.getCarwifi());
			pstmt.setInt(7, cbean.getCarnavi());
			pstmt.setInt(8, cbean.getCarbabyseat());
			pstmt.setString(9, cbean.getMemberphone());
			pstmt.setString(10, cbean.getMemberpass());
			pstmt.executeUpdate();
					
			
		}catch(Exception e){
			System.out.println("insertCarOrder() 메소드 오류 : "+e);
		}finally{
			freeResource();
		}
		
	}//end insertCarOrder() 메소드 end
	
	/*예약화인페이지에서 렌트카 에약시 작성한 전화번호와 패스워드에 해당하는 예약한 주문정보를 모두 검색해 가져오는 메소드 (조건에맞아야함)*/
	
	public Vector<CarConfirmBean> getAllCarOrder(String memberphone, String memberpass) {
		
		Vector<CarConfirmBean> v = new Vector<CarConfirmBean>();
		CarConfirmBean bean = null;
		String sql="";
		try{
			getCon();
			//텐트 예약한 날짜가 현재날짜보다 크고 렌트 예약시 작성한 비회원 전화번호와 패스워드에 해당하는 렌트 예약정보를 검색
			//carorder테이블과 carlist 테이블을 natural조인하여 검색(select * from carorder natural join carlist)
			//select * 와같이 별도의 컬럼 순서를 지정하지않으면 natural조인의 기준이 되는 컬럼들이 다른컬럼보다 먼저 출력된다.
			//이때 natural Join은 join에 사용된  같은 이름을 컬럼을 중복출력하지않고 하나로 처리된다.
			sql="select * from carorder natural join carlist where "
			+"now() <  str_to_date(carbegindate , '%Y-%m-%d') and memberphone=? and memberpass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberphone);
			pstmt.setString(2, memberpass);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean = new CarConfirmBean();
				bean.setOrderid(rs.getInt(2));
				bean.setCarqty(rs.getInt(3));
				bean.setCarreserveday(rs.getInt(4));
				bean.setCarbegindate(rs.getString(5));
				bean.setCarins(rs.getInt(6));
				bean.setCarwifi(rs.getInt(7));
				bean.setCarnavi(rs.getInt(8));
				bean.setCarbabyseat(rs.getInt(9));
				bean.setCarname(rs.getString(12));
				bean.setCarprice(rs.getInt(14));
				bean.setCarimg(rs.getString(17));
				
				v.add(bean);
			}
			
			
		}catch(Exception e){
			System.out.println(" getAllCarOrder() 메소드 오류 : "+e);
		}finally{
			freeResource();
		}
			
		return v;
	}//end getAllCarOrder() 메소드 end
	
}//class end
