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
		String query = "INSERT INTO PAYMENT(P_NO, P_INDATE, P_PRICE, P_ORDER_NO, B_NO, USER_NO)"
					 + " VALUES(PAYMENT_SEQ.nextval, DEFAULT, ?, ?, ?, ?)";
		
		try {
			ps = con.prepareStatement(query);
			
			ps.setInt(1, pDTO.getObjectPrice());
			ps.setString(2, pDTO.getOrderNo());
			ps.setInt(3, pDTO.getObjectNo());
			ps.setInt(4, pDTO.getUserNo());
			
			int result = ps.executeUpdate();
			
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	
	// 결제 정보 가져오기
	public BoardDTO getPaymentInfo(int objectNo, int userNo) {
		String query = "SELECT cb.B_NO, cb.B_TITLE, cb.B_COMPANY, p.P_PRICE, p.P_ORDER_NO, p.P_INDATE, p.USER_NO, u.FILE_NAME, u.FILE_PATH, rb.R_TITLE, rb.R_CONTENTS"
					 + " FROM CATEGORY_BOARD cb"
					 + " JOIN PAYMENT p ON cb.B_NO = p.B_NO"
					 + " JOIN UPLOAD u ON cb.B_NO = u.B_NO"
					 + " JOIN REQUEST_BOARD rb  ON cb.B_NO = rb.B_NO"
					 + " WHERE cb.B_NO = ?"
					 + " AND p.USER_NO = ?"
					 + " AND u.FILE_PATH LIKE '%/main'";
		
		try {
			ps = con.prepareStatement(query);
			
			ps.setInt(1, objectNo);
			ps.setInt(2, userNo);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int orderUserNo = rs.getInt("USER_NO");
				int paymentBoardNo = rs.getInt("B_NO");
				int price = rs.getInt("P_PRICE");
				String paymentBoardTitle = rs.getString("B_TITLE");
				String paymentBoardCompany = rs.getString("B_COMPANY");
				String orderNo = rs.getString("P_ORDER_NO");
				String orderIndate = rs.getString("P_INDATE");
				String fileName = rs.getString("FILE_NAME");
				String filePath = rs.getString("FILE_PATH");
				String requestTitle = rs.getString("R_TITLE");
				String requestContents = rs.getString("R_CONTENTS");
				
				BoardDTO bDTO = new BoardDTO();
				
				bDTO.setBoardNo(paymentBoardNo);
				bDTO.setBoardTitle(paymentBoardTitle);
				bDTO.setCompany(paymentBoardCompany);
				bDTO.setOrderNo(orderNo);
				bDTO.setOrderIndate(orderIndate);
				bDTO.setUserNo(orderUserNo);
				bDTO.setBusinessPay(price);
				bDTO.setFileName(fileName);
				bDTO.setFilePath(filePath);
				bDTO.setRequestTitle(requestTitle);
				bDTO.setRequestContents(requestContents);
				
				return bDTO;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
