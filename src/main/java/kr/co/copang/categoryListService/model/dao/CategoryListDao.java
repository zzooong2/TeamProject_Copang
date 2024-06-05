package kr.co.copang.categoryListService.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.copang.categoryListService.model.dto.CategoryListDtoImpl;
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
	
	
	public ArrayList<CategoryListDtoImpl> getList() {
		
		ArrayList<CategoryListDtoImpl> result = new ArrayList<>();
		String query = "SELECT B_TITLE, BM_PAY, u.FILE_PATH,m.USER_NAME FROM CATEGORY_BOARD cb"
			+ " JOIN UPLOAD u ON u.B_NO = cb.B_NO"
			+ " JOIN BUSINESS_MENU bm ON bm.B_NO = cb.B_NO "
			+ " JOIN MEMBER m ON m.USER_NO = cb.USER_NO ";
	 
		try {
			
			pstmt = con.prepareStatement(query);
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int no = rs.getInt("B_NO");
				String title = rs.getString("B_TITLE");
				String price = rs.getString("BM_PAY");
				String file = rs.getString("U.FILE_PATH");
				String user = rs.getString("M.USER_NAME");

				CategoryListDtoImpl categoryListDto = new CategoryListDtoImpl();
				categoryListDto.setBoardNo(no);
				categoryListDto.setBoardTitle(title);
				categoryListDto.setPrice(price);
				categoryListDto.setFilePath(file);
				categoryListDto.setCompany(user);
				result.add(categoryListDto);
				
			}
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return result;
	}
	

	
}
