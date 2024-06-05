package kr.co.copang.categoryListService.model.service;

import java.util.ArrayList;

import kr.co.copang.categoryListService.model.dao.CategoryListDao;
import kr.co.copang.categoryListService.model.dto.CategoryListDtoImpl;

public class CategoryListServiceImpl implements CategoryListService {
	CategoryListDao categoryListDao;

	public ArrayList<CategoryListDtoImpl> getList() {
		return categoryListDao.getList();
	}


	
	

	
}
