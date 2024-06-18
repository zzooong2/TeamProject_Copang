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
	public ArrayList<CategoryListDtoImpl> getMainList(String type, PageInfo pi){
		return categoryListDao.getMainList(type, pi);
	}
	@Override
	public ArrayList<CategoryListDtoImpl> getMiddleList(String middleCategory, PageInfo pi) {
		return categoryListDao.getMiddleList(middleCategory, pi);
	}
	@Override
	public ArrayList<CategoryListDtoImpl> getSubList(String subCategory, PageInfo pi) {
		return categoryListDao.getSubList(subCategory, pi);
	}
	
	@Override
	public int getMainListCount(String type) {
		return categoryListDao.getMainListCount(type);
	}

	@Override
	public int getMiddleListCount(String middleCategory) {
		return categoryListDao.getMiddleListCount(middleCategory);
	}
	
	@Override
	public int getSubListCount(String subCategory) {
		return categoryListDao.getSubListCount(subCategory);
	}





   
   

   
}
