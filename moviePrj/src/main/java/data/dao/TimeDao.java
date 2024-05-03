package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Vector;

import data.dto.TimeDto;
import db.common.MySqlConnect;

public class TimeDao {
	
	MySqlConnect db = new MySqlConnect();
	
	public List<TimeDto> allTime(int info_no){
		List<TimeDto> list = new Vector<>();
		String sql = """
				select time_time, time_no from mov_time where info_no = ?
				""";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, info_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TimeDto dto = new TimeDto();
				dto.setTime_time(rs.getTimestamp("time_time"));
				dto.setTime_no(rs.getInt("time_no"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public Timestamp timeDetail(int time_no) {
		TimeDto dto = new TimeDto();
		String sql = """
				select time_time, time_no from mov_time where time_no = ?
				""";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, time_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setTime_no(rs.getInt("time_no"));
				dto.setTime_time(rs.getTimestamp("time_time"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto.getTime_time();
	}

}
