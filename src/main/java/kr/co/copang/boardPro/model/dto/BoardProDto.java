package kr.co.copang.boardPro.model.dto;

public class BoardProDto {

	private int boardProNo;
	private String boardProTitle;
	private String boardProCategory;
	private String boardProMiddleCategory;
	private String boardProSubcatCategory;
	private String boardProServiceType;
	private String boardProCompany;
	private String boardProContents;
	private String boardProIndate;
	private String boardProUpdate;
	private String boardProDelete;
	private int boardProViews;
	
	private int userNo;
	private String userName;

	private String userEmail;
	
	private int businessCode;
	private String businessName;
	
	private int partNo;
	private String partName;
	
	private int businessMenuNo;
	private String businessServiceType;
	private String businessServiceName;
	private String businessServiceGuide;
	private int businessServicePay;
	private int businessServiceWorkDate;
	private int businessServiceRetouch;
	private int businessServiceData;
	private int businessServiceFunction;
	
	private int fileNo;
	private String filePath;
	private String fileName;
	
	public BoardProDto() {
		super();
	}
	
	public BoardProDto(String businessServiceName, String businessServiceGuide, int businessServicePay, int businessServiceWorkDate, int businessServiceRetouch, int businessServiceData, int businessServiceFunction) {
		super();
		this.businessServiceName = businessServiceName;
		this.businessServiceGuide = businessServiceGuide;
		this.businessServicePay = businessServicePay;
		this.businessServiceWorkDate = businessServiceWorkDate;
		this.businessServiceRetouch = businessServiceRetouch;
		this.businessServiceData = businessServiceData;
		this.businessServiceFunction = businessServiceFunction;
	}

	
	
	
	
//	==================================== GETTER / SETTER ============================================
	
	
	
	
	
	public int getBoardProNo() {
		return boardProNo;
	}

	public void setBoardProNo(int boardProNo) {
		this.boardProNo = boardProNo;
	}

	public String getBoardProTitle() {
		return boardProTitle;
	}

	public void setBoardProTitle(String boardProTitle) {
		this.boardProTitle = boardProTitle;
	}

	public String getBoardProCategory() {
		return boardProCategory;
	}

	public void setBoardProCategory(String boardProCategory) {
		this.boardProCategory = boardProCategory;
	}

	public String getBoardProMiddleCategory() {
		return boardProMiddleCategory;
	}

	public void setBoardProMiddleCategory(String boardProMiddleCategory) {
		this.boardProMiddleCategory = boardProMiddleCategory;
	}

	public String getBoardProSubcatCategory() {
		return boardProSubcatCategory;
	}

	public void setBoardProSubcatCategory(String boardProSubcatCategory) {
		this.boardProSubcatCategory = boardProSubcatCategory;
	}

	public String getBoardProServiceType() {
		return boardProServiceType;
	}

	public void setBoardProServiceType(String boardProServiceType) {
		this.boardProServiceType = boardProServiceType;
	}

	public String getBoardProCompany() {
		return boardProCompany;
	}

	public void setBoardProCompany(String boardProCompany) {
		this.boardProCompany = boardProCompany;
	}

	public String getBoardProContents() {
		return boardProContents;
	}

	public void setBoardProContents(String boardProContents) {
		this.boardProContents = boardProContents;
	}

	public String getBoardProIndate() {
		return boardProIndate;
	}

	public void setBoardProIndate(String boardProIndate) {
		this.boardProIndate = boardProIndate;
	}

	public String getBoardProUpdate() {
		return boardProUpdate;
	}

	public void setBoardProUpdate(String boardProUpdate) {
		this.boardProUpdate = boardProUpdate;
	}

	public String getBoardProDelete() {
		return boardProDelete;
	}

	public void setBoardProDelete(String boardProDelete) {
		this.boardProDelete = boardProDelete;
	}

	public int getBoardProViews() {
		return boardProViews;
	}

	public void setBoardProViews(int boardProViews) {
		this.boardProViews = boardProViews;
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

	public int getBusinessCode() {
		return businessCode;
	}

	public void setBusinessCode(int businessCode) {
		this.businessCode = businessCode;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public int getPartNo() {
		return partNo;
	}

	public void setPartNo(int partNo) {
		this.partNo = partNo;
	}

	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

	public int getBusinessMenuNo() {
		return businessMenuNo;
	}

	public void setBusinessMenuNo(int businessMenuNo) {
		this.businessMenuNo = businessMenuNo;
	}

	public String getBusinessServiceType() {
		return businessServiceType;
	}

	public void setBusinessServiceType(String businessServiceType) {
		this.businessServiceType = businessServiceType;
	}

	public String getBusinessServiceName() {
		return businessServiceName;
	}

	public void setBusinessServiceName(String businessServiceName) {
		this.businessServiceName = businessServiceName;
	}

	public String getBusinessServiceGuide() {
		return businessServiceGuide;
	}

	public void setBusinessServiceGuide(String businessServiceGuide) {
		this.businessServiceGuide = businessServiceGuide;
	}

	public int getBusinessServicePay() {
		return businessServicePay;
	}

	public void setBusinessServicePay(int businessServicePay) {
		this.businessServicePay = businessServicePay;
	}

	public int getBusinessServiceWorkDate() {
		return businessServiceWorkDate;
	}

	public void setBusinessServiceWorkDate(int businessServiceWorkDate) {
		this.businessServiceWorkDate = businessServiceWorkDate;
	}

	public int getBusinessServiceRetouch() {
		return businessServiceRetouch;
	}

	public void setBusinessServiceRetouch(int businessServiceRetouch) {
		this.businessServiceRetouch = businessServiceRetouch;
	}

	public int getBusinessServiceData() {
		return businessServiceData;
	}

	public void setBusinessServiceData(int businessServiceData) {
		this.businessServiceData = businessServiceData;
	}

	public int getBusinessServiceFunction() {
		return businessServiceFunction;
	}

	public void setBusinessServiceFunction(int businessServiceFunction) {
		this.businessServiceFunction = businessServiceFunction;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	
	

}
