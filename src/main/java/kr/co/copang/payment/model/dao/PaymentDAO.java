package kr.co.copang.payment.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.co.copang.common.DatabaseConnection;
import kr.co.copang.payment.model.dto.PaymentDTO;

public class PaymentDAO {
	
	// DB 연결
	private Connection con;
	private DatabaseConnection dc;
	private PreparedStatement pstmt;
	
	public PaymentDAO() {
		dc = new DatabaseConnection();
		con = dc.connDB();
	}
	
	// 결제, 의뢰내역 가져오기
	public PaymentDTO getPayment() {
		String query = "";
		
		
		return null;
	}

}
