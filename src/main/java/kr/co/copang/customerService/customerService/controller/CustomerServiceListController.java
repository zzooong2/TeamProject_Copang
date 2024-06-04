package kr.co.copang.customerService.customerService.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.common.PageInfo;
import kr.co.copang.common.Pagination;
import kr.co.copang.customerService.customerService.model.dto.CustomerServiceDTO;
import kr.co.copang.customerService.customerService.model.service.CustomerServiceImpl;

@WebServlet("/customerService/list.do")
public class CustomerServiceListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustomerServiceListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 검색기능 구현
		String category = request.getParameter("category");
		String searchText = request.getParameter("search-text");
		
		// 서비스 호출
		CustomerServiceImpl customerService = new CustomerServiceImpl();
		
		// 페이징 처리
		int cPage = Integer.parseInt(request.getParameter("cPage")); // 현재 페이지
		int listCount = customerService.getListCount(category, searchText); // 전체 게시글 수 구하기
		int pageLimit = 5; // 보여질 페이지 수
		int boardLimit = 10; // 한 페이지에 보여질 게시글의 수
		
		PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
		
		// query문 결과 변수에 담기
		ArrayList<CustomerServiceDTO> list = customerService.getList(pi, category, searchText);
		
		// 데이터 바인딩
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/customerService/customerService/customerServiceList.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
