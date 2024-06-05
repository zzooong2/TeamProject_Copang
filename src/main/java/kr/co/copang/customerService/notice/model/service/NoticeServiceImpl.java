package kr.co.copang.customerService.notice.model.service;

import java.util.ArrayList;

import kr.co.copang.common.PageInfo;
import kr.co.copang.customerService.notice.model.dao.NoticeDAO;
import kr.co.copang.customerService.notice.model.dto.NoticeDTO;

public class NoticeServiceImpl implements NoticeService{
	
	NoticeDAO nDAO = new NoticeDAO();
	
	@Override
	public ArrayList<NoticeDTO> getList(PageInfo pi, String category, String searchText) {
		return nDAO.getList(pi, category, searchText);
	}

	@Override
	public NoticeDTO getDetail(int noticeNo) {
		return nDAO.getDetail(noticeNo);
	}
	
	@Override
	public NoticeDTO edit(int noticeNo) {
		return nDAO.edit(noticeNo);
	}
	
	@Override
	public int editEnroll(NoticeDTO nDTO) {
		return nDAO.editEnroll(nDTO);
	}	
	
	@Override
	public int delete(int noticeNo) {
		return nDAO.delete(noticeNo);
	}
	
	@Override
	public int getListCount(String category, String searchText) {
		return nDAO.getListCount(category, searchText);
	}
	
	@Override
	public int enroll(NoticeDTO nDTO) {
		return nDAO.enroll(nDTO);
	}
}
