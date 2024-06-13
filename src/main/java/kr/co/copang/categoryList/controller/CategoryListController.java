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

      //      1. jsp 카테고리 클릭하면 /category/list.do로 요청  ->  누가 요청했냐?
//               요청할 때 /category/list.do?type=IT       /category/list.do?type=design 
//
//            2. 컨트롤러가 String type = request.getParameter("type")

//      오청받은 파라미터값 type은 문자형변수 type에 지닌다.
      String type = request.getParameter("type");   

//      중분류 값 요청받기
      String middleCategory = request.getParameter("middleCategory");

//      소분류 값 요청받기
      String subCategory = request.getParameter("subCategory");

//      int cPage = Integer.parseInt(request.getParameter("cPage"));
//      
//      int listCount = categoryListService.getListCount(type); 
//      
//      int pageLimit = 2;
//      
//      int boardLimit = 3;
      
//      PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
      
//      대분류 리스트 배열 
      ArrayList<CategoryListDtoImpl> fCategory = categoryListService.getMainList(type);
      request.setAttribute("fCategory", fCategory);
      
//      중분류 리스트 배열
      ArrayList<CategoryListDtoImpl> sCategory = categoryListService.getMiddleList(middleCategory);
      request.setAttribute("sCategory", sCategory);
      
//      소분류 리스트 배열
      ArrayList<CategoryListDtoImpl> tCategory = categoryListService.getSubList(subCategory);
      request.setAttribute("tCategory", tCategory);
      
//      request.setAttribute("pi", pi);
//      request.setAttribute("middleCategory", middleCategory);
//      request.setAttribute("subCategory", subCategory);
      
      
      String nextPage = "";
      String trimmedType = type != null ? type.trim() : "";
      
      
      
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
