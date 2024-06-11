package kr.co.copang.categoryListService.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.copang.categoryListService.model.dto.CategoryListDtoImpl;
import kr.co.copang.common.DatabaseConnection;
import kr.co.copang.common.PageInfo;

public class CategoryListDao {
	private Connection con;
	private DatabaseConnection dc;
	private PreparedStatement pstmt;
	
	public CategoryListDao() {
		dc = new DatabaseConnection();
		con = dc.connDB();
	}
	
	
	public ArrayList<CategoryListDtoImpl> getList(String type, PageInfo pi, String middleCategory, String subCategory) {
		
		ArrayList<CategoryListDtoImpl> result = new ArrayList<>();

		String query = " SELECT cb.B_no, B_TITLE, BM_PAY, u.FILE_NAME, u.FILE_PATH, B_COMPANY, B_CATEGORY_MAIN, B_CATEGORY_MIDDLE, B_CATEGORY_SUBCAT, bm.BM_TYPE"
					 + " FROM CATEGORY_BOARD cb"
					 + " JOIN UPLOAD u ON u.B_NO = cb.B_NO"
					 + " JOIN BUSINESS_MENU bm ON bm.B_NO = cb.B_NO "
					 + " WHERE B_CATEGORY_MAIN = ?"
					 + " AND B_CATEGORY_MIDDLE LIKE '%' || ? || '%'"
					 + " AND B_CATEGORY_SUBCAT LIKE '%' || ? || '%'"
					 + " ORDER BY B_CATEGORY_MAIN DESC"
					 + " OFFSET ? ROWS FETCH FIRST ? ROWS ONLY" ;
		

		try {
			
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, type);
			pstmt.setString(2, middleCategory);
			pstmt.setString(3, subCategory);
			pstmt.setInt(4, pi.getOffset());
			pstmt.setInt(5, pi.getBoardLimit());
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int no = rs.getInt("B_NO");

				String categoryType = rs.getString("B_CATEGORY_MAIN");
				String title = rs.getString("B_TITLE");
				String priceOption = rs.getString("BM_TYPE");
				String price = rs.getString("BM_PAY");
				String company = rs.getString("B_COMPANY");
				String midCategory = rs.getString("B_CATEGORY_MIDDLE");
				String subCatCategory = rs.getString("B_CATEGORY_SUBCAT");
				String file = rs.getString("FILE_PATH");
				String fileName = rs.getString("FILE_NAME");

				CategoryListDtoImpl categoryListDto = new CategoryListDtoImpl();
				categoryListDto.setBoardNo(no);
				categoryListDto.setType(categoryType);
				categoryListDto.setBoardTitle(title);
				categoryListDto.setPriceOption(priceOption);
				categoryListDto.setPrice(price);
				categoryListDto.setCompany(company);
				categoryListDto.setMiddleCategory(midCategory);
				categoryListDto.setSubCategory(subCatCategory);
				categoryListDto.setFilePath(file);
				categoryListDto.setFileName(fileName);
				
				result.add(categoryListDto);
				
			}
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return result;
	}


	public int getListCount(String type) {
		String query = "SELECT COUNT(*) AS cnt FROM CATEGORY_BOARD cb"
				+ " JOIN UPLOAD u ON u.B_NO = cb.B_NO"
				+ " JOIN BUSINESS_MENU bm ON bm.B_NO = cb.B_NO "
				+ " where B_CATEGORY_MAIN = ? ";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, type);
			
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
	

	
}
