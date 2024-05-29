package kr.co.copang.boardPro.model.service;

import java.util.ArrayList;

import kr.co.copang.boardPro.model.dto.BoardProDto;
import kr.co.copang.common.PageInfo;

public interface BoardProService {
	
	public ArrayList<BoardProDto> getList(PageInfo pi, String category);
	
	public int enroll(BoardProDto boardProDto);
	
	public BoardProDto selectNo(BoardProDto boardProDto);
	
	public int fileUpload(BoardProDto boardProDto);
	
	public int getListCount(String category);
	
	public int typeEnroll(BoardProDto boardProDto);
	
	
	
	
}
