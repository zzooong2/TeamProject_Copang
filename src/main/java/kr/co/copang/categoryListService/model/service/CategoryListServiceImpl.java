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
	public ArrayList<CategoryListDtoImpl> getMainList(String type, PageInfo pi, String searchText){
		return categoryListDao.getMainList(type, pi, searchText);
	}
	@Override
	public ArrayList<CategoryListDtoImpl> getMiddleList(String middleCategory, PageInfo pi, String searchText) {
		return categoryListDao.getMiddleList(middleCategory, pi, searchText);
	}
	@Override
	public ArrayList<CategoryListDtoImpl> getSubList(String subCategory, PageInfo pi, String searchText) {
		return categoryListDao.getSubList(subCategory, pi, searchText);
	}
	
	@Override
	public int getMainListCount(String type, String searchText) {
		return categoryListDao.getMainListCount(type, searchText);
	}

	@Override
	public int getMiddleListCount(String middleCategory, String searchText) {
		return categoryListDao.getMiddleListCount(middleCategory, searchText);
	}
	
	@Override
	public int getSubListCount(String subCategory, String searchText) {
		return categoryListDao.getSubListCount(subCategory, searchText);
	}





   
   

   
}
