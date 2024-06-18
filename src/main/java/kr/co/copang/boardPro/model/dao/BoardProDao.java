package kr.co.copang.boardPro.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import kr.co.copang.boardPro.model.dto.BoardProDto;
import kr.co.copang.common.DatabaseConnection;
import kr.co.copang.common.PageInfo;

public class BoardProDao {

	private Connection con;
	private DatabaseConnection dc;
	private PreparedStatement pstmt;

	public BoardProDao() {
		dc = new DatabaseConnection();
		con = dc.connDB();
	}

	public ArrayList<BoardProDto> getList(PageInfo pi, String category) {

		ArrayList<BoardProDto> result = new ArrayList<>();

		String query = "SELECT * FROM CATEGORY_BOARD cb"
				+ "		JOIN BUSINESS_MENU bm ON cb.B_NO = bm.B_NO" 
				+ "		JOIN UPLOAD u ON cb.B_NO = u.B_NO"
				+ "		WHERE bm.BM_TYPE = 'SINGLE' OR bm.BM_TYPE = 'STANDARD'"
				+ "		ORDER BY B_VIEWS DESC" 
				+ "		OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pi.getOffset());
			pstmt.setInt(2, pi.getBoardLimit());

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				int no = rs.getInt("B_NO");
				int userNo = rs.getInt("USER_NO");
				String company = rs.getString("B_COMPANY");
				String title = rs.getString("B_TITLE");
				String mainCategory = rs.getString("B_CATEGORY_MAIN");
				String middleCategory = rs.getString("B_CATEGORY_MIDDLE");
				String subcatCategory = rs.getString("B_CATEGORY_SUBCAT");
				String serviceType = rs.getString("B_SERVICETYLE");
				String indate = rs.getString("B_INDATE");
				int views = rs.getInt("B_VIEWS");
				
				int pay = rs.getInt("BM_PAY");

				String fileName = rs.getString("FILE_NAME");
				String filePath = rs.getString("FILE_PATH");
				
				BoardProDto boardProDto = new BoardProDto();
				boardProDto.setBoardProNo(no);
				boardProDto.setUserNo(userNo);
				boardProDto.setBoardProCompany(company);
				boardProDto.setBoardProTitle(title);
				boardProDto.setBoardProCategory(mainCategory);
				boardProDto.setBoardProMiddleCategory(middleCategory);
				boardProDto.setBoardProSubcatCategory(subcatCategory);
				boardProDto.setBoardProServiceType(serviceType);
				boardProDto.setBoardProIndate(indate);
				boardProDto.setBoardProViews(views);
				
				boardProDto.setBusinessServicePay(pay);
				
				boardProDto.setFileName(fileName);
				boardProDto.setFilePath(filePath);
				
				result.add(boardProDto);
			}

