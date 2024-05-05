package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
	
	public void boardInsert(int user_no, int info_no, String board_content, String board_title) {
		String sql = """
				insert into mov_board(board_title, board_content, 
				user_no, info_no) values(?,?,?,?)
				""";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board_title);
			pstmt.setString(2, board_content);
			pstmt.setInt(3, user_no);
			pstmt.setInt(4, info_no);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void updateHit(int board_no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = """
				update mov_board set board_hit = board_hit + 1 where board_no = ?
				""";
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public int getTotalCount() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int totalCount = 0;
        try {
            conn = db.getConnection();
            String sql = "SELECT COUNT(*) AS total_count FROM mov_board";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                totalCount = rs.getInt("total_count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs, pstmt, conn);
        }
        return totalCount;
    }

    public List<BoardDto> getListByPage(int currentPage, int pageSize) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardDto> list = new ArrayList<>();
        try {
            conn = db.getConnection();
            String sql = "SELECT * FROM mov_board mb left join mov_user mu on mb.user_no = mu.user_no left join mov_info mi on mb.info_no = mi.info_no ORDER BY board_no asc LIMIT ?, ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, (currentPage - 1) * pageSize);
            pstmt.setInt(2, pageSize);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                BoardDto board = new BoardDto();
                board.setBoard_no(rs.getInt("board_no"));
                board.setBoard_title(rs.getString("board_title"));
                board.setUser_id(rs.getString("user_id"));
                board.setInfo_title(rs.getString("info_title"));
                board.setBoard_hit(rs.getInt("board_hit"));
                board.setBoard_content(rs.getString("board_content"));
                list.add(board);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs, pstmt, conn);
        }
        return list;
    }

}
