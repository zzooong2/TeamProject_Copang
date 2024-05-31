package kr.co.copang.customerService.customerService.model.dto;

public class CustomerServiceDTO {
	private int boardNo; // 게시글 번호
	private int userNo; // 유저 번호
	private char boardDeleteStatus; // 게시글 삭제유무
	private String boardTitle; // 게시글 제목
	private String boardContents; // 게시글 내용
	private String boardIndate; // 게시글 작성일
	private String boardDelete; // 게시글 수정일
	private String answerContents; // 답변 내용 
	private String answerIndate; // 답변 작성일
	private String answerUpdate; // 답변 수정일
	private String userName; // 유저 이름
	
	
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
	public char getBoardDeleteStatus() {
		return boardDeleteStatus;
	}
	public void setBoardDeleteStatus(char boardDeleteStatus) {
		this.boardDeleteStatus = boardDeleteStatus;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContents() {
		return boardContents;
	}
	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}
	public String getBoardIndate() {
		return boardIndate;
	}
	public void setBoardIndate(String boardIndate) {
		this.boardIndate = boardIndate;
	}
	public String getBoardDelete() {
		return boardDelete;
	}
	public void setBoardDelete(String boardDelete) {
		this.boardDelete = boardDelete;
	}
	public String getAnswerContents() {
		return answerContents;
	}
	public void setAnswerContents(String answerContents) {
		this.answerContents = answerContents;
	}
	public String getAnswerIndate() {
		return answerIndate;
	}
	public void setAnswerIndate(String answerIndate) {
		this.answerIndate = answerIndate;
	}
	public String getAnswerUpdate() {
		return answerUpdate;
	}
	public void setAnswerUpdate(String answerUpdate) {
		this.answerUpdate = answerUpdate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
