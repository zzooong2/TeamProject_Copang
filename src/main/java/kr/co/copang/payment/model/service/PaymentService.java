package kr.co.copang.payment.model.service;

import kr.co.copang.payment.model.dto.BoardDTO;
import kr.co.copang.payment.model.dto.PaymentDTO;

public interface PaymentService {
	
	// 제품 상세페이지
	public BoardDTO getDetail(BoardDTO bDTO);
	
	// 결제 
	public int payment(PaymentDTO pDTO);

	// 결제 완료 페이지
	public BoardDTO getPaymentInfo(BoardDTO bDTO);
	
}
