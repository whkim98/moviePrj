package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.SitDto;
import db.common.MySqlConnect;

public class SitDao {
	
	MySqlConnect db = new MySqlConnect();
	
	public List<SitDto> allSit(){
		List<SitDto> list = new Vector<>();
		String sql = """
				select * from mov_sit
				""";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SitDto dto = new SitDto();
				dto.setSit_no(rs.getInt("sit_no"));
				dto.setSit_name(rs.getString("sit_name"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public int getSitNo(String seatName) {
		SitDto dto = new SitDto();
		String sql = """
				select sit_no from mov_sit where sit_name = ?
				""";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seatName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setSit_no(rs.getInt("sit_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto.getSit_no();
	}
	
	

}
