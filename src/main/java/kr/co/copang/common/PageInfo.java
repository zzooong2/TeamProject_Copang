package kr.co.copang.common;

public class PageInfo {

	private int listCount;
	private int cpage;
	private int pageLimit;
	private int boardLimit;

	private int maxPage;
	private int startPage;
	private int endPage;

	private int offset;
	
	
	
	public PageInfo(int listCount, int cpage, int pageLimit, int boardLimit, int maxPage, int startPage, int endPage,
			int offset) {
		super();
		this.listCount = listCount;
		this.cpage = cpage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.offset = offset;
	}

	
// ---------------------------------- Getter ----------------------------------	
	
	public int getListCount() {
		return listCount;
	}

	public int getCpage() {
		return cpage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getOffset() {
		return offset;
	}

	
	
// ---------------------------------- Setter ----------------------------------	
	
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	
	public void setCpage(int cpage) {
		this.cpage = cpage;
	}
	
	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}
	
	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}
	
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public void setOffset(int offset) {
		this.offset = offset;
	}
	
}
