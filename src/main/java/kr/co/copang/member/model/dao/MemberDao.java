package kr.co.copang.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.copang.common.DatabaseConnection;
import kr.co.copang.member.model.dto.MemberDto;

public class MemberDao {
	private Connection con;
	private DatabaseConnection dc;
	private PreparedStatement pstmt;
	
	public MemberDao() {
		dc = new DatabaseConnection();
		con = dc.connDB();
	}
	
	public int register(MemberDto member) {
		String query = "INSERT INTO member VALUES(member_seq.nextval,?,?,?,?,default,?,?,?,?,?)";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getUserName());
			pstmt.setString(2, member.getUserPhone());
			pstmt.setString(3, member.getUserEmail());
			pstmt.setString(4, member.getUserPwd());
			pstmt.setString(5, member.getFyoConsent());
			pstmt.setString(6, member.getsConsent());
			pstmt.setString(7, member.getPiConsent());
			pstmt.setString(8, member.getPosConsent());
			pstmt.setInt(9, member.getPartCode());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		return result;
	}
	
	public void addBusinessField(int userNo, String busName) {
		int busCode = getBusCode(busName);
        String sql = "INSERT INTO BUSINESS_TYPE (USER_NO, BUS_CODE) VALUES (?, ?)";
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, userNo);
            pstmt.setInt(2, busCode);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	// 새로운 메서드 추가: 비즈니스 분야 이름을 코드로 변환
	public int getBusCode(String busName) {
	    String sql = "SELECT BUS_CODE FROM BUSINESS_TYPE WHERE BUS_NAME = ?";
	    try (PreparedStatement pstmt = con.prepareStatement(sql)) {
	        pstmt.setString(1, busName);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            return rs.getInt("BUS_CODE");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    throw new IllegalArgumentException("Invalid business field: " + busName);
	}

	
	
	
}
