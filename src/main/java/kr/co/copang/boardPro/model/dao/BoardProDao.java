package kr.co.copang.boardPro.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.copang.boardPro.model.dto.BoardProDto;
import kr.co.copang.common.DatabaseConnection;
import kr.co.copang.common.PageInfo;

public class BoardProDao {

	private Connection con;
	private DatabaseConnection dc;
	private PreparedStatement pstmt;
	
	public BoardProDao() {
		dc = new DatabaseConnection();
		con = dc.connDB();
	}
	
	public ArrayList<BoardProDto> getList(PageInfo pi, String category) {
		
		ArrayList<BoardProDto> result = new ArrayList<>();
		
		String query = "SELECT * FROM CATEGORY_BOARD cb"
				+ "		JOIN MEMBER m ON m.USER_NO = cb.USER_NO"
				+ "		ORDER BY B_INDATE DESC"
				+ "		OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pi.getOffset());
			pstmt.setInt(2, pi.getBoardLimit());
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int no = rs.getInt("B_NO");
				String title = rs.getString("B_TITLE");
				String contents = rs.getString("B_CONTENTS");
				int views = rs.getInt("B_VIEWS");
				String indate = rs.getString("B_INDATE");
				int userNo = rs.getInt("USER_NO");
				String userName = rs.getString("USER_NAME");
				
				BoardProDto boardProDto = new BoardProDto();
				boardProDto.setBoardProNo(no);
				boardProDto.setBoardProTitle(title);
				boardProDto.setBoardProContents(contents);
				boardProDto.setBoardProViews(views);
				boardProDto.setBoardProIndate(indate);
				boardProDto.setUserNo(userNo);
				boardProDto.setUserName(userName);
				
				result.add(boardProDto);
			}
			
			pstmt.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	public int getEnroll(BoardProDto boardProDto) {
		
		String query = "INSERT INTO CATEGORY_BOARD VALUES(CATEGORY_BOARD_SEQ.NEXTVAL, ?, ?, ?, DEFAULT, NULL, NULL, DEFAULT, ?)";
		
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, boardProDto.getBoardProTitle());
			pstmt.setString(2, boardProDto.getBoardProSecondTitle());
			pstmt.setString(3, boardProDto.getBoardProContents());
			pstmt.setInt(4, boardProDto.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int getTypeEnroll(BoardProDto boardProDto) {
		
		String query = "INSERT INTO BUSINESS_MENU VALUES(BUSINESS_MENU_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProDto.getBoardProNo());
			pstmt.setString(2, boardProDto.getBusinessType());
			pstmt.setInt(3, boardProDto.getBusinessFunction());
			pstmt.setInt(4, boardProDto.getBusinessRetouch());
			pstmt.setInt(5, boardProDto.getBusinessPay());
			pstmt.setInt(6, boardProDto.getBusinessDate());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	
	public BoardProDto selectNo(BoardProDto boardProDto) {
		
		String query = "SELECT B_NO FROM CATEGORY_BOARD"
				+ "		WHERE B_NO = (SELECT MAX(B_NO) FROM CATEGORY_BOARD"
				+ "					  WHERE USER_NO = ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProDto.getUserNo());
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bNo = rs.getInt("B_NO");
				boardProDto.setBoardProNo(bNo);
				return boardProDto;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public int fileUpload(BoardProDto boardProDto) {
		
		String query = "INSERT INTO UPLOAD VALUES(UPLOAD_SEQ.NEXTVAL, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, boardProDto.getFilePath());
			pstmt.setString(2, boardProDto.getFileName());
			
			int result = pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
			return result;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}
	
	public int getListCount(String category) {
		String query = "SELECT COUNT(*) AS CNT FROM CATEGORY_BOARD cb"
				+ "		JOIN MEMBER m ON cb.USER_NO = m.USER_NO";
		
		try {
			pstmt = con.prepareStatement(query);
			
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int result = rs.getInt("CNT");
				return result;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
