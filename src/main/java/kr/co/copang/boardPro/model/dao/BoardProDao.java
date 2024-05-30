package kr.co.copang.boardPro.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.Part;

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
	
	
	public int getEnroll(BoardProDto boardDto) {
		
		String query = "INSERT INTO CATEGORY_BOARD VALUES(CATEGORY_BOARD_SEQ.NEXTVAL, ?, ?, DEFAULT, NULL, NULL, DEFAULT, ?, ?)";
		
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, boardDto.getBoardProTitle());
			pstmt.setString(2, boardDto.getBoardProContents());
			pstmt.setInt(3, boardDto.getUserNo());
			pstmt.setString(4, boardDto.getBoardProSecondTitle());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int getBoardNo(BoardProDto boardDto) {
		String query = "SELECT B_NO FROM CATEGORY_BOARD"
				+ "		WHERE USER_NO = ?"
				+ "		ORDER BY B_NO DESC"
				+ "		FETCH FIRST 1 ROW ONLY";
		
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardDto.getUserNo());
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int boardNo = rs.getInt("B_NO");
				
				return boardNo;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public int getTypeEnroll(ArrayList<BoardProDto> business, int businessNo) {
		
		String query1 = "INSERT INTO BUSINESS_MENU VALUES(BUSINESS_MENU_SEQ.NEXTVAL, ?, 'STANDARD', ?, ?, ?, ?)";
		String query2 = "INSERT INTO BUSINESS_MENU VALUES(BUSINESS_MENU_SEQ.NEXTVAL, ?, 'DELUXE', ?, ?, ?, ?)";
		String query3 = "INSERT INTO BUSINESS_MENU VALUES(BUSINESS_MENU_SEQ.NEXTVAL, ?, 'PREMIUM', ?, ?, ?, ?)";
		
		
		
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(query1);
			pstmt.setInt(1, businessNo);
			pstmt.setInt(2, business.get(0).getBusinessFunction());
			pstmt.setInt(3, business.get(0).getBusinessRetouch());
			pstmt.setInt(4, business.get(0).getBusinessPay());
			pstmt.setInt(5, business.get(0).getBusinessDate());

			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			pstmt = con.prepareStatement(query2);
			pstmt.setInt(1, businessNo);
			pstmt.setInt(2, business.get(1).getBusinessFunction());
			pstmt.setInt(3, business.get(1).getBusinessRetouch());
			pstmt.setInt(4, business.get(1).getBusinessPay());
			pstmt.setInt(5, business.get(1).getBusinessDate());

			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			pstmt = con.prepareStatement(query3);
			pstmt.setInt(1, businessNo);
			pstmt.setInt(2, business.get(2).getBusinessFunction());
			pstmt.setInt(3, business.get(2).getBusinessRetouch());
			pstmt.setInt(4, business.get(2).getBusinessPay());
			pstmt.setInt(5, business.get(2).getBusinessDate());
			
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
	
	public int fileUpload(BoardProDto boardDto, int businessNo) {
		
		String query = "INSERT INTO UPLOAD VALUES(UPLOAD_SEQ.NEXTVAL, ?, ?, ?)";
		
		System.out.println("5. boardDto.getFilePath : " + boardDto.getFilePath());
		System.out.println("6. boardDto.getFileName : " + boardDto.getFileName());
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, boardDto.getFilePath());
			pstmt.setString(2, boardDto.getFileName());
			pstmt.setInt(3, businessNo);
			
			int result = pstmt.executeUpdate();
			
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
	
	public void getWriter(BoardProDto boardProDto) {
		
		String query = "SELECT USER_NAME FROM MEMBER"
				+ "		WHERE USER_NO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProDto.getUserNo());
			
			ResultSet rs = pstmt.executeQuery();
			
			String userName = rs.getString("USER_NAME");
			boardProDto.setUserName(userName);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public BoardProDto getDetailN(int boardProNo) {
		
		String query = "SELECT * FROM CATEGORY_BOARD cb"
				+ "		JOIN BUSINESS_MENU bm ON cb.B_NO = bm.B_NO"
				+ "		WHERE B_NO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProNo);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bNo = rs.getInt("B_NO");
				String bTitle = rs.getString("B_TITLE");
				String bContents = rs.getString("B_CONTENT");
				String bSecondTitle = rs.getString("B_SECONDTITLE");
				String bIndate = rs.getString("");
				
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
public BoardProDto getDetailS(int boardProNo) {
	
	String standardQuery = "SELECT * FROM BUSINESS"
			+ "				WHERE B_NO = ?"
			+ "				AND BM_TYPE = STANDARD";
	
	try {
		pstmt = con.prepareStatement(standardQuery);
		pstmt.setInt(1, boardProNo);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int sNo = rs.getInt("B_NO");
			int sFuntion = rs.getInt("BM_FUNTION");
			int sRetouch = rs.getInt("BM_RETOUCH");
			int sPay = rs.getInt("BM_PAY");
			int sWorkdate = rs.getInt("BM_WORKDATE");
			
			BoardProDto sBoardProDto = new BoardProDto();
			sBoardProDto.setBoardProNo(sNo);
			sBoardProDto.setBusinessFunction(sFuntion);
			sBoardProDto.setBusinessRetouch(sRetouch);
			sBoardProDto.setBusinessPay(sPay);
			sBoardProDto.setBusinessDate(sWorkdate);
			
			return sBoardProDto;
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return null;
}	
	
public BoardProDto getDetailD(int boardProNo) {
	
	String deluxeQuery = "SELECT * FROM BUSINESS"
			+ "				WHERE B_NO = ?"
			+ "				AND BM_TYPE = DELUXE";
		
		try {
			pstmt = con.prepareStatement(deluxeQuery);
			pstmt.setInt(1, boardProNo);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int dNo = rs.getInt("B_NO");
				int dFuntion = rs.getInt("BM_FUNTION");
				int dRetouch = rs.getInt("BM_RETOUCH");
				int dPay = rs.getInt("BM_PAY");
				int dWorkdate = rs.getInt("BM_WORKDATE");
				
				BoardProDto dBoardProDto = new BoardProDto();
				dBoardProDto.setBoardProNo(dNo);
				dBoardProDto.setBusinessFunction(dFuntion);
				dBoardProDto.setBusinessRetouch(dRetouch);
				dBoardProDto.setBusinessPay(dPay);
				dBoardProDto.setBusinessDate(dWorkdate);
				
				return dBoardProDto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}	
	
public BoardProDto getDetailP(int boardProNo) {
	
	String premiumQuery = "SELECT * FROM BUSINESS"
			+ "				WHERE B_NO = ?"
			+ "				AND BM_TYPE = PREMIUM";
		
		try {
			pstmt = con.prepareStatement(premiumQuery);
			pstmt.setInt(1, boardProNo);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pNo = rs.getInt("B_NO");
				int pFuntion = rs.getInt("BM_FUNTION");
				int pRetouch = rs.getInt("BM_RETOUCH");
				int pPay = rs.getInt("BM_PAY");
				int pWorkdate = rs.getInt("BM_WORKDATE");
				
				BoardProDto pBoardProDto = new BoardProDto();
				pBoardProDto.setBoardProNo(pNo);
				pBoardProDto.setBusinessFunction(pFuntion);
				pBoardProDto.setBusinessRetouch(pRetouch);
				pBoardProDto.setBusinessPay(pPay);
				pBoardProDto.setBusinessDate(pWorkdate);
				
				return pBoardProDto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void getFileName(BoardProDto boardDto) {
		
		String query = "SELECT * FROM UPLOAD"
				+ "		WHERE B_NO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	
}
