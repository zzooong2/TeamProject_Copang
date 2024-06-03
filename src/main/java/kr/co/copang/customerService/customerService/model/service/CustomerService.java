package kr.co.copang.customerService.customerService.model.service;

import java.util.ArrayList;

import kr.co.copang.customerService.customerService.model.dto.CustomerServiceDTO;

public interface CustomerService {
	// 게시글 등록
	public int enroll(CustomerServiceDTO csDTO);
	
	// 게시글 목록 조회
	public ArrayList<CustomerServiceDTO> getList();
	
	// 게시글 상세 조회
	public CustomerServiceDTO getDetail(int boardNo);
}
