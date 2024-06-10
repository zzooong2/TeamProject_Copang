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
		String query = "INSERT INTO member VALUES(member_seq.nextval,?,?,?,?,default,?,?,?,?,default,?)";
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
		} catch (SQLException e) {
			e.printStackTrace();
		}		return result;
	}
	
		public void addBusinessField(int userNo, int busCode) {
		    String sql = "INSERT INTO MEMBERBUSINESS_TYPE (USER_NO, BUS_CODE) VALUES(?,?)"; 
		    		/*+    " SELECT USER_NO, ? FROM MEMBER WHERE USER_NAME = ?";*/
		    System.out.println(userNo);
		    System.out.println(busCode);
		    try {
		        pstmt = con.prepareStatement(sql);
		        pstmt.setInt(1, userNo);
		        pstmt.setInt(2, busCode);
		        pstmt.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		}
		
		// 새로운 메서드 추가: USER_NO 가져오기
	    public int getUserNoByEmail(String email) {
	        String query = "SELECT USER_NO FROM member WHERE EMAIL = ?";
	        int userNo = 0;
	        try {
	            pstmt = con.prepareStatement(query);
	            pstmt.setString(1, email);
	            ResultSet rs = pstmt.executeQuery();
	            if (rs.next()) {
	                userNo = rs.getInt("USER_NO");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return userNo;
	    }
		
		
	
	// 새로운 메서드 추가: 비즈니스 분야 이름을 코드로 변환
	public String getBusName(int busCode) {
	    String sql = "SELECT BUS_NAME FROM BUSINESS_TYPE WHERE BUS_CODE = ?";
	    try (PreparedStatement pstmt = con.prepareStatement(sql)) {
	        pstmt.setInt(1, busCode);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            return rs.getString("BUS_NAME");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    throw new IllegalArgumentException("Invalid business field code: " + busCode);
	}
	
	// 중복검사
	public int duplicateId(String id) {
		String query = "SELECT count(*) AS CNT FROM member"
				+ "     WHERE EMAIL = ?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result = rs.getInt("CNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 로그인
	public MemberDto login(String id) {
		String query = "SELECT M.USER_NAME, M.PASSWORD, MT.PART_NAME, M.USER_NO, MT.PART_CODE"
				+ "     FROM MEMBER M " 
                + "     JOIN MEMBER_TYPE MT ON M.PART_CODE = MT.PART_CODE "
				+ "     WHERE M.EMAIL = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String userName = rs.getString("USER_NAME");
				String hashPassword = rs.getString("PASSWORD");
				String partName = rs.getString("PART_NAME");
				int partCode = rs.getInt("PART_CODE");
				int userNo = rs.getInt("USER_NO");
				
				MemberDto result = new MemberDto();
				result.setUserName(userName);
				result.setUserPwd(hashPassword);
				result.setUsertype(partName);
				result.setPartCode(partCode);
				result.setUserNo(userNo);				
				return result;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	
	
}