			pstmt.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;

	}

	public int getCategoryBoardEnroll(BoardProDto boardDto) {

		String query = "INSERT INTO CATEGORY_BOARD VALUES(CATEGORY_BOARD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, DEFAULT, NULL, NULL, DEFAULT)";

		int result = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardDto.getUserNo());
			pstmt.setString(2, boardDto.getBoardProCompany());
			pstmt.setString(3, boardDto.getBoardProTitle());
			pstmt.setString(4, boardDto.getBoardProCategory());
			pstmt.setString(5, boardDto.getBoardProMiddleCategory());
			pstmt.setString(6, boardDto.getBoardProSubcatCategory());
			pstmt.setString(7, boardDto.getBoardProServiceType());
			pstmt.setString(8, boardDto.getBoardProContents());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int getBoardNo(BoardProDto boardDto) {
		String query = "SELECT B_NO FROM CATEGORY_BOARD" 
				+ "		WHERE USER_NO = ?" + "		ORDER BY B_NO DESC"
				+ "		FETCH FIRST 1 ROW ONLY";

		int result = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardDto.getUserNo());

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				int boardNo = rs.getInt("B_NO");

				return boardNo;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public int getBusinessMenuSingleEnroll(BoardProDto businessDto, int businessNo) {
		
		String query = "INSERT INTO BUSINESS_MENU VALUES(BUSINESS_MENU_SEQ.NEXTVAL, ?, 'SINGLE', ?, ?, ?, ?, ?, ?, ?)";
		
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, businessNo);
			pstmt.setString(2, businessDto.getBusinessServiceName());
			pstmt.setString(3, businessDto.getBusinessServiceGuide());
			pstmt.setInt(4, businessDto.getBusinessServicePay());
			pstmt.setInt(5, businessDto.getBusinessServiceWorkDate());
			pstmt.setInt(6, businessDto.getBusinessServiceRetouch());
			pstmt.setInt(7, businessDto.getBusinessServiceData());
			pstmt.setInt(8, businessDto.getBusinessServiceFunction());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	public int getBusinessMenuEnroll(ArrayList<BoardProDto> business, int businessNo) {
		
		String standardQuery = "INSERT INTO BUSINESS_MENU VALUES(BUSINESS_MENU_SEQ.NEXTVAL, ?, 'STANDARD', ?, ?, ?, ?, ?, ?, ?)";
		String deluxeQuery = "INSERT INTO BUSINESS_MENU VALUES(BUSINESS_MENU_SEQ.NEXTVAL, ?, 'DELUXE', ?, ?, ?, ?, ?, ?, ?)";
		String premiumQuery = "INSERT INTO BUSINESS_MENU VALUES(BUSINESS_MENU_SEQ.NEXTVAL, ?, 'PREMIUM', ?, ?, ?, ?, ?, ?, ?)";

		int result = 0;

		try {
			pstmt = con.prepareStatement(standardQuery);
			pstmt.setInt(1, businessNo);
			pstmt.setString(2, business.get(0).getBusinessServiceName());
			pstmt.setString(3, business.get(0).getBusinessServiceGuide());
			pstmt.setInt(4, business.get(0).getBusinessServicePay());
			pstmt.setInt(5, business.get(0).getBusinessServiceWorkDate());
			pstmt.setInt(6, business.get(0).getBusinessServiceRetouch());
			pstmt.setInt(7, business.get(0).getBusinessServiceData());
			pstmt.setInt(8, business.get(0).getBusinessServiceFunction());
			
			result = pstmt.executeUpdate();

			pstmt.close();

			pstmt = con.prepareStatement(deluxeQuery);
			pstmt.setInt(1, businessNo);
			pstmt.setString(2, business.get(1).getBusinessServiceName());
			pstmt.setString(3, business.get(1).getBusinessServiceGuide());
			pstmt.setInt(4, business.get(1).getBusinessServicePay());
			pstmt.setInt(5, business.get(1).getBusinessServiceWorkDate());
			pstmt.setInt(6, business.get(1).getBusinessServiceRetouch());
			pstmt.setInt(7, business.get(1).getBusinessServiceData());
			pstmt.setInt(8, business.get(1).getBusinessServiceFunction());

			result = pstmt.executeUpdate();

			pstmt.close();

			pstmt = con.prepareStatement(premiumQuery);
			pstmt.setInt(1, businessNo);
			pstmt.setString(2, business.get(2).getBusinessServiceName());
			pstmt.setString(3, business.get(2).getBusinessServiceGuide());
			pstmt.setInt(4, business.get(2).getBusinessServicePay());
			pstmt.setInt(5, business.get(2).getBusinessServiceWorkDate());
			pstmt.setInt(6, business.get(2).getBusinessServiceRetouch());
			pstmt.setInt(7, business.get(2).getBusinessServiceData());
			pstmt.setInt(8, business.get(2).getBusinessServiceFunction());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public BoardProDto selectNo(BoardProDto boardProDto) {

		String query = "SELECT B_NO FROM CATEGORY_BOARD" 
				+ "		WHERE B_NO = (SELECT MAX(B_NO) FROM CATEGORY_BOARD"
				+ "					  WHERE USER_NO = ?)";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProDto.getUserNo());

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int bNo = rs.getInt("B_NO");
				boardProDto.setBoardProNo(bNo);
				return boardProDto;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	public int fileUpload(BoardProDto fileListDto, int businessNo) {

		String query = "INSERT INTO UPLOAD VALUES(UPLOAD_SEQ.NEXTVAL, ?, ?, ?, ?)";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fileListDto.getFilePath());
			pstmt.setString(2, fileListDto.getFileName());
			pstmt.setInt(3, businessNo);
			pstmt.setString(4, fileListDto.getFileContentType());

			int result = pstmt.executeUpdate();
			
			// 로그 추가: 파일 업로드 성공 시
	        if (result == 1) {
	            System.out.println("파일 업로드 성공: " + fileListDto.getFileName());
	        } else {
	            System.out.println("파일 업로드 실패");
	        }

	        return result;
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("파일 업로드 중 오류 발생: " + e.getMessage());
		}

		return 0;
	}

	public int getListCount(String category) {
		String query = "SELECT COUNT(*) AS CNT FROM CATEGORY_BOARD cb"
				+ "		JOIN MEMBER m ON cb.USER_NO = m.USER_NO";

		try {
			pstmt = con.prepareStatement(query);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int result = rs.getInt("CNT");
				return result;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	public void getWriter(BoardProDto boardProDto) {

		String query = "SELECT USER_NAME FROM MEMBER" 
				+ "		WHERE USER_NO = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProDto.getUserNo());

			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String userName = rs.getString("USER_NAME");
				boardProDto.setUserName(userName);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public BoardProDto getDetail(int boardProNo) {
		String query = "SELECT cb.B_NO,"
				+ "			   cb.USER_NO,"
				+ "			   cb.B_COMPANY,"
				+ "			   cb.B_TITLE,"
				+ "			   cb.B_CATEGORY_MAIN,"
				+ "			   cb.B_CATEGORY_MIDDLE,"
				+ "			   cb.B_CATEGORY_SUBCAT,"
				+ "			   cb.B_SERVICESTYLE,"
				+ "			   cb.B_CONTENT,"
				+ "			   cb.B_INDATE,"
				+ "			   cb.B_UPDATE,"
				+ "			   cb.B_DELETE,"
				+ "			   cb.B_VIEWS,"
				+ "			   bs.BM_TYPE"
				+ "		FROM CATEGORY_BOARD cb"
				+ "		JOIN BUSINESS_MENU bs ON cb.B_NO = bs.B_NO" 
				+ "		WHERE cb.B_NO = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProNo);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int bNo = rs.getInt("B_NO");
				int uNo = rs.getInt("USER_NO");
				String bCompany = rs.getString("B_COMPANY");
				String bTitle = rs.getString("B_TITLE");
				String bCategory = rs.getString("B_CATEGORY_MAIN");
				String bMiddelCategory = rs.getString("B_CATEGORY_MIDDLE");
				String bSubcatCategory = rs.getString("B_CATEGORY_SUBCAT");
				String bServiceStyle = rs.getString("B_SERVICESTYLE");
				String bContents = rs.getString("B_CONTENT");
				String bIndate = rs.getString("B_INDATE");
				String bUpdate = rs.getString("B_UPDATE");
				String bDelete = rs.getString("B_DELETE");
				int bViews = rs.getInt("B_VIEWS");
				String bType = rs.getString("BM_TYPE");
				
				BoardProDto nBoardProDto = new BoardProDto();
				nBoardProDto.setBoardProNo(bNo);
				nBoardProDto.setUserNo(uNo);
				nBoardProDto.setBoardProCompany(bCompany);;
				nBoardProDto.setBoardProTitle(bTitle);;
				nBoardProDto.setBoardProCategory(bCategory);
				nBoardProDto.setBoardProMiddleCategory(bMiddelCategory);
				nBoardProDto.setBoardProSubcatCategory(bSubcatCategory);
				nBoardProDto.setBoardProServiceType(bServiceStyle);
				nBoardProDto.setBoardProContents(bContents);
				nBoardProDto.setBoardProIndate(bIndate);
				nBoardProDto.setBoardProUpdate(bUpdate);
				nBoardProDto.setBoardProDelete(bDelete);
				nBoardProDto.setBoardProViews(bViews);
				nBoardProDto.setBusinessServiceType(bType);;

				return nBoardProDto;

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public BoardProDto getDetailSingle(int boardProNo) {

		String standardQuery = "SELECT B_NO,"
				+ "					   BM_TYPE,"
				+ "					   BM_NAME,"
				+ "					   BM_GUIDE,"
				+ "					   BM_PAY,"
				+ "					   BM_WORKDATE,"
				+ "					   BM_RETOUCH,"
				+ "					   BM_DATA,"
				+ "					   BM_FUNCTION"
				+ "				FROM BUSINESS_MENU" 
				+ "				WHERE B_NO = ?"
				+ "				AND BM_TYPE = 'SINGLE'";

		try {
			pstmt = con.prepareStatement(standardQuery);
			pstmt.setInt(1, boardProNo);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int bNo = rs.getInt("B_NO");
				String sType = rs.getString("BM_TYPE");
				String sName = rs.getString("BM_NAME");
				String sGuide = rs.getString("BM_GUIDE");
				int sPay = rs.getInt("BM_PAY");
				int sWorkdate = rs.getInt("BM_WORKDATE");
				int sRetouch = rs.getInt("BM_RETOUCH");
				int sData = rs.getInt("BM_DATA");
				int sFuntion = rs.getInt("BM_FUNCTION");

				BoardProDto sBoardProDto = new BoardProDto();
				sBoardProDto.setBoardProNo(bNo);
				sBoardProDto.setBusinessServiceType(sType);
				sBoardProDto.setBusinessServiceName(sName);
				sBoardProDto.setBusinessServiceGuide(sGuide);
				sBoardProDto.setBusinessServicePay(sPay);
				sBoardProDto.setBusinessServiceWorkDate(sWorkdate);
				sBoardProDto.setBusinessServiceRetouch(sRetouch);
				sBoardProDto.setBusinessServiceData(sData);
				sBoardProDto.setBusinessServiceFunction(sFuntion);

				return sBoardProDto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public BoardProDto getDetailS(int boardProNo) {

		String standardQuery = "SELECT B_NO,"
				+ "					   BM_TYPE,"
				+ "					   BM_NAME,"
				+ "					   BM_GUIDE,"
				+ "					   BM_PAY,"
				+ "					   BM_WORKDATE,"
				+ "					   BM_RETOUCH,"
				+ "					   BM_DATA,"
				+ "					   BM_FUNCTION"
				+ "				FROM BUSINESS_MENU" 
				+ "				WHERE B_NO = ?"
				+ "				AND BM_TYPE = 'STANDARD'";

		try {
			pstmt = con.prepareStatement(standardQuery);
			pstmt.setInt(1, boardProNo);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int bNo = rs.getInt("B_NO");
				String sType = rs.getString("BM_TYPE");
				String sName = rs.getString("BM_NAME");
				String sGuide = rs.getString("BM_GUIDE");
				int sPay = rs.getInt("BM_PAY");
				int sWorkdate = rs.getInt("BM_WORKDATE");
				int sRetouch = rs.getInt("BM_RETOUCH");
				int sData = rs.getInt("BM_DATA");
				int sFuntion = rs.getInt("BM_FUNCTION");

				BoardProDto sBoardProDto = new BoardProDto();
				sBoardProDto.setBoardProNo(bNo);
				sBoardProDto.setBusinessServiceType(sType);
				sBoardProDto.setBusinessServiceName(sName);
				sBoardProDto.setBusinessServiceGuide(sGuide);
				sBoardProDto.setBusinessServicePay(sPay);
				sBoardProDto.setBusinessServiceWorkDate(sWorkdate);
				sBoardProDto.setBusinessServiceRetouch(sRetouch);
				sBoardProDto.setBusinessServiceData(sData);
				sBoardProDto.setBusinessServiceFunction(sFuntion);

				return sBoardProDto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public BoardProDto getDetailD(int boardProNo) {

		String deluxeQuery = "SELECT B_NO,"
				+ "					 BM_TYPE,"
				+ "					 BM_NAME,"
				+ "					 BM_GUIDE,"
				+ "					 BM_PAY,"
				+ "					 BM_WORKDATE,"
				+ "					 BM_RETOUCH,"
				+ "					 BM_DATA,"
				+ "					 BM_FUNCTION"
				+ "			  FROM BUSINESS_MENU" 
				+ "			  WHERE B_NO = ?"
				+ "			  AND BM_TYPE = 'DELUXE'";

		try {
			pstmt = con.prepareStatement(deluxeQuery);
			pstmt.setInt(1, boardProNo);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int bNo = rs.getInt("B_NO");
				String dType = rs.getString("BM_TYPE");
				String dName = rs.getString("BM_NAME");
				String dGuide = rs.getString("BM_GUIDE");
				int dPay = rs.getInt("BM_PAY");
				int dWorkdate = rs.getInt("BM_WORKDATE");
				int dRetouch = rs.getInt("BM_RETOUCH");
				int dData = rs.getInt("BM_DATA");
				int dFuntion = rs.getInt("BM_FUNCTION");

				BoardProDto dBoardProDto = new BoardProDto();
				dBoardProDto.setBoardProNo(bNo);
				dBoardProDto.setBusinessServiceType(dType);
				dBoardProDto.setBusinessServiceName(dName);
				dBoardProDto.setBusinessServiceGuide(dGuide);
				dBoardProDto.setBusinessServicePay(dPay);
				dBoardProDto.setBusinessServiceWorkDate(dWorkdate);
				dBoardProDto.setBusinessServiceRetouch(dRetouch);
				dBoardProDto.setBusinessServiceData(dData);
				dBoardProDto.setBusinessServiceFunction(dFuntion);

				return dBoardProDto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public BoardProDto getDetailP(int boardProNo) {

		String premiumQuery = "SELECT B_NO,"
				+ "					  BM_TYPE,"
				+ "					  BM_NAME,"
				+ "					  BM_GUIDE,"
				+ "					  BM_PAY,"
				+ "					  BM_WORKDATE,"
				+ "					  BM_RETOUCH,"
				+ "					  BM_DATA,"
				+ "					  BM_FUNCTION"
				+ "			   FROM BUSINESS_MENU" 
				+ "			   WHERE B_NO = ?"
				+ "			   AND BM_TYPE = 'PREMIUM'";

		try {
			pstmt = con.prepareStatement(premiumQuery);
			pstmt.setInt(1, boardProNo);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int bNo = rs.getInt("B_NO");
				String pType = rs.getString("BM_TYPE");
				String pName = rs.getString("BM_NAME");
				String pGuide = rs.getString("BM_GUIDE");
				int pPay = rs.getInt("BM_PAY");
				int pWorkdate = rs.getInt("BM_WORKDATE");
				int pRetouch = rs.getInt("BM_RETOUCH");
				int pData = rs.getInt("BM_DATA");
				int pFuntion = rs.getInt("BM_FUNCTION");

				BoardProDto pBoardProDto = new BoardProDto();
				pBoardProDto.setBoardProNo(bNo);
				pBoardProDto.setBusinessServiceType(pType);
				pBoardProDto.setBusinessServiceName(pName);
				pBoardProDto.setBusinessServiceGuide(pGuide);
				pBoardProDto.setBusinessServicePay(pPay);
				pBoardProDto.setBusinessServiceWorkDate(pWorkdate);
				pBoardProDto.setBusinessServiceRetouch(pRetouch);
				pBoardProDto.setBusinessServiceData(pData);
				pBoardProDto.setBusinessServiceFunction(pFuntion);

				return pBoardProDto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public BoardProDto getDetailF(int boardProNo) {

		String query = "SELECT B_NO,"
				+ "			   FILE_NAME,"
				+ "			   FILE_PATH"
				+ "		FROM UPLOAD"
				+ "		WHERE B_NO = ?"
				+ "		AND FILE_PATH LIKE ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProNo);
			pstmt.setString(2, "%main");

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				int bNo = rs.getInt("B_NO");
				String fName = rs.getString("FILE_NAME");
				String fPath = rs.getString("FILE_PATH");

				BoardProDto fBoardProDto = new BoardProDto();
				fBoardProDto.setFileNo(bNo);
				fBoardProDto.setFileName(fName);
				fBoardProDto.setFilePath(fPath);

				return fBoardProDto;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public BoardProDto getDetailFile(int boardProNo) {

		String query = "SELECT B_NO,"
                + "		       FILE_NAME,"
                + "		       FILE_PATH,"
                + "			   FILE_CONTENT_TYPE"
                + " 	FROM UPLOAD"
                + "		WHERE B_NO = ?"
                + "	    AND FILE_PATH LIKE ?";

		   try {
		       pstmt = con.prepareStatement(query);
		       pstmt.setInt(1, boardProNo);
		       pstmt.setString(2, "%main");
		
		       ResultSet rs = pstmt.executeQuery();
		
		       if (rs.next()) {
		           int bNo = rs.getInt("B_NO");
		           String fName = rs.getString("FILE_NAME");
		           String fPath = rs.getString("FILE_PATH");
		           String fContentType = rs.getString("FILE_CONTENT_TYPE");
		
		           BoardProDto fBoardProDto = new BoardProDto();
		           fBoardProDto.setFileNo(bNo);
		           fBoardProDto.setFileName(fName);
		           fBoardProDto.setFilePath(fPath);
		           fBoardProDto.setFileContentType(fContentType);
		
		           return fBoardProDto;
		       }
		
		   } catch (SQLException e) {
		       e.printStackTrace();
		   }
		   return null;
	}
	
	
	
	public ArrayList<BoardProDto> getFiles(int boardProNo) {
		
		ArrayList<BoardProDto> result = new ArrayList<>();
		
		String query = "SELECT B_NO,"
				+ "			   FILE_NAME,"
				+ "			   FILE_PATH,"
				+ "			   FILE_CONTENT_TYPE"
				+ "		FROM UPLOAD"
				+ "		WHERE B_NO = ?"
				+ "		AND FILE_PATH LIKE '%detail'";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProNo);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int boardNo = rs.getInt("B_NO");
				String fileName = rs.getString("FILE_NAME");
				String filePath = rs.getString("FILE_PATH");
				String fContentType = rs.getString("FILE_CONTENT_TYPE");
				
				BoardProDto fileDto = new BoardProDto();
				fileDto.setBoardProNo(boardNo);
				fileDto.setFileName(fileName);
				fileDto.setFilePath(filePath);
				fileDto.setFileContentType(fContentType);
				
				result.add(fileDto);
			}
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	public int setViews(int boardProNo) {
		
		String query = "UPDATE CATEGORY_BOARD"
				+ "		SET B_VIEWS = B_VIEWS + 1"
				+ "		WHERE B_NO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProNo);
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public int BoardReview(BoardProDto boardDto) {
		
		String query = "INSERT INTO CATEGORY_BOARD_REVIEW VALUES(?, ?, ?, ?, DEFAULT)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardDto.getBoardProNo());
			pstmt.setInt(2, boardDto.getUserNo());
			pstmt.setInt(3, boardDto.getReviewStarPoint());
			pstmt.setString(4, boardDto.getReviewContent());
			
			int result = pstmt.executeUpdate();
			
			return result;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
	public ArrayList<BoardProDto> getReviews(int boardProNo) {
	    String query = "SELECT cbr.B_NO,"
	    		+ "			   m.USER_NO,"
	    		+ "			   m.USER_NAME,"
	    		+ "			   cbr.B_REVIEW_POINT,"
	    		+ "			   cbr.B_REVIEW,"
	    		+ "			   cbr.B_REVIEW_INDATE"
                + "		FROM CATEGORY_BOARD_REVIEW cbr "
                + "		JOIN MEMBER m ON cbr.USER_NO = m.USER_NO "
                + "		WHERE cbr.B_NO = ?"
                + "		ORDER BY B_REVIEW_INDATE DESC";
	    ArrayList<BoardProDto> reviews = new ArrayList<>();
	    
	    try {
	        pstmt = con.prepareStatement(query);
	        pstmt.setInt(1, boardProNo);
	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            int boardNo = rs.getInt("B_NO");
	            int userNo = rs.getInt("USER_NO");
	            String userName = rs.getString("USER_NAME");
	            int reviewPoint = rs.getInt("B_REVIEW_POINT");
	            String reviewContent = rs.getString("B_REVIEW");
	            String reviewIndate = rs.getString("B_REVIEW_INDATE");
	            
	            BoardProDto rBoardProDto = new BoardProDto();
	            rBoardProDto.setBoardProNo(boardNo);
	            rBoardProDto.setUserNo(userNo);
	            rBoardProDto.setUserName(userName);
	            rBoardProDto.setReviewStarPoint(reviewPoint);
	            rBoardProDto.setReviewContent(reviewContent);
	            rBoardProDto.setReviewIndate(reviewIndate);

	            reviews.add(rBoardProDto);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return reviews;
	}
	
	public ArrayList<BoardProDto> getNewReviews(int boardProNo) {
        String query = "SELECT cbr.B_NO,"
                + "			   m.USER_NO,"
                + "			   m.USER_NAME,"
                + "			   cbr.B_REVIEW_POINT,"
                + "			   cbr.B_REVIEW,"
                + "			   cbr.B_REVIEW_INDATE"
                + "		FROM CATEGORY_BOARD_REVIEW cbr "
                + "		JOIN MEMBER m ON cbr.USER_NO = m.USER_NO "
                + "		WHERE cbr.B_NO = ?"
                + "		ORDER BY B_REVIEW_INDATE DESC";
        ArrayList<BoardProDto> reviews = new ArrayList<>();

        try {
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, boardProNo);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int boardNo = rs.getInt("B_NO");
                int userNo = rs.getInt("USER_NO");
                String userName = rs.getString("USER_NAME");
                int reviewPoint = rs.getInt("B_REVIEW_POINT");
                String reviewContent = rs.getString("B_REVIEW");
                String reviewIndate = rs.getString("B_REVIEW_INDATE");

                BoardProDto rBoardProDto = new BoardProDto();
                rBoardProDto.setBoardProNo(boardNo);
                rBoardProDto.setUserNo(userNo);
                rBoardProDto.setUserName(userName);
                rBoardProDto.setReviewStarPoint(reviewPoint);
                rBoardProDto.setReviewContent(reviewContent);
                rBoardProDto.setReviewIndate(reviewIndate);

                reviews.add(rBoardProDto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reviews;
    }
	
	public float getReviewAvg(int boardProNo) {
		
		String query = "SELECT AVG(B_REVIEW_POINT) AS AVG"
				+ "		FROM CATEGORY_BOARD_REVIEW"
				+ "		WHERE B_NO = ?";
		
		float result = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProNo);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result = rs.getFloat("AVG");
			}
			
			return result;
			
		} catch (SQLException e) {
	        e.printStackTrace();
	    }
		
		return 0;
	}
	
	public int setBMDelete(int boardProNo) {
		
		String query = "DELETE FROM BUSINESS_MENU"
				+ "		WHERE B_NO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProNo);
			
			int result = pstmt.executeUpdate();
			
			System.out.println("setBMDelete : " + result);
			
			return result;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int setUDelete(int boardProNo) {
		
		String query = "DELETE FROM UPLOAD"
				+ "		WHERE B_NO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProNo);
			
			int result = pstmt.executeUpdate();
			
			System.out.println("setUDelete : " + result);
			
			return result;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int setCBRDelete(int boardProNo) {
		
		String query = "DELETE FROM CATEGORY_BOARD_REVIEW"
				+ "		WHERE B_NO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProNo);
			
			int result = pstmt.executeUpdate();
			
			System.out.println("setCBRDelete : " + result);
			
			return result;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int setRBDelete(int boardProNo) {
		
		String query = "DELETE FROM REQUEST_BOARD"
				+ "		WHERE B_NO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProNo);
			
			int result = pstmt.executeUpdate();
			
			System.out.println("setRBDelete : " + result);
			
			return result;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int setCBDelete(int boardProNo) {
		
		String query = "DELETE FROM CATEGORY_BOARD"
				+ "		WHERE B_NO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProNo);
			
			int result = pstmt.executeUpdate();
			
			return result;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public String getMainCategory(int boardProNo) {
		
		String query = "SELECT B_CATEGORY_MAIN"
				+ "		FROM CATEGORY_BOARD"
				+ "		WHERE B_NO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardProNo);
			
			ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
            	String type = rs.getString("B_CATEGORY_MAIN");
            	
            	System.out.println("DAO : " + type);
            	
            	return type;
            }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	
}