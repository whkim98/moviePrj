package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import data.dto.InfoDto;
import data.dto.LocationDto;
import data.dto.ResDto;
import data.dto.SitDto;
import data.dto.TimeDto;
import data.dto.UserDto;
import db.common.MySqlConnect;

public class ResDao {

	MySqlConnect db = new MySqlConnect();

	public void insertRes(int location_no, int time_no, int info_no, int sit_no, HttpServletRequest request) {
		String sql = """
				insert into mov_res(user_no, time_no, sit_no,
				info_no, location_no) values(?,?,?,?,?)
				""";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		int user_no = (int) request.getSession().getAttribute("user_no");
		System.out.println(user_no);
		System.out.println(sit_no);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_no);
			pstmt.setInt(2, time_no);
			pstmt.setInt(3, sit_no);
			pstmt.setInt(4, info_no);
			pstmt.setInt(5, location_no);

			pstmt.execute();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}

	public ResDto confirmRes(HttpServletRequest request) {
		ResDto dto = new ResDto();
		String sql = """
				select mu.user_name, mt.time_time, ms.sit_name, 
				mi.info_title, mi.info_img, 
				CONCAT(ml.location_city, ' ', ml.location_detail) 
				AS city_detail from mov_res mr left join mov_user mu on mr.user_no = mu.user_no 
				left join mov_time mt on mr.time_no = mt.time_no left join mov_sit ms on mr.sit_no = ms.sit_no 
				left join mov_info mi on mr.info_no = mi.info_no left join mov_location ml on mr.location_no = ml.location_no
				ORDER BY res_no DESC LIMIT 1
				""";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setUser_name(rs.getString("mu.user_name"));
				dto.setTime_time(rs.getTimestamp("mt.time_time"));
				dto.setSit_name(rs.getString("ms.sit_name"));
				dto.setInfo_title(rs.getString("mi.info_title"));
				dto.setInfo_img(rs.getString("mi.info_img"));
				dto.setLocation_detail(rs.getString("city_detail"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}

}
