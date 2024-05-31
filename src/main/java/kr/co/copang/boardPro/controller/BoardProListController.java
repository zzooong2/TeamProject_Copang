package kr.co.copang.boardPro.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.boardPro.model.dto.BoardProDto;
import kr.co.copang.boardPro.model.service.BoardProServiceImpl;
import kr.co.copang.common.PageInfo;
import kr.co.copang.common.Pagination;

@WebServlet("/BoardPro/list.do")
public class BoardProListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardProListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BoardProServiceImpl boardProService = new BoardProServiceImpl();
		
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		
		String category = request.getParameter("category");
		
		int listCount = boardProService.getListCount("category");
		
		int pageLimit = 5;
		
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
		
		ArrayList<BoardProDto> list = boardProService.getList(pi, category);
		
		int row = listCount - (cpage-1) * boardLimit;
		
		request.setAttribute("list", list);
		request.setAttribute("row", row);
		request.setAttribute("pi", pi);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/board/boardProList.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
