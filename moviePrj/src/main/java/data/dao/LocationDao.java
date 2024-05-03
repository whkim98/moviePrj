package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.LocationDto;
import db.common.MySqlConnect;

public class LocationDao {

	MySqlConnect db = new MySqlConnect();

	public List<LocationDto> allLocation(){
		List<LocationDto> list = new Vector<>();
		String sql = """
				SELECT CONCAT(ml.location_city, ' ', ml.location_detail) 
				AS city_detail
				, location_no
				FROM mov_location ml
				""";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LocationDto dto = new LocationDto();
				dto.setLocation_detail(rs.getString("city_detail"));
				dto.setLocation_no(rs.getInt("location_no"));
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
