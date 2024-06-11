package kr.co.copang.payment.model.service;

import kr.co.copang.payment.model.dao.PaymentDAO;
import kr.co.copang.payment.model.dto.PaymentDTO;

public class PaymentServiceImpl implements PaymentService{
	
	PaymentDAO pDAO = new PaymentDAO();
	
	@Override
	public int payment(PaymentDTO pDTO) {
		return pDAO.payment(pDTO);
	}
}
