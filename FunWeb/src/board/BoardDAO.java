package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

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
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();

		return con;
	}
	//게시판 주글 추가 메소드 답변글 아님;;
	public int insertBoard(BoardDto dto){
		 
		String sql="";
		//추가할 글번호 저장변수
		int num = 0;
		int result=0;
		try{
			 // 1. 커넥션 풀에서 DB연결 객체 얻기 
			con = getConnection();
			// 2. 추가할 글번호 구하기
			
			// 3. 가장큰 글번호 검색하기select..
			sql = "select max(num) from board";
			//4.?를 제외한 SQL구문을 담은 pstmt리턴		
			pstmt = con.prepareStatement(sql);		
			//5. pstmt로 select 쿼리 실행후 그 결과를 레코드를 rs에 저장
			rs = pstmt.executeQuery();		
			//만약 글이있다면 가장큰 글번호 +1 하기 없다면 글번호 1로 지정 
			if(rs.next()){
				num = rs.getInt(1)+1;
			}else{
				num=1;
			}
			sql = "insert into board"
					+ "(num,name,passwd,subject,content,file,"
					+ "re_ref,re_lev,re_seq,readcount,date,ip)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getFile());
			pstmt.setInt(7, num);//num 주글번호 ==re_ref
			pstmt.setInt(8, 0);//들여쓰기 레벨값 주글은 들여쓰기레벨값이 없으므로 0으로 초기화
			pstmt.setInt(9, 0);//답글 순서 이 쿼리는 주글 작성이므로 0으로 초기화
			pstmt.setInt(10, 0);//글을쓰긴했지만 읽지는 않았으므로 0으로 초기화
			pstmt.setTimestamp(11, dto.getDate());//dto객체에 이미 현재시간이 저장되어있다.
			pstmt.setString(12, dto.getIp());//dto객체에 IP가 저장되어있다.
			
			result = pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("insertBoard 메소드 에러!!! ");
			e.printStackTrace();
		}finally{
			freeResource();
		}
		return result;
	}
	
	public int getBoardCount(){
		
		int count=0;
		String sql="";
		
		try{
			con =getConnection();
			sql="select count(*) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}else{
				count=0;
			}
			
		}catch(Exception e){
			System.out.println("getCountBoard 메소드 에러!!!");
			e.printStackTrace();
		}finally{
			freeResource();
		}
		
		
		return count;
	}
	
	public ArrayList getBoardList(){
		ArrayList<BoardDto> arr = new ArrayList<BoardDto>();
		
		String sql="";
		
		
		try{
			con = getConnection();
			sql = "select * from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardDto dto = new BoardDto();
				
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setName(rs.getString("name"));
				dto.setDate(rs.getTimestamp("date"));
				dto.setReadcount(rs.getInt("readcount"));
				
				arr.add(dto);
			}
			
			
		}catch(Exception e){
			System.out.println("getBoardList 메소드 에러!!!");
			e.printStackTrace();
		}finally{
			freeResource();
		}
		
		
		return arr;
	}

}
