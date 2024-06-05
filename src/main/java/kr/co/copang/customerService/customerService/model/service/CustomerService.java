package kr.co.copang.customerService.customerService.model.service;

import java.util.ArrayList;

import kr.co.copang.common.PageInfo;
import kr.co.copang.customerService.customerService.model.dto.CustomerServiceDTO;

public interface CustomerService {
	// 게시글 등록
	public int enroll(CustomerServiceDTO csDTO);
	
	// 게시글 목록 조회
	public ArrayList<CustomerServiceDTO> getList(PageInfo pi, String category, String searchText);
	
	// 게시글 상세 조회
	public CustomerServiceDTO getDetail(int boardNo);
	
	// 게시글 수 조회
	public int getListCount(String category, String searchText);
	
	// 게시글 수정 페이지
	public CustomerServiceDTO edit(int boardNo);
	// 게시글 수정 폼 
	public int editEnroll(CustomerServiceDTO csDTO);
	
	// 게시글 삭제
	public int delete(int boardNo);
}

