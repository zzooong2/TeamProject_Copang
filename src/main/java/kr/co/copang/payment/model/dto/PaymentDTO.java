package kr.co.copang.payment.model.dto;

public class PaymentDTO {

	private String orderNo; // 주문 번호
	private String orderDate; // 결제 일자
	
	private int objectNo; // 제품 번호
	private int objectPrice; // 제품 가격
	private String objectTitle; // 제품 이름
	private String objectCeller; // 판매자 (기업명)
	
	private int requestNo; // 의뢰 번호
	private String requestTitle; // 의뢰 제목
	private String requestContents; // 의뢰 내용
	
	private int userNo; // 회원 번호

	
	// Getter & Setter
	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
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

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
}
