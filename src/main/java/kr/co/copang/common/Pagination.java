package kr.co.copang.common;

public class Pagination {
	// 페이징 처리 로직	
	public static PageInfo getPageInfo(int listCount, int cPage, int pageLimit, int boardLimit) {
		// 전체 페이지 수
		int maxPage = (int)(Math.ceil((double) listCount / boardLimit));
		// 시작 페이지
		int startPage = (cPage - 1) / pageLimit * pageLimit + 1;
		
		// 마지막 페이지
		int endPage = startPage + pageLimit - 1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		// DB에서 가져올 데이터의 기준
		int offset = (cPage - 1) * boardLimit;

		return new PageInfo(listCount, cPage, pageLimit, boardLimit, maxPage, startPage, endPage, offset);
	}
	
}
