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
	public int CategoryBoardEnroll(BoardProDto boardDto) {
		return boardProDao.getCategoryBoardEnroll(boardDto);
	}
	
	@Override
	public BoardProDto selectNo(BoardProDto boardProDto) {
		return boardProDao.selectNo(boardProDto);
	}
	
	@Override
	public int fileUpload(BoardProDto fileListDto, int businessNo) {
		return boardProDao.fileUpload(fileListDto, businessNo);
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
	public int BusinessMenuSingleEnroll(BoardProDto businessDto, int businessNo) {
		return boardProDao.getBusinessMenuSingleEnroll(businessDto, businessNo);
	}
	
	@Override
	public int BusinessMenuEnroll(ArrayList<BoardProDto> business, int businessNo) {
		return boardProDao.getBusinessMenuEnroll(business, businessNo);
	}
	
	@Override
	public ArrayList<BoardProDto> getDetail(int boardProNo) {
		
		BoardProDto result = boardProDao.getDetail(boardProNo);
		BoardProDto resultSingle = boardProDao.getDetailSingle(boardProNo);
		BoardProDto resultS = boardProDao.getDetailS(boardProNo);
		BoardProDto resultD = boardProDao.getDetailD(boardProNo);
		BoardProDto resultP = boardProDao.getDetailP(boardProNo);
		BoardProDto resultF = boardProDao.getDetailF(boardProNo);

		ArrayList<BoardProDto> list = new ArrayList<>();
		list.add(result);
		list.add(resultSingle);
		list.add(resultS);
		list.add(resultD);
		list.add(resultP);
		list.add(resultF);
		
		int resultView = boardProDao.setViews(result.getBoardProNo());
		
		if(resultView == 1) {
			return list;
		}
		return null;
	}
	
	@Override
	public int BoardReview(BoardProDto boardDto) {
		return boardProDao.BoardReview(boardDto);
	}
	
	@Override
	public ArrayList<BoardProDto> getNewReviews(int boardProNo) {
		return boardProDao.getNewReviews(boardProNo);
	}
	
	@Override
	public ArrayList<BoardProDto> getReviews(int boardProNo) {
		return boardProDao.getReviews(boardProNo);
	}
	
	@Override
	public float getReviewAvg(int boardProNo) {
		return boardProDao.getReviewAvg(boardProNo);
	}
	
	@Override
	public ArrayList<BoardProDto> getFiles(int boardProNo) {
		return boardProDao.getFiles(boardProNo);
	}
	
	@Override
	public BoardProDto getDetailFile(int boardProNo) {
		return boardProDao.getDetailFile(boardProNo);
	}
	
	@Override
	public ArrayList<BoardProDto> editPage(int boardProNo) {
		
		BoardProDto result = boardProDao.getDetail(boardProNo);
		BoardProDto resultSingle = boardProDao.getDetailSingle(boardProNo);
		BoardProDto resultS = boardProDao.getDetailS(boardProNo);
		BoardProDto resultD = boardProDao.getDetailD(boardProNo);
		BoardProDto resultP = boardProDao.getDetailP(boardProNo);
		BoardProDto resultF = boardProDao.getDetailF(boardProNo);
		
		ArrayList<BoardProDto> list = new ArrayList<>();
		list.add(result);
		list.add(resultSingle);
		list.add(resultS);
		list.add(resultD);
		list.add(resultP);
		list.add(resultF);
		
		return list;
	}
	
	
}
