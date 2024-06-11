package kr.co.copang.payment.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.co.copang.common.DatabaseConnection;
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
