package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ResDAO {
	Connection con;
	ResultSet rs; //db의 테이블 결과를 리턴받아 자바에 저장해주는 객체
	PreparedStatement pstmt; //DB에서 쿼리를 실행시켜주는 객체
	public void dbConnetcion() {
		try {
			//외부에서 데이터를 읽어드려야해서 Context 사용
			Context initctx = new InitialContext();
			//톰캣 서버에 정보를 담아놓은 곳으로 이동
			Context envctx = (Context) initctx.lookup("java:comp/env"); //자바 환경설정
			//데이터소스 객체 선언. Resource name 값을 찾아옴.
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool_2");
			//데이터 소스를 기준으로 커넥션을 연결
			con = ds.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}//dbConnection() end
	
	public void InsertData(ResDTO mbean){
		try {
        	//db 연결
			dbConnetcion();
            //Insert 쿼리 준비
			String sql = "INSERT INTO SCHOOL_INFO VALUES(?,?,?,?,?)";
            //쿼리를 사용할 수 있도록 설정.
			pstmt = con.prepareStatement(sql);
            // ? 에 맞게 데이터를 맵핑.
			pstmt.setString(1,mbean.getName());
			pstmt.setString(2,mbean.getTel());
			pstmt.setString(3,mbean.getLoc());
			pstmt.setString(4,mbean.getSimbol());
			pstmt.setString(5,mbean.getIntro());
			//insert, update, delete를 실행하는 메소드
			pstmt.executeUpdate();
            //자원반납
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//InsertData end
	
	public ArrayList<ResDTO> allSchoolInfo() {
  		//Arraylist 클래스를 이용해 가변 길이의 데이터를 저장.
		ArrayList<ResDTO> list = new ArrayList<>();
		dbConnetcion();
		String sql = "SELECT * FROM SCHOOL_INFO";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
 
			while(rs.next()) {  //컬럼으로 나뉘어진 데이터를 빈 클래스에 저장.
				ResDTO rdto = new ResDTO();
 
				rdto.setName(rs.getString(1));
				rdto.setTel(rs.getString(2));
				rdto.setLoc(rs.getString(3));
				rdto.setSimbol(rs.getString(4));
				rdto.setIntro(rs.getString(5));
				list.add(rdto);
			}
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//allRestaurant() end
	
	public ResDTO selectName(String Name) {
	    ResDTO rdto = null; // 초기값을 null로 설정
	    String sql = "SELECT * FROM SCHOOL_INFO WHERE NAME=?";
	    try {
	        dbConnetcion();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, Name);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            rdto = new ResDTO(); // 데이터를 찾았을 때만 객체를 생성
	            rdto.setName(rs.getString(1));
	            rdto.setTel(rs.getString(2));
	            rdto.setLoc(rs.getString(3));
	            rdto.setSimbol(rs.getString(4));
	            rdto.setIntro(rs.getString(5));
	        }
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return rdto;
	}
	
	public void updateInfo(ResDTO mbean) {
		dbConnetcion();
		try {
			String sql = "UPDATE SCHOOL_INFO SET TEL=?, LOC=?,SIMBOL=?,"
					+ "INTRO=? WHERE NAME=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mbean.getTel());
			pstmt.setString(2, mbean.getLoc());
			pstmt.setString(3, mbean.getSimbol());
			pstmt.setString(4, mbean.getIntro());
			pstmt.setString(5, mbean.getName());
			pstmt.executeUpdate();
			
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}//updateInfo end
	
	public void deleteInfo(String name) {
		dbConnetcion();
		try {
			String sql = "DELETE FROM SCHOOL_INFO WHERE NAME=?";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.executeUpdate();
			System.out.println(name);
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	} //deleteInfo end
	
}//ResDAO end
