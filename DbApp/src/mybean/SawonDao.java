package mybean;
//데이터 베이스 연결, 사원 추가, 검색,삭제,수정 DB작업 하는 메소드

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbcp.DBConnectionMgr;

public class SawonDao { //new SawonDao();
	
	private Connection con; //DB연결 및 DB정보를 담을 객체를 저장할 참조변수
	private PreparedStatement pstmt; //DB쿼리실행 객체
	private ResultSet rs; //DB쿼리 실행후 그 결과 레코드를 담을 객체
	private DBConnectionMgr pool;//DBCP커넥션풀 객체의 주소를 저장할 변수 선언
	
	//생성자를 통해 커넥션 풀객체 사용하기

	public SawonDao() {
		
		try{
			//DB연결객체(Connection)를 담고있는 DBCP풀 객체 얻기
			pool = DBConnectionMgr.getInstance();
		}catch(Exception err){
			System.out.println("DB커넥션풀 실패! :"+err);
			
		}
	}
	//사원 수정을 위한선택된 사원 한명의 정보를 modifySawon.jsp에 뿌려주기위해 dto객체를 리턴
	public SawonDto getSawon(int no){
		SawonDto dto = new SawonDto();
		String sql = "select * from tblsawon where no = ?";
		
		try{
			con = pool.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);//? 채우자
			rs = pstmt.executeQuery();
			
			if(rs.next()){//첫 rs가 제목을 가르치기 때문에 rs.next를 한번 수행해야 한다.
			dto.setAddr(rs.getString("addr"));
			dto.setAge(rs.getInt("age"));
			dto.setDept(rs.getString("dept"));
			dto.setExtension(rs.getString("extension"));
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setNo(rs.getInt("no"));
			dto.setPass(rs.getString("pass"));
			}			
		}catch(Exception e){
			System.out.println("getSawon메소드에서 오류 : "+e);
		}finally{
			pool.freeConnection(con, pstmt, rs);
		}
		return dto;
	}
	
	//DB로 부터 모든 사원 레코드 목록 가져오기(select)
	//index.jsp 사원 목록 리스트를 뿌려줄때 검색기준값과 검색어 전달
	//검색어가 없으면 모든 사원 레코드 검색 ,있으면 검색하는 해당 사원 레코드만 출력

	public ArrayList getList(String key,String text){
		//key - 근무지,ID같은 셀렉트 박스
		//text 키값을 기준으로 검색할 input text 박스
		//가입된 사원 레코드 들을담을 컬렉션 개체를 생성
		ArrayList arraylist = new ArrayList();
		
		String sql = "";
		
		try{
			//DB연결 - 커넥션 풀 안에있는 DB연결 객체 빌려오기
			con = pool.getConnection(); //DB연결
			//검색어가 입력되었는지 검색어 값이 비었는지
			if(text==null || text.isEmpty()){
				sql ="select * from tblsawon";
			}else{
				sql = "select * from tblsawon where " + key + " like '%" + text + "%'";  
			}
			
			// 미리 물음표를 제외한 SQL문을 담은 쿼리 실행객체 반환
			pstmt = con.prepareStatement(sql);
			//select쿼리 실행하여 결과값을 ResultSet객체에 담아 객체 자체를 리턴받기
			rs = pstmt.executeQuery();
			
			//DB로 부터 검색한 사원 레코드를 ResultSet 객체에 테이블 형식으로담겨져있다.
			while(rs.next()){
				//ResultSet개체에 담겨있는 하나의 레코드 정보에서 한컬럼씩 정보 꺼내와서 변수에 저장
				SawonDto dto = new SawonDto();
				//한사원레코드  정보씩 DTO객체에 저장
				//String addr = rs.getString("addr");
				//SawonDto dto = new SawonDto();
				//dto.setAddr(addr); -----> dto.setAddr(rs.getString("addr"));
				dto.setAddr(rs.getString("addr"));
				dto.setAge(rs.getInt("age"));
				dto.setDept(rs.getString("dept"));
				dto.setExtension(rs.getString("extension"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setNo(rs.getInt("no"));
				dto.setPass(rs.getString("pass"));
				//한 DTO씩 ArrayList객체에 추가
				arraylist.add(dto);
				
			}
			
		}catch(Exception e){
			System.out.println("getList 메소드에서 오류 :"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		//DB로 부터 검색한 모든 사원 레코드 들은 ArrayList에 담겨있으므로....
		//단! 한번만 arraylist를 리턴
		
		
		
		return arraylist;
	}//getlist메소드 끝


/*사원을 추가하는 메소드 setSawon*/
	public void setSawon(SawonDto dto){
		
		
		String sql = "insert into tblSawon(id, name, pass, age, addr, extension, dept) "
				+"values(?,?,?,?,?,?,?)";
		try{
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPass());
			pstmt.setInt(4, dto.getAge());
			pstmt.setString(5, dto.getAddr());
			pstmt.setString(6, dto.getExtension());
			pstmt.setString(7, dto.getDept());
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("setSawon 메소드에서 오류 :"+e);
		}finally{
			pool.freeConnection(con, pstmt);
		}

		

	}
	public void modifySawon(SawonDto dto)
	{
		String sql = "update tblsawon set id=?,name=?,pass=?,age=?,addr=?,extension=?,dept=? where no=?";
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPass());
			pstmt.setInt(4, dto.getAge());
			pstmt.setString(5, dto.getAddr());
			pstmt.setString(6, dto.getExtension());
			pstmt.setString(7, dto.getDept());
			pstmt.setInt(8, dto.getNo());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			pool.freeConnection(con, pstmt);
		}
		
	}
	
	public void deleteSawon(int no){
		String sql = "delete from tblsawon where no=?";
		
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt);
		}
	}
	
	//
	
	
}//클래스 끝
