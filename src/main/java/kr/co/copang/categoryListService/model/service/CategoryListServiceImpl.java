package kr.co.copang.categoryListService.model.service;

import java.util.ArrayList;

import kr.co.copang.categoryListService.model.dao.CategoryListDao;
import kr.co.copang.categoryListService.model.dto.CategoryListDtoImpl;
import kr.co.copang.common.PageInfo;

public class CategoryListServiceImpl implements CategoryListService {
	CategoryListDao categoryListDao;
	
	public CategoryListServiceImpl() {
		
		categoryListDao = new CategoryListDao();
	
	}
	
	@Override
	public ArrayList<CategoryListDtoImpl> getList(String type, PageInfo pi, String middleCategory, String subCategory){
		return categoryListDao.getList(type, pi, middleCategory, subCategory);
	}
	
	@Override
	public int getListCount(String type) {
		return categoryListDao.getListCount(type);
	}


	
	

	
}
