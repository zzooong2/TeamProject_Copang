package kr.co.copang.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

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
		String query = "SELECT M.USER_NAME, M.PASSWORD, M.USER_NO, MT.PART_CODE, M.EMAIL, M.PHONE"
				+ "     FROM MEMBER M " 
                + "     JOIN MEMBER_TYPE MT ON M.PART_CODE = MT.PART_CODE "
				+ "     WHERE M.EMAIL = ? AND M.SECESSION = 'N'";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String userName = rs.getString("USER_NAME");
				String hashPassword = rs.getString("PASSWORD");
				String userEmail = rs.getString("EMAIL");
				String userPhone = rs.getString("PHONE");
				int partCode = rs.getInt("PART_CODE");
				int userNo = rs.getInt("USER_NO");
				
				MemberDto result = new MemberDto();
				result.setUserName(userName);
				result.setUserPwd(hashPassword);
				result.setUserEmail(userEmail);
				result.setUserPhone(userPhone);
				result.setPartCode(partCode);
				result.setUserNo(userNo);				
				return result;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public MemberDto searchId(String userName, String userPhone) {
		String query = "SELECT EMAIL FROM MEMBER WHERE USER_NAME = ? AND PHONE = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setString(2, userPhone);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String userEmail = rs.getString("EMAIL");
				
				MemberDto result = new MemberDto();
				result.setUserEmail(userEmail);
				
				return result;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	// 비밀번호 찾기
	public MemberDto searchPwd(String userEmail, String userPhone) {
		String query = "SELECT EMAIL FROM MEMBER WHERE EMAIL = ? AND PHONE = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userEmail);
			pstmt.setString(2, userPhone);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String userEmailFound  = rs.getString("EMAIL");
				
				MemberDto result = new MemberDto();
				result.setUserEmail(userEmailFound);
				
				return result;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 비밀번호 변경
    public int updatePwd(String userEmail, String newPassword) {
    	String query = "UPDATE MEMBER "
    				+ " SET PASSWORD = ?"
    				+ " WHERE EMAIL = ?";
    	
    	
    	// 새로운 비밀번호를 해시하여 저장
        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
        int result = 0;
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, hashedPassword);
            pstmt.setString(2, userEmail);
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
	
	// 핸드폰 번호 변경
	public int updatePhone(String userName, String userEmail, String newPhone) {
		String query = "UPDATE MEMBER SET PHONE = ? WHERE USER_NAME = ? AND EMAIL = ?";
	    int result = 0;
	    try {
	        pstmt = con.prepareStatement(query);
	        pstmt.setString(1, newPhone);
	        pstmt.setString(2, userName);
	        pstmt.setString(3, userEmail);
	        result = pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return result;
	}
	
	// 결제내역 가져오기
	public List<MemberDto> getPaymentsByUserNo(int userNo) {
		List<MemberDto> payments = new ArrayList<>();
		String query = "SELECT p.P_ORDER_NO, p.P_INDATE, bm.BM_PAY"
					+ " FROM PAYMENT p"
					+ " JOIN BUSINESS_MENU bm ON p.B_NO = bm.B_NO"
					+ " WHERE p.USER_NO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MemberDto payment = new MemberDto();
                payment.setPaymentOrderNo(rs.getString("P_ORDER_NO"));
                payment.setPaymentDate(rs.getString("P_INDATE"));
                payment.setAmount(rs.getInt("BM_PAY"));
                payments.add(payment);
                
             // 로그 추가
                System.out.println("결제 내역 조회: P_ORDER_NO=" + payment.getPaymentOrderNo() +
                                   ", P_INDATE=" + payment.getPaymentDate() +
                                   ", BM_PAY=" + payment.getAmount());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return payments;
	}
	
	// 회원 탈퇴
	public int userDelete(String userEmail, String password) {
	    String query = "UPDATE MEMBER "
	                 + "SET SECESSION = 'Y' "
	                 + "WHERE EMAIL = ? AND PASSWORD = ?";
	    int result = 0;
	    
	    try {
	        // 비밀번호 검증을 위해 사용자 정보 조회
	        String getPasswordQuery = "SELECT PASSWORD FROM MEMBER WHERE EMAIL = ?";
	        pstmt = con.prepareStatement(getPasswordQuery);
	        pstmt.setString(1, userEmail);
	        ResultSet rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
	            String hashedPassword = rs.getString("PASSWORD");
	            
	            // BCrypt를 사용하여 비밀번호 일치 여부 확인
	            if (BCrypt.checkpw(password, hashedPassword)) {
	                pstmt = con.prepareStatement(query);
	                pstmt.setString(1, userEmail);
	                pstmt.setString(2, hashedPassword); // 비밀번호는 해시된 상태로 저장되어 있음
	                result = pstmt.executeUpdate();
	                
	                if (result > 0) {
	                    System.out.println("회원 탈퇴 성공: userEmail=" + userEmail);
	                } else {
	                    System.out.println("회원 탈퇴 실패: userEmail=" + userEmail);
	                }
	            } else {
	                System.out.println("비밀번호 일치하지 않음: userEmail=" + userEmail);
	            }
	        } else {
	            System.out.println("사용자 이메일에 해당하는 데이터 없음: userEmail=" + userEmail);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return result; // 탈퇴 처리 결과를 반환
	}

}