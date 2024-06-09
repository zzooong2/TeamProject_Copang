package kr.co.copang.payment.model.dto;

public class PaymentDTO {

	private int paymentNo; // 결제 번호
	private String paymentDate; // 결제 일자
	
	private int objectNo; // 제품 번호
	private int objectPrice; // 제품 가격
	private String objectTitle; // 제품 이름
	private String objectCeller; // 판매자 (기업명)
	
	private int requestNo; // 의뢰 번호
	private String requestTitle; // 의뢰 제목
	private String requestContents; // 의뢰 내용
	
	
	// Getter & Setter
	
	public int getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public int getObjectNo() {
		return objectNo;
	}
	public void setObjectNo(int objectNo) {
		this.objectNo = objectNo;
	}
	public int getObjectPrice() {
		return objectPrice;
	}
	public void setObjectPrice(int objectPrice) {
		this.objectPrice = objectPrice;
	}
	public String getObjectTitle() {
		return objectTitle;
	}
	public void setObjectTitle(String objectTitle) {
		this.objectTitle = objectTitle;
	}
	public String getObjectCeller() {
		return objectCeller;
	}
	public void setObjectCeller(String objectCeller) {
		this.objectCeller = objectCeller;
	}
	public int getRequestNo() {
		return requestNo;
	}
	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
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
