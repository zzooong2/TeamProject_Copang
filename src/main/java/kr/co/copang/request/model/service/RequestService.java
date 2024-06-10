package kr.co.copang.request.model.service;

import kr.co.copang.request.model.dto.RequestDTO;

public interface RequestService {
	
	// 의뢰 등록
	public int enroll(RequestDTO rDTO);
	
	// 의뢰 수정페이지 이동
	public RequestDTO getRequest(int requestNo);
	
	// 의뢰 번호 가져오기
	public RequestDTO getRequestNo(int userNo);
	
	// 의뢰 수정 폼
	public int editEnroll(RequestDTO rDTO);
}
