package kr.co.copang.customerService.notice.controller;

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
import kr.co.copang.customerService.notice.model.dto.NoticeDTO;
import kr.co.copang.customerService.notice.model.service.NoticeServiceImpl;

@WebServlet("/notice/list.do")
public class NoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서비스 객체 생성
		NoticeServiceImpl noticeService = new NoticeServiceImpl();
		
		// 검색기능, 페이징 처리
		String category = request.getParameter("category");
		String searchText = request.getParameter("search-text");
		
		// 페이징 처리
		int cPage = Integer.parseInt(request.getParameter("cPage")); // 현재 페이지
		int listCount = noticeService.getListCount(category, searchText); // 전체 게시글 수 구하기
		int pageLimit = 5;
		int boardLimit = 8;
		
		// 페이지 처리 객체 생성
		PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
		
		// 서비스 호출 & 결과값 변수에 초기화
		ArrayList<NoticeDTO> list = noticeService.getList(pi, category, searchText);
		
		// 데이터 바인딩
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/customerService/notice/noticeList.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
