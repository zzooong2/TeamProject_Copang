package kr.co.copang.boardPro.model.service;

import java.util.ArrayList;

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
	public int enroll(BoardProDto boardProDto) {
		return boardProDao.getEnroll(boardProDto);
	}
	
	@Override
	public BoardProDto selectNo(BoardProDto boardProDto) {
		return boardProDao.selectNo(boardProDto);
	}
	
	@Override
	public int fileUpload(BoardProDto boardProDto) {
		return boardProDao.fileUpload(boardProDto);
	}
	
	@Override
	public int getListCount(String category) {
		return boardProDao.getListCount(category);
	}
	
	@Override
	public int typeEnroll(BoardProDto boardProDto) {
		return boardProDao.getTypeEnroll(boardProDto);
	}
	
	
	
	
	
	
	
}
