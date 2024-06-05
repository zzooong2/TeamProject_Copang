package kr.co.copang.customerService.customerService.model.service;

import java.util.ArrayList;

import kr.co.copang.common.PageInfo;
import kr.co.copang.customerService.customerService.model.dao.CustomerServiceDAO;
import kr.co.copang.customerService.customerService.model.dto.CustomerServiceDTO;

public class CustomerServiceImpl implements CustomerService{
	
	CustomerServiceDAO csDAO = new CustomerServiceDAO();
	
	@Override
	public int enroll(CustomerServiceDTO csDTO) {
		return csDAO.enroll(csDTO);
	}
	
	@Override
	public ArrayList<CustomerServiceDTO> getList(PageInfo pi, String category, String searchText) {
		return csDAO.getList(pi, category, searchText);
	}

	@Override
	public CustomerServiceDTO getDetail(int boardNo) {
		return csDAO.getDetail(boardNo);
	}

	@Override
	public CustomerServiceDTO edit(int boardNo) {
		return csDAO.edit(boardNo);
	}
	
	@Override
	public int editEnroll(CustomerServiceDTO csDTO) {
		return csDAO.editEnroll(csDTO);
	}
	
	@Override
	public int delete(int boardNo) {
		return csDAO.delete(boardNo);
	}

	@Override
	public int getListCount(String category, String searchText) {
		return csDAO.getListCount(category, searchText);
	}
	
	
}
