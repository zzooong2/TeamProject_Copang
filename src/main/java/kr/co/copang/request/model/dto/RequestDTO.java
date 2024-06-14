package kr.co.copang.request.model.dto;

public class RequestDTO {
	
	private int userNo; // 회원 번호
	private int requestNo; // 의뢰 번호
	private char requestStatus; // 의뢰 삭제유무
	private String requestTitle; // 의뢰 제목
	private String requestContents; // 의뢰 내용
	private String requestIndate; // 의뢰 생성일자
	private String requestDelete; // 의뢰 삭제일자
	private String userName; // 의뢰 작성자
	
	private int boardNo; // 게시글 번호

	
	// Getter & Setter
	
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
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

	public String getRequestDelete() {
		return requestDelete;
	}

	public void setRequestDelete(String requestDelete) {
		this.requestDelete = requestDelete;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
}
