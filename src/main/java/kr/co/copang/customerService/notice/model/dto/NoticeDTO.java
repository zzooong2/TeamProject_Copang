package kr.co.copang.customerService.notice.model.dto;

public class NoticeDTO {
	private int userNo; // 게시글 작성자
	private int noticeNo; // 게시글 번호
	private char noticeDeleteStatus; // 게시글 삭제유무
	private String userName; // 게시글 작성자 이름
	private String noticeTitle; // 게시글 제목
	private String noticeContents; // 게시글 내용
	private String noticeIndate; // 게시글 작성일
	private String noticeUpdate; // 게시글 수정일
	private String noticeDelete; // 게시글 삭제일
	
	// Getter & Setter
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public char getNoticeDeleteStatus() {
		return noticeDeleteStatus;
	}
	public void setNoticeDeleteStatus(char noticeDeleteStatus) {
		this.noticeDeleteStatus = noticeDeleteStatus;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContents() {
		return noticeContents;
	}
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	public String getNoticeIndate() {
		return noticeIndate;
	}
	public void setNoticeIndate(String noticeIndate) {
		this.noticeIndate = noticeIndate;
	}
	public String getNoticeUpdate() {
		return noticeUpdate;
	}
	public void setNoticeUpdate(String noticeUpdate) {
		this.noticeUpdate = noticeUpdate;
	}
	public String getNoticeDelete() {
		return noticeDelete;
	}
	public void setNoticeDelete(String noticeDelete) {
		this.noticeDelete = noticeDelete;
	}
	
}
