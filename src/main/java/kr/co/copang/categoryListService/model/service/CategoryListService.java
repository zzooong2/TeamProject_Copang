package kr.co.copang.categoryListService.model.service;

import java.util.ArrayList;

import kr.co.copang.categoryListService.model.dto.CategoryListDtoImpl;
import kr.co.copang.common.PageInfo;

public interface CategoryListService {
	
//	대분류 리스트 불러오기
	public ArrayList<CategoryListDtoImpl>getMainList(String type, PageInfo pi);
//	중분류 리스트 불러오기
	public ArrayList<CategoryListDtoImpl>getMiddleList(String middleCategory, PageInfo pi);
//  소분류 리스트 불러오기
	public ArrayList<CategoryListDtoImpl>getSubList(String subCategory, PageInfo pi);

	public int getListCount(String type, String middleCategory, String subCategory);

}
