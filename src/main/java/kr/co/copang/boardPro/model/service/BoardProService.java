package kr.co.copang.boardPro.model.service;

import java.util.ArrayList;

import javax.servlet.http.Part;

import kr.co.copang.boardPro.model.dto.BoardProDto;
import kr.co.copang.common.PageInfo;

public interface BoardProService {
	
	public ArrayList<BoardProDto> getList(PageInfo pi, String category);
	
	public int enroll(BoardProDto boardDto);
	
	public BoardProDto selectNo(BoardProDto boardProDto);
	
	public int fileUpload(BoardProDto boardDto, int businessNo);
	
	public int getListCount(String category);
	
	public int getBoardNo(BoardProDto boardDto);
	
	public int typeEnroll(ArrayList<BoardProDto> business, int businessNo);
	
	
}
