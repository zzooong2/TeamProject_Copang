package kr.co.copang.request.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.copang.common.DatabaseConnection;
import kr.co.copang.request.model.dto.RequestDTO;

public class RequestDAO {

	// DB연결
	private DatabaseConnection dc;
	private Connection con;
	private PreparedStatement ps;
	
	public RequestDAO() {
		dc = new DatabaseConnection();
		con = dc.connDB();
	}
	
	// 의뢰 등록
	public int enroll(RequestDTO rDTO) {
		String query = "INSERT INTO REQUEST_BOARD(R_NO, R_TITLE, R_CONTENTS, R_INDATE, R_STATUS, USER_NO)"
					 + " VALUES(REQUEST_BOARD_SEQ.nextval, ?, ?, default, default, ?)";
		
		try {
			ps = con.prepareStatement(query);
			
			ps.setString(1, rDTO.getRequestTitle());
			ps.setString(2, rDTO.getRequestContents());
			ps.setInt(3, rDTO.getUserNo());
			
			int result = ps.executeUpdate();
			
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 의뢰 수정
	public RequestDTO getRequest(int requestNo) {
		String query = "SELECT R_NO, R_TITLE, R_CONTENTS, USER_NAME"
					 + " FROM REQUEST_BOARD rb"
					 + " JOIN MEMBER m ON m.USER_NO = rb.USER_NO"
					 + " WHERE R_NO = ?";
		
		try {
			ps = con.prepareStatement(query);
			
			ps.setInt(1, requestNo);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
			int requestBoardNo = rs.getInt("R_NO");
			String requestTitle = rs.getString("R_TITLE");
			String requestContents = rs.getString("R_CONTENTS");
			String userName = rs.getString("USER_NAME");
				
			RequestDTO rDTO = new RequestDTO();
			rDTO.setRequestNo(requestBoardNo);
			rDTO.setRequestTitle(requestTitle);
			rDTO.setRequestContents(requestContents);
			rDTO.setUserName(userName);
			
			return rDTO;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	// 의뢰글 번호 가져오기
	public RequestDTO getRequestNo(int userNo) {
		String query = "SELECT R_NO, R_TITLE, R_CONTENTS, USER_NO, USER_NAME"
					 + " FROM (SELECT R_NO, R_TITLE, R_CONTENTS, R_INDATE, m.USER_NO, m.USER_NAME"
					 	   + " FROM REQUEST_BOARD rb JOIN MEMBER m ON rb.USER_NO = m.USER_NO"
					 	   + " ORDER BY R_INDATE DESC)"
			 	     + " WHERE ROWNUM = 1"
			 	     + " AND USER_NO = ?";
		
		try {
			ps = con.prepareStatement(query);
			
			ps.setInt(1, userNo);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int requestBoardNo = rs.getInt("R_NO");
				String requestTitle = rs.getString("R_TITLE");
				String requestContents = rs.getString("R_CONTENTS");
				int writeUserNo = rs.getInt("USER_NO");
				String writeUserName = rs.getString("USER_NAME");
				
				RequestDTO rDTO = new RequestDTO();
				rDTO.setRequestNo(requestBoardNo);
				rDTO.setRequestTitle(requestTitle);
				rDTO.setRequestContents(requestContents);
				rDTO.setUserNo(writeUserNo);
				rDTO.setUserName(writeUserName);
				
				return rDTO;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 의뢰 수정 폼
	public int editEnroll(RequestDTO rDTO) {
		String query = "UPDATE REQUEST_BOARD SET"
					 + " R_TITLE = ?,"
					 + " R_CONTENTS = ?"
					 + " WHERE R_NO = ?";
		try {
			ps = con.prepareStatement(query);
			
			ps.setString(1, rDTO.getRequestTitle());
			ps.setString(2, rDTO.getRequestContents());
			ps.setInt(3, rDTO.getRequestNo());
			
			int result = ps.executeUpdate();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
