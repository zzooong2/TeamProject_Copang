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
	
	public int BoardReview(BoardProDto boardDto);
	
	public ArrayList<BoardProDto> getReviews(int boardProNo);
	
	public ArrayList<BoardProDto> getNewReviews(int boardProNo);
	
	public float getReviewAvg(int boardProNo);
	
	public ArrayList<BoardProDto> getFiles(int boardProNo);
	
	public BoardProDto getDetailFile(int boardProNo);
	
	public ArrayList<BoardProDto> editPage(int boardProNo);
	
	public int setBMDelete(int boardProNo);

	public int setUDelete(int boardProNo);
	
	public int setCBRDelete(int boardProNo);
	
	public int setRBDelete(int boardProNo);
	
	public int setCBDelete(int boardProNo);
	
}
