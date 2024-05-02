package db.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySqlConnect {

	static final String MYSQL_DRIVER="com.mysql.cj.jdbc.Driver";
	static final String MYSQL_URL="jdbc:mysql://localhost:3306/bit801?serverTimezone=Asia/Seoul";
	static final String USERNAME="root";
	static final String PASSWORD="dnehd1008@";
	
	public MySqlConnect() {
		try {
			Class.forName(MYSQL_DRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println("Mysql Driver 오류: " + e.getMessage());
		}
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD);
		}catch(SQLException e) {
			System.out.println("Mysql 연결실패: " + e.getMessage());
		}
		return conn;
	}
	
	public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		}catch(SQLException | NullPointerException e) {
			e.printStackTrace();
		}
	}
	
	public void dbClose(PreparedStatement pstmt, Connection conn) {
		try {
			pstmt.close();
			conn.close();
		}catch(SQLException | NullPointerException e) {
			e.printStackTrace();
		}
	}
	
	public void dbClose(ResultSet rs,Statement stmt, Connection conn) {
		try {
			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException | NullPointerException e) {
			e.printStackTrace();
		}
	}
	
	public void dbClose(Statement stmt, Connection conn) {
		try {
			stmt.close();
			conn.close();
		}catch(SQLException | NullPointerException e) {
			e.printStackTrace();
		}
	}
	
}
