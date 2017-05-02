package com.bean.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.istack.internal.Pool;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class BoardDao implements IBoardDao {

	// DB연결 삼총사
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	// 커넥션 풀 객체를 저장할 변수
	


	// 커넥션 풀을 얻어오는 생성자
	public BoardDao() {
		
		try
		{
			// Context 객체 생성 javax.naming.Context ,javax.naming.InitialContext
			Context init = new InitialContext(); 
			// 객체(Data)를 찾아서 리턴 받는다.
			ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");

		}catch(Exception err){
			err.printStackTrace();
		}
		
	}

	public void freeResource() {
		if (rs != null)	try {	rs.close();} catch (Exception ers) {}
		if (pstmt != null) try {pstmt.close();} catch (Exception epstmt) {}
		if (con!=null)try{con.close();}catch(Exception econ){}
		

	}

	public void insertBoard(BoardDto dto) {
		
		String sql = "insert into tblboard(name,email,homepage,subject,content,pass,ip,regdate,count,pos,depth)"
				+"values(?,?,?,?,?,?,?,now(),0,0,0)";
		
		try{
	
			con = ds.getConnection();
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getHomepage());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getPass());
			pstmt.setString(7, dto.getIp());
			pstmt.executeUpdate();
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			freeResource();
		}
		
		
	}
	//DB에있는 글들을 select해서 가져와서 전체 글리스트를 뿌려주기 위한 메소드 List.jsp페이지에서 사용하는 메소드
	@Override
	public Vector getBoardList(String keyField, String keyWord) {
		Vector<BoardDto> v = new Vector<BoardDto>();//  <Object> = <>
		String sql = "";
		
		try{
			//Datasource(커넥션풀)에서 DB연동객체 (커넥션) 가져오기
			con = ds.getConnection();
			
			if(keyField==null || keyWord.isEmpty()){
				sql ="select * from tblboard order by num desc ";
			}else{
				sql = "select * from tblboard where " + keyField 
						+ " like '%" + keyWord + "%' order by num desc"; 
			}
			//?를 제외한 select 구문을 담은 pstmt를 리턴해서 저장
			pstmt = con.prepareStatement(sql);
			//sql실행후 그 결과값을 리절트셋 객체에 테이블 형식으로 담아서 리절트셋 객체자체를 리턴해서 rs변수를 저장 
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardDto dto = new BoardDto();
				
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setSubject(rs.getString("homepage"));
				dto.setContent(rs.getString("content"));
				dto.setPass(rs.getString("name"));
				dto.setCount(rs.getInt("count"));
				dto.setIp(rs.getString("ip"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setPos(rs.getInt("pos"));
				dto.setDepth(rs.getInt("depth"));
				v.add(dto);
				
			}
	
		}catch(Exception err){
			System.out.println("getboardList 메소드에서 에러 :  " +err);
		}finally {
			freeResource();
		}
		return v;
	}

	@Override
	public void updateBoard(BoardDto dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteBoard(int no) {
		// TODO Auto-generated method stub

	}

	@Override
	public BoardDto getBoard(int num) {
		// TODO Auto-generated method stub
		BoardDto dto = new BoardDto();
		String sql = "select name,email,subject,content,pass" 
				+"from tblboard where no=?";
				
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPass(rs.getString("pass"));
				
			}
		}catch(Exception e){
			System.out.println("getBoard메소드에서 오류 : "+e);
		}finally{
			freeResource();
		}
		return dto;
	}

	@Override
	public void replyBoard(BoardDto dto) {
		// TODO Auto-generated method stub

	}

}

