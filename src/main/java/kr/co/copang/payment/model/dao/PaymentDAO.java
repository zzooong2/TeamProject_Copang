package kr.co.copang.payment.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.copang.boardPro.model.dto.BoardProDto;
import kr.co.copang.common.DatabaseConnection;
import kr.co.copang.payment.model.dto.BoardDTO;
import kr.co.copang.payment.model.dto.PaymentDTO;

public class PaymentDAO {
	
	// DB 연결
	private Connection con;
	private DatabaseConnection dc;
	private PreparedStatement ps;
	
	public PaymentDAO() {
		dc = new DatabaseConnection();
		con = dc.connDB();
	}
	
	// 결제페이지 이동
	public BoardDTO getDetail(BoardDTO bDTO) {

		String query = "SELECT bm.B_NO, BM_TYPE, BM_PAY, cb.B_TITLE, cb.B_COMPANY"
					 + " FROM BUSINESS_MENU bm"
					 + " JOIN CATEGORY_BOARD cb ON bm.B_NO = cb.B_NO"
					 + " WHERE bm.B_NO = ?"
					 + " AND BM_TYPE = ?";

		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, bDTO.getBoardNo());
			ps.setString(2, bDTO.getBusinessType());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int boardNo = rs.getInt("B_NO");
				String businessTitle = rs.getString("B_TITLE");
				String company = rs.getString("B_COMPANY");
				
				int businessPay = rs.getInt("BM_PAY");
				String businessType = rs.getString("BM_TYPE");
				
				bDTO.setBoardNo(boardNo);
				bDTO.setBoardTitle(businessTitle);
				bDTO.setBusinessPay(businessPay);
				bDTO.setBusinessType(businessType);
				bDTO.setCompany(company);

				return bDTO;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// 결제하기
	public int payment(PaymentDTO pDTO) {
		String query = "INSERT INTO PAYMENT(P_NO, P_INDATE, P_ORDER_NO, B_NO, USER_NO)"
					 + " VALUES(PAYMENT_SEQ.nextval, DEFAULT, ?, ?, ?)";
		
		try {
			ps = con.prepareStatement(query);
			
			ps.setString(1, pDTO.getOrderNo());
			ps.setInt(2, 1);
			ps.setInt(3, 1);
			
			int result = ps.executeUpdate();
			
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	

}
