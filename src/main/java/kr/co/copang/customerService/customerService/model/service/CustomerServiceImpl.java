package kr.co.copang.customerService.customerService.model.service;

import java.util.ArrayList;

import kr.co.copang.customerService.customerService.model.dao.CustomerServiceDAO;
import kr.co.copang.customerService.customerService.model.dto.CustomerServiceDTO;

public class CustomerServiceImpl implements CustomerService{
	
	CustomerServiceDAO csDAO = new CustomerServiceDAO();
	
	@Override
	public int enroll(CustomerServiceDTO csDTO) {
		return csDAO.enroll(csDTO);
	}
	
	@Override
	public ArrayList<CustomerServiceDTO> getList() {
		return csDAO.getList();
	}

	@Override
	public CustomerServiceDTO getDetail(int boardNo) {
		return csDAO.getDetail(boardNo);
	}
	
	
}
