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

		//		1. jsp 카테고리 클릭하면 /category/list.do로 요청  ->  누가 요청했냐?
//				   요청할 때 /category/list.do?type=IT       /category/list.do?type=design 
//
//				2. 컨트롤러가 String type = request.getParameter("type")

//		오청받은 파라미터값 type은 문자형변수 type에 지닌다.
		String type = request.getParameter("type");		

		int cPage = Integer.parseInt(request.getParameter("cPage"));
		
		int listCount = categoryListService.getListCount(type);
		
		int pageLimit = 2;
		
		int boardLimit = 3;
		
		int row = listCount - (cPage-1) * boardLimit;
		
		PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
		
		ArrayList<CategoryListDtoImpl> list = categoryListService.getList(type, pi);

//		 리스트 잘 가져오는지 까지
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		
		String nextPage = "";
//		""은 "이 사이에 들어가있는 모든것을 해당한다."
		
		
		
		
		if(type.equals("ITㆍ프로그래밍")){
			nextPage = "/views/category/category_IT.jsp";
		}else if(type.equals("디자인")){
			nextPage = "/views/category/category_design.jsp";
		}else if(type.equals("영상ㆍ사진")){
			nextPage = "/views/category/category_media.jsp";
		}else if(type.equals("마케팅")){
			nextPage = "/views/category/category_marketing.jsp";
		}else if(type.equals("교육")){
			nextPage = "/views/category/category_edu.jsp";
		}
	
		RequestDispatcher view = request.getRequestDispatcher(nextPage);
		view.forward(request, response);

	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
