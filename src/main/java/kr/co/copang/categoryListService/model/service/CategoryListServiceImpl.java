package kr.co.copang.categoryListService.model.service;

import java.util.ArrayList;

import kr.co.copang.categoryListService.model.dao.CategoryListDao;
import kr.co.copang.categoryListService.model.dto.CategoryListDtoImpl;

public class CategoryListServiceImpl implements CategoryListService {
	CategoryListDao categoryListDao;
	
	public CategoryListServiceImpl() {
		
		categoryListDao = new CategoryListDao();
	
	}
	
	@Override
	public ArrayList<CategoryListDtoImpl> getList(String type) {
		return categoryListDao.getList(type);
	}


	
	

	
}
