package kr.co.copang.categoryListService.model.service;

import java.util.ArrayList;

import kr.co.copang.categoryListService.model.dao.CategoryListDao;
import kr.co.copang.categoryListService.model.dto.CategoryListDto;
import kr.co.copang.categoryListService.model.dto.CategoryListDtoImpl;
import kr.co.copang.common.PageInfo;

public class CategoryListServiceImpl implements CategoryListService {
	CategoryListDao categoryListDao;
	
	public CategoryListServiceImpl() {
		
		categoryListDao = new CategoryListDao();
	
	}
	
	@Override
	public ArrayList<CategoryListDtoImpl> getMainCategoryList(String type) {
		return categoryListDao.getMainCategoryList(type);
	}
		
	@Override
	public ArrayList<CategoryListDtoImpl> getMiddleCategoryList(String middleCategory) {
		return categoryListDao.getMiddleCategoryList(middleCategory);
	}
	
	@Override
	public ArrayList<CategoryListDtoImpl> getSubcatCategoryList(String subCategory) {
		return categoryListDao.getSubcatCategoryList(subCategory);
	}
	
	
	@Override
	public int getListCount(String type) {
		return categoryListDao.getListCount(type);
	}


	
	

	
}
