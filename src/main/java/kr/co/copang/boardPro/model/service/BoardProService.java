package kr.co.copang.boardPro.model.service;

import java.util.ArrayList;

import javax.servlet.http.Part;

import kr.co.copang.boardPro.model.dto.BoardProDto;
import kr.co.copang.common.PageInfo;

public interface BoardProService {
	
	public ArrayList<BoardProDto> getList(PageInfo pi, String category);
	
	public int CategoryBoardEnroll(BoardProDto boardDto);
	
	public BoardProDto selectNo(BoardProDto boardProDto);
	
	public int fileUpload(BoardProDto boardDto, int businessNo);
	
	public int getListCount(String category);
	
	public int getBoardNo(BoardProDto boardDto);
	
	public int BusinessMenuSingleEnroll(BoardProDto businessDto, int businessNo);
	
	public int BusinessMenuEnroll(ArrayList<BoardProDto> business, int businessNo);
	
	public ArrayList<BoardProDto> getDetail(int boardProNo);
	
}
