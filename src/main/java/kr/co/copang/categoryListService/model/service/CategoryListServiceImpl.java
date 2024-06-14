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
	public ArrayList<CategoryListDtoImpl> getMainList(String type){
		return categoryListDao.getMainList(type);
	}
	@Override
	public ArrayList<CategoryListDtoImpl> getMiddleList(String middleCategory) {
		return categoryListDao.getMiddleList(middleCategory);
	}
	@Override
	public ArrayList<CategoryListDtoImpl> getSubList(String subCategory) {
		return categoryListDao.getSubList(subCategory);
	}
	
	@Override
	public int getListCount(String type) {
		return categoryListDao.getListCount(type);
	}




   
   

   
}
