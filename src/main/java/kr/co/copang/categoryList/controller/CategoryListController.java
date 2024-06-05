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

@WebServlet("/category/list.do")
public class CategoryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CategoryListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//객체 생성(서비스호출)
		CategoryListServiceImpl categoryListService = new CategoryListServiceImpl();
		
//		int cpage = Integer.parseInt(request.getParameter("cpage"));
//		String category = request.getParameter("category");
//		String searchText = request.getParameter("search-text");
		
//		
//				// 전체 게시글 수
//				int listCount = CategoryListService.getListCount(category, searchText);
//				
//				// 보여질 페이지 수
//				int pageLimit = 3;
//				
//				// 한 페이지에 보여질 게시글 수
//				int boardLimit = 9;
//		
		
		ArrayList<CategoryListDtoImpl> List = categoryListService.getList();
		
		request.setAttribute("List", List);
		
		RequestDispatcher view = request.getRequestDispatcher("");
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
