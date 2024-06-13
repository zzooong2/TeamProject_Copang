package kr.co.copang.categoryListService.model.service;

import java.util.ArrayList;

import kr.co.copang.categoryListService.model.dto.CategoryListDtoImpl;

public interface CategoryListService {
	
<<<<<<< HEAD
	public ArrayList<CategoryListDtoImpl> getMainCategoryList(String type);
	
	public ArrayList<CategoryListDtoImpl> getMiddleCategoryList(String middleCategory);

	public ArrayList<CategoryListDtoImpl> getSubcatCategoryList(String subCategory);
=======
//	대분류 리스트 불러오기
	public ArrayList<CategoryListDtoImpl>getMainList(String type);
//	중분류 리스트 불러오기
	public ArrayList<CategoryListDtoImpl>getMiddleList(String middleCategory);
//  소분류 리스트 불러오기
	public ArrayList<CategoryListDtoImpl>getSubList(String subCategory);
>>>>>>> c5b58e5c72c4d76bbc77027093e022a48e9d9ba2

	public int getListCount(String type);

}
