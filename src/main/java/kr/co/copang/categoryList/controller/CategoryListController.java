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
		CategoryListServiceImpl categoryListService = new CategoryListServiceImpl();

		//		1. jsp 카테고리 클릭하면 /category/list.do로 요청  ->  누가 요청했냐?
//				   요청할 때 /category/list.do?type=IT       /category/list.do?type=design 
//
//				2. 컨트롤러가 String type = request.getParameter("type")

		String type = request.getParameter("type");		
		
		ArrayList<CategoryListDtoImpl> List = categoryListService.getList(type);
		
		// 리스트 잘 가져오는지 까지
		request.setAttribute("List", List);
		
		
		
		String nextPage = "";
		
		if(type.equals("IT/프로그래밍")){
			nextPage = "/views/category/category_IT.jsp";
		}else if(type == "디자인"){
			nextPage = "/views/category/category_design.jsp";
		}else if(type == "영상"){
			nextPage = "/views/category/category_media.jsp";
		}else if(type == "마케팅"){
			nextPage = "/views/category/category_marketing.jsp";
		}else if(type == "교육"){
			nextPage = "/views/category/category_edu.jsp";
		}
	
		RequestDispatcher view = request.getRequestDispatcher(nextPage);
		view.forward(request, response);

	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
