package kr.co.copang.categoryListService.model.service;

import java.util.ArrayList;

import kr.co.copang.categoryListService.model.dto.CategoryListDtoImpl;

public interface CategoryListService {
	
//	대분류 리스트 불러오기
	public ArrayList<CategoryListDtoImpl>getMainList(String type);
//	중분류 리스트 불러오기
	public ArrayList<CategoryListDtoImpl>getMiddleList(String middleCategory);
//  소분류 리스트 불러오기
	public ArrayList<CategoryListDtoImpl>getSubList(String subCategory);

	public int getListCount(String type);

}
