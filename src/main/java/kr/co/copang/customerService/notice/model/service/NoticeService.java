package kr.co.copang.customerService.notice.model.service;

import java.util.ArrayList;

import kr.co.copang.common.PageInfo;
import kr.co.copang.customerService.notice.model.dto.NoticeDTO;

public interface NoticeService {
	
	// 게시글 목록
	public ArrayList<NoticeDTO> getList(PageInfo pi, String category, String searchText);
	
	// 게시글 상세보기
	public NoticeDTO getDetail(int noticeNo);

	// 게시글 수정페이지 이동
	public NoticeDTO edit(int noticeNo);
	// 게시글 수정 폼
	public int editEnroll(NoticeDTO nDTO);
	
	// 게시글 삭제
	public int delete(int noticeNo);
	
	// 게시글 작성
	public int enroll(NoticeDTO nDTO);
	
	// 페이지 처리
	public int getListCount(String category, String searchText);
	
}
