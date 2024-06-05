package kr.co.copang.request.model.dto;

public class RequestDTO {
	
	private int uesrNo; // 회원 번호
	private int requsetNo; // 게시글 번호
	private char requestStatus; // 게시글 삭제유무
	private String requestTitle; // 게시글 제목
	private String requestContents; // 게시글 내용
	private String requestIndate; // 게시글 생성일자
	private String requsetDelete; // 게시글 삭제일자
	
	// Getter & Setter 
	
	public int getUesrNo() {
		return uesrNo;
	}
	public void setUesrNo(int uesrNo) {
		this.uesrNo = uesrNo;
	}
	public int getRequsetNo() {
		return requsetNo;
	}
	public void setRequsetNo(int requsetNo) {
		this.requsetNo = requsetNo;
	}
	public char getRequestStatus() {
		return requestStatus;
	}
	public void setRequestStatus(char requestStatus) {
		this.requestStatus = requestStatus;
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
	public String getRequestIndate() {
		return requestIndate;
	}
	public void setRequestIndate(String requestIndate) {
		this.requestIndate = requestIndate;
	}
	public String getRequsetDelete() {
		return requsetDelete;
	}
	public void setRequsetDelete(String requsetDelete) {
		this.requsetDelete = requsetDelete;
	}
	
}
