package kr.co.copang.member.model.dto;

public class MemberDto {
	private int userNo;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userPwd;
	private String confirmPwd;
	
	private String fyoConsent;  // 14세이상     - 필수
	private String sConsent;   // 서비스 이용약관  - 필수
	private String piConsent;   // 개인정보 동의  - 필수
	private String posConsent;  // 홍보 목정 동의  - 선택
	private String secession;
	private int partCode;
	private String[] businessFields;
	
	
	public String[] getBusinessFields() {
		return businessFields;
	}
	public void setBusinessFields(String[] businessFields) {
		this.businessFields = businessFields;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getConfirmPwd() {
		return confirmPwd;
	}
	public void setConfirmPwd(String confirmPwd) {
		this.confirmPwd = confirmPwd;
	}
	public String getFyoConsent() {
		return fyoConsent;
	}
	public void setFyoConsent(String fyoConsent) {
		this.fyoConsent = fyoConsent;
	}
	public String getsConsent() {
		return sConsent;
	}
	public void setsConsent(String sConsent) {
		this.sConsent = sConsent;
	}
	public String getPiConsent() {
		return piConsent;
	}
	public void setPiConsent(String piConsent) {
		this.piConsent = piConsent;
	}
	public String getPosConsent() {
		return posConsent;
	}
	public void setPosConsent(String posConsent) {
		this.posConsent = posConsent;
	}
	public String getSecession() {
		return secession;
	}
	public void setSecession(String secession) {
		this.secession = secession;
	}
	public int getPartCode() {
		return partCode;
	}
	public void setPartCode(int partCode) {
		this.partCode = partCode;
	}
	
}
