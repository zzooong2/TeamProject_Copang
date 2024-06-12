package kr.co.copang.categoryListService.model.service;

import java.util.ArrayList;

import kr.co.copang.categoryListService.model.dto.CategoryListDtoImpl;
import kr.co.copang.common.PageInfo;

public interface CategoryListService {
	
	public ArrayList<CategoryListDtoImpl>getList(String type, PageInfo pi, String middleCategory, String subCategory);

	public int getListCount(String type);

}
