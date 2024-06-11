package kr.co.copang.payment.model.service;

import kr.co.copang.payment.model.dto.PaymentDTO;

public interface PaymentService {
	
	public int payment(PaymentDTO pDTO);
}
