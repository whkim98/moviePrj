package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

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
		request.getSession().setAttribute("user_no", dto.getUser_no());
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

}
