package kr.co.copang.request.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	
	
	public int enroll(RequestDTO rDTO) {
		String query = "INSERT INTO REQUEST_BOARD(R_NO, R_TITLE, R_CONTENTS, R_INDATE, R_STATUS, USER_NO)"
					 + " VALUES(REQUEST_BOARD_SEQ.nextval, ?, ?, default, default, 2)";
		
		try {
			ps = con.prepareStatement(query);
			
			ps.setString(1, rDTO.getRequestTitle());
			ps.setString(2, rDTO.getRequestContents());
			
			int result = ps.executeUpdate();
			
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
