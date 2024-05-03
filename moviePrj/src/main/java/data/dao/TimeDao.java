package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

}
