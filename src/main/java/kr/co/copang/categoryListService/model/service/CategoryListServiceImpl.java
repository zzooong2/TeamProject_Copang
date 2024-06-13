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
<<<<<<< HEAD
	public ArrayList<CategoryListDtoImpl> getMainCategoryList(String type) {
		return categoryListDao.getMainCategoryList(type);
=======
	public ArrayList<CategoryListDtoImpl> getMainList(String type){
		return categoryListDao.getMainList(type);
	}
	@Override
	public ArrayList<CategoryListDtoImpl> getMiddleList(String middleCategory) {
		return categoryListDao.getMainList(middleCategory);
	}
	@Override
	public ArrayList<CategoryListDtoImpl> getSubList(String subCategory) {
		return categoryListDao.getMainList(subCategory);
>>>>>>> c5b58e5c72c4d76bbc77027093e022a48e9d9ba2
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
