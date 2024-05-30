package kr.co.copang.boardPro.model.service;

import java.util.ArrayList;

import javax.servlet.http.Part;

import kr.co.copang.boardPro.model.dao.BoardProDao;
import kr.co.copang.boardPro.model.dto.BoardProDto;
import kr.co.copang.common.PageInfo;

public class BoardProServiceImpl implements BoardProService {
	
	BoardProDao boardProDao;
	
	public BoardProServiceImpl() {
		boardProDao = new BoardProDao();
	}
	
	@Override
	public ArrayList<BoardProDto> getList(PageInfo pi, String category) {
		return boardProDao.getList(pi, category);
	}
	
	@Override
	public int enroll(BoardProDto boardDto) {
		return boardProDao.getEnroll(boardDto);
	}
	
	@Override
	public BoardProDto selectNo(BoardProDto boardProDto) {
		return boardProDao.selectNo(boardProDto);
	}
	
	@Override
	public int fileUpload(BoardProDto boardDto, int businessNo) {
		return boardProDao.fileUpload(boardDto, businessNo);
	}
	
	@Override
	public int getListCount(String category) {
		return boardProDao.getListCount(category);
	}
	
	@Override
	public int getBoardNo(BoardProDto boardDto) {
		return boardProDao.getBoardNo(boardDto);
	}
	
	@Override
	public int typeEnroll(ArrayList<BoardProDto> business, int businessNo) {
		return boardProDao.getTypeEnroll(business, businessNo);
	}
	
	
}
