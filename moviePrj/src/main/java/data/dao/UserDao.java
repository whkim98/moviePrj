package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import data.dto.UserDto;
import db.common.MySqlConnect;

public class UserDao {
	
	MySqlConnect db = new MySqlConnect();
	
	public boolean loginCheck(String user_id, String user_password, HttpServletRequest request) {
	    UserDto dto = new UserDto();
	    Connection conn = db.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    boolean check = true;
	    System.out.println(user_id);
	    System.out.println(user_password);
	    String sql = "select user_no from mov_user where user_id=? and user_password=?";
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, user_id);
	        pstmt.setString(2, user_password);
	        rs = pstmt.executeQuery();
	        if(rs.next()) {
	            dto.setUser_no(rs.getInt("user_no"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }finally {
	        db.dbClose(rs, pstmt, conn);
	    }
	    
	    if(dto.getUser_no() == 0) {
	        check = false;
	    }
	    HttpSession session = request.getSession();
	    // 세션의 유효 시간을 30분으로 설정
	    session.setMaxInactiveInterval(30 * 60); // 30분 * 60초
	    session.setAttribute("user_no", dto.getUser_no());
	    return check;
	}
	
	public void insertUser(UserDto dto) {
		String sql = """
				insert into mov_user(user_id, user_password, user_name, user_addr1, user_addr2, 
				user_residentno, user_phone, user_postal) values
				(?,?,?,?,?,?,?,?)
				""";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_password());
			pstmt.setString(3, dto.getUser_name());
			pstmt.setString(4, dto.getUser_addr1());
			pstmt.setString(5, dto.getUser_addr2());
			pstmt.setString(6, dto.getUser_residentno());
			pstmt.setString(7, dto.getUser_phone());
			pstmt.setString(8, dto.getUser_postal());
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public UserDto myInfo(int user_no) {
		UserDto dto = new UserDto();
		String sql = "select * from mov_user where user_no=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(user_no);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setUser_no(rs.getInt("user_no"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_password(rs.getString("user_password"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_addr1(rs.getString("user_addr1"));
				dto.setUser_addr2(rs.getString("user_addr2"));
				dto.setUser_residentno(rs.getString("user_residentno"));
				dto.setUser_phone(rs.getString("user_phone"));
				dto.setUser_postal(rs.getString("user_postal"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public boolean checkPassword(int user_no, String user_password) {
		boolean check = true;
		UserDto dto = new UserDto();
	    Connection conn = db.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = """
	    		select case when exists (select 1 from mov_user where user_no = ?
	    		and user_password = ?) then 1 else 2 end as result
	    		""";
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, user_no);
	        pstmt.setString(2, user_password);
	        rs = pstmt.executeQuery();
	        if(rs.next()) {
	            dto.setUser_id(rs.getString("result"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }finally {
	        db.dbClose(rs, pstmt, conn);
	    }
	    System.out.println("dtotototo"+dto.getUser_id());
	    if(dto.getUser_id().equals("2")) {
	        check = false;
	    }
		return check;
	}
	
	public void updateInfo(int user_no, String user_name, String user_password, String user_phone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = """
				update mov_user set 
				user_name = ?, user_password = ?, user_phone = ? 
				where user_no = ?
				""";
		conn = db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_name);
			pstmt.setString(2, user_password);
			pstmt.setString(3, user_phone);
			pstmt.setInt(4, user_no);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}

}
