package kr.co.copang.customerService.customerService.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.copang.common.DatabaseConnection;
import kr.co.copang.customerService.customerService.model.dto.CustomerServiceDTO;

public class CustomerServiceDAO {
	
	// DB 연결
	private DatabaseConnection dc;
	private Connection con;
	private PreparedStatement ps;
	
	public CustomerServiceDAO() {
		dc = new DatabaseConnection();
		con = dc.connDB();
	}
	
	// 게시글 작성
	public int enroll(CustomerServiceDTO csDTO) {
		String query = "INSERT INTO CUSTOMER_SERVICE(Q_NO, Q_TITLE, Q_CONTENTS, Q_INDATE, Q_STATUS, USER_NO)"
					 + " VALUES(CUSTOMER_SERVICE_SEQ.nextval, ?, ?, default, default, 2)";
		
		int result = 0;
		
		try {
			ps = con.prepareStatement(query);
			
			ps.setString(1, csDTO.getBoardTitle());
			ps.setString(2, csDTO.getBoardContents());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	// 게시글 목록 가져오기
	public ArrayList<CustomerServiceDTO> getList() {
		String query = "SELECT Q_TITLE, Q_NO FROM CUSTOMER_SERVICE";
		
		try {
			// 쿼리문 작성 후 실행준비
			ps = con.prepareStatement(query);
			
			// 쿼리문 실행
			ResultSet rs = ps.executeQuery();
			
			// 실행결과 담을 변수 생성
			ArrayList<CustomerServiceDTO> result = new ArrayList();
			
			while(rs.next()) {
				String boardTitle = rs.getString("Q_TITLE");
				int boardNo = rs.getInt("Q_NO");
				
				CustomerServiceDTO csDTO = new CustomerServiceDTO();
				
				csDTO.setBoardTitle(boardTitle);
				csDTO.setBoardNo(boardNo);
				
				result.add(csDTO);
			}
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	

	// 게시글 상세 조회
	public CustomerServiceDTO getDetail(int boardNo) {
		String query = "SELECT Q_TITLE, Q_CONTENTS, Q_INDATE, USER_NAME "
					 + " FROM CUSTOMER_SERVICE cs "
					 + " JOIN \"MEMBER\" m ON m.USER_NO = cs.USER_NO "
					 + " WHERE cs.Q_NO  = ?";
		
		try {
			ps = con.prepareStatement(query);
			
			ps.setInt(1, boardNo);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				String boardTitle = rs.getString("Q_TITLE");
				String boardContents = rs.getString("Q_CONTENTS");
				String boardIndate = rs.getString("Q_INDATE");
				String userName = rs.getString("USER_NAME");
				
				CustomerServiceDTO csDTO = new CustomerServiceDTO();
				csDTO.setBoardTitle(boardTitle);
				csDTO.setBoardContents(boardContents);
				csDTO.setBoardIndate(boardIndate);
				csDTO.setUserName(userName);
				
				return csDTO;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
