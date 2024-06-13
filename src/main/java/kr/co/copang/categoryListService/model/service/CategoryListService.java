package kr.co.copang.categoryListService.model.service;

import java.util.ArrayList;

import kr.co.copang.categoryListService.model.dto.CategoryListDtoImpl;
import kr.co.copang.common.PageInfo;

public interface CategoryListService {
	
	public ArrayList<CategoryListDtoImpl> getMainCategoryList(String type);
	
	public ArrayList<CategoryListDtoImpl> getMiddleCategoryList(String middleCategory);

	public ArrayList<CategoryListDtoImpl> getSubcatCategoryList(String subCategory);

	public int getListCount(String type);

}
