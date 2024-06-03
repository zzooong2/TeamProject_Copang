package kr.co.copang.boardPro.model.dto;

public class BoardProDto {

	private int boardProNo;
	private String boardProTitle;
	private String boardProCategory;
	private String boardProServiceType;
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
	private String businessServiceName;
	private String businessServiceGuide;
	private int businessServicePay;
	private int businessWorkDate;
	private int businessServiceRetouch;
	private int businessConsulting;
	private int businessConsultingTime;
	
	private int fileNo;
	private String filePath;
	private String fileName;
	
	public BoardProDto() {
		super();
	}
	
	public BoardProDto(int businessFunction,int businessRetouch,int businessPay, int businessDate) {
		this.businessFunction = businessFunction;
		this.businessRetouch = businessRetouch;
		this.businessPay = businessPay;
		this.businessDate = businessDate;
	}








	
	
//	------------------------------------ Getter ------------------------------------
	


	public int getBoardProNo() {
		return boardProNo;
	}
	
	public String getBoardProTitle() {
		return boardProTitle;
	}
	
	public String getBoardProCategory() {
		return boardProCategory;
	}
	
	public String getBoardProServiceType() {
		return boardProServiceType;
	}
	
	public String getBoardProContents() {
		return boardProContents;
	}
	
	public String getBoardProIndate() {
		return boardProIndate;
	}
	
	public String getBoardProUpdate() {
		return boardProUpdate;
	}
	
	public String getBoardProDelete() {
		return boardProDelete;
	}
	
	public int getBoardProViews() {
		return boardProViews;
	}
	
	public int getUserNo() {
		return userNo;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	
	public int getBusinessCode() {
		return businessCode;
	}
	
	public String getBusinessName() {
		return businessName;
	}
	
	public int getPartNo() {
		return partNo;
	}
	
	public String getPartName() {
		return partName;
	}
	
	public int getBusinessMenuNo() {
		return businessMenuNo;
	}
	
	public String getBusinessServiceName() {
		return businessServiceName;
	}
	
	public String getBusinessServiceGuide() {
		return businessServiceGuide;
	}
	
	public int getBusinessServicePay() {
		return businessServicePay;
	}
	
	public int getBusinessWorkDate() {
		return businessWorkDate;
	}
	
	public int getBusinessServiceRetouch() {
		return businessServiceRetouch;
	}
	
	public int getBusinessConsulting() {
		return businessConsulting;
	}
	
	public int getBusinessConsultingTime() {
		return businessConsultingTime;
	}
	
	public int getFileNo() {
		return fileNo;
	}
	
	public String getFilePath() {
		return filePath;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	
	
	
	
//	------------------------------------ Setter ------------------------------------
	
	public void setBoardProNo(int boardProNo) {
		this.boardProNo = boardProNo;
	}

	public void setBoardProTitle(String boardProTitle) {
		this.boardProTitle = boardProTitle;
	}

	public void setBoardProCategory(String boardProCategory) {
		this.boardProCategory = boardProCategory;
	}

	public void setBoardProServiceType(String boardProServiceType) {
		this.boardProServiceType = boardProServiceType;
	}

	public void setBoardProContents(String boardProContents) {
		this.boardProContents = boardProContents;
	}

	public void setBoardProIndate(String boardProIndate) {
		this.boardProIndate = boardProIndate;
	}

	public void setBoardProUpdate(String boardProUpdate) {
		this.boardProUpdate = boardProUpdate;
	}

	public void setBoardProDelete(String boardProDelete) {
		this.boardProDelete = boardProDelete;
	}

	public void setBoardProViews(int boardProViews) {
		this.boardProViews = boardProViews;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public void setBusinessCode(int businessCode) {
		this.businessCode = businessCode;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public void setPartNo(int partNo) {
		this.partNo = partNo;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

	public void setBusinessMenuNo(int businessMenuNo) {
		this.businessMenuNo = businessMenuNo;
	}

	public void setBusinessServiceName(String businessServiceName) {
		this.businessServiceName = businessServiceName;
	}

	public void setBusinessServiceGuide(String businessServiceGuide) {
		this.businessServiceGuide = businessServiceGuide;
	}

	public void setBusinessServicePay(int businessServicePay) {
		this.businessServicePay = businessServicePay;
	}

	public void setBusinessWorkDate(int businessWorkDate) {
		this.businessWorkDate = businessWorkDate;
	}

	public void setBusinessServiceRetouch(int businessServiceRetouch) {
		this.businessServiceRetouch = businessServiceRetouch;
	}

	public void setBusinessConsulting(int businessConsulting) {
		this.businessConsulting = businessConsulting;
	}

	public void setBusinessConsultingTime(int businessConsultingTime) {
		this.businessConsultingTime = businessConsultingTime;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
}
