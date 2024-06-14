package kr.co.copang.payment.model.dto;

public class BoardDTO {
	
	private int boardNo; // 게시글 번호
	private int userNo; // 회원 번호
	private String company; // 회사명
	private String boardTitle; // 게시글 제목
	
	private int businessPay; // 상품 금액;
	private String businessType; // 상품 타입 (STANDARD, DELUX, PREMIUM)
	
	private String fileName; // 파일 이름
	private String filePath; // 파일 경로
	
	private String orderNo; // 주문번호
	private String orderIndate; // 주문날짜
	
	private String requestTitle; // 의뢰제목
	private String requestContents; // 의뢰내용
	
	
	// Getter & Setter
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public int getBusinessPay() {
		return businessPay;
	}
	public void setBusinessPay(int businessPay) {
		this.businessPay = businessPay;
	}
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getOrderIndate() {
		return orderIndate;
	}
	public void setOrderIndate(String orderIndate) {
		this.orderIndate = orderIndate;
	}
	public String getRequestTitle() {
		return requestTitle;
	}
	public void setRequestTitle(String requestTitle) {
		this.requestTitle = requestTitle;
	}
	public String getRequestContents() {
		return requestContents;
	}
	public void setRequestContents(String requestContents) {
		this.requestContents = requestContents;
	}
	
}
