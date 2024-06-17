package kr.co.copang.categoryList.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.categoryListService.model.dto.CategoryListDtoImpl;
import kr.co.copang.categoryListService.model.service.CategoryListServiceImpl;
import kr.co.copang.common.PageInfo;
import kr.co.copang.common.Pagination;

@WebServlet("/category/list.do")
public class CategoryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CategoryListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryListServiceImpl categoryListService = new CategoryListServiceImpl();

//

//		오청받은 파라미터값 type은 문자형변수 type에 지닌다.
		String type = request.getParameter("type");
		request.setAttribute("type", type);
//		중분류 값 요청받기
		String middleCategory = request.getParameter("middleCategory");
		request.setAttribute("middleCategory", middleCategory);
//		소분류 값 요청받기
		String subCategory = request.getParameter("subCategory");
		request.setAttribute("subCategory", subCategory);
		
		
		
//		리스트 카운트 변수 초기화
		int listCount = 0;
		
//		 소분류가 비어있지 
		 if(!subCategory.equals("")) {
//		 	 
			 listCount = categoryListService.getSubListCount(subCategory);
		 } else if(!middleCategory.equals("")) {
//			중분류 리스트 배열
			 listCount = categoryListService.getMiddleListCount(middleCategory);
		 } else {
//			대분류 리스트 배열 
			 listCount = categoryListService.getMainListCount(type);
		}  
		 
		 
		 
//		 int cPage = Integer.parseInt(request.getParameter("cPage"));
		  
		 int cPage = 1;
		 if(request.getParameter("cPage") == null) {
			 cPage = Integer.parseInt(request.getParameter("cPage"));
		 }
		 request.setAttribute("cPage", cPage); 
		  
		  
		  
		 int pageLimit = 2;
		  
		 int boardLimit = 3;
		  
		 PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit); 
		 request.setAttribute("pi", pi);
			 
		 
		 
		ArrayList<CategoryListDtoImpl> fCategory = new ArrayList<>();

//		소분류 리스트 배열
		if(!subCategory.equals("")) {
			ArrayList<CategoryListDtoImpl> tCategory = categoryListService.getSubList(subCategory, pi);
			request.setAttribute("tCategory", tCategory);
		} else if(!middleCategory.equals("")) {
//		중분류 리스트 배열
			ArrayList<CategoryListDtoImpl> sCategory = categoryListService.getMiddleList(middleCategory, pi);
			request.setAttribute("sCategory", sCategory);
		} else {
//		대분류 리스트 배열 
			fCategory = categoryListService.getMainList(type, pi);
			request.setAttribute("fCategory", fCategory);
		}
		
		
		String nextPage = "";
		String trimmedType = type != null ? type.trim() : "";
//		trim() : 문자열의 양 끝에서 공백을 제거한 새로운 문자열을 반환하는 함수
		
		if(trimmedType.equals("IT·프로그래밍")){
			nextPage = "/views/category/category_IT.jsp";
		}else if(trimmedType.equals("디자인")){
			nextPage = "/views/category/category_design.jsp";
		}else if(trimmedType.equals("영상·사진")){
			nextPage = "/views/category/category_media.jsp";
		}else if(trimmedType.equals("마케팅")){
			nextPage = "/views/category/category_marketing.jsp";
		}else if(trimmedType.equals("교육")){
			nextPage = "/views/category/category_edu.jsp";
		}else {
			nextPage = "views/category/default_category.jsp";
			System.out.println("Type did not match any predefined categories");
		}
		
		System.out.println("Next Page : " + nextPage);
		
		
		RequestDispatcher view = request.getRequestDispatcher(nextPage);
		view.forward(request, response);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
