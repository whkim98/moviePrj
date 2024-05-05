package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.BoardDto;
import db.common.MySqlConnect;

public class BoardDao {
	
MySqlConnect db = new MySqlConnect();
	
	public List<BoardDto> allList() {
		List<BoardDto> list = new Vector<>();
		String sql = """
				select mb.board_no, mb.board_title, 
				mb.board_content, mb.board_hit, mu.user_id, 
				mi.info_title from mov_board mb 
				left join mov_user mu on mb.user_no = mu.user_no 
				left join mov_info mi on mb.info_no = mi.info_no 
				order by board_no
				""";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDto dto = new BoardDto();
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setInfo_title(rs.getString("info_title"));
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
