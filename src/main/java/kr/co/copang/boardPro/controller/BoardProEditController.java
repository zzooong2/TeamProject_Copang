package kr.co.copang.boardPro.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.copang.boardPro.model.dto.BoardProDto;
import kr.co.copang.boardPro.model.service.BoardProServiceImpl;

@WebServlet("/BoardProEditController")
public class BoardProEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardProEditController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		int userNo = (int)session.getAttribute("userNo");
		
		int boardProNo = Integer.parseInt(request.getParameter("Edit_Page_No"));
		
		BoardProServiceImpl editDataService = new BoardProServiceImpl();
		
		ArrayList<BoardProDto> editPage = editDataService.editPage(boardProNo);
		
		if(editPage != null && editPage.size() >= 6) {
			request.setAttribute("editPage", editPage.get(0));
			request.setAttribute("editPageSingle", editPage.get(1));
			request.setAttribute("editPageS", editPage.get(2));
			request.setAttribute("editPageD", editPage.get(3));
			request.setAttribute("editPageP", editPage.get(4));
			request.setAttribute("editPageF", editPage.get(5));
		} else {
			request.setAttribute("error", "잘못된 접근입니다.");
		}
		
		
		RequestDispatcher view = request.getRequestDispatcher("/views/board/boardProEdit.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String boardTitle = request.getParameter("title");
		String boardContent = request.getParameter("content");
		
		
		
		
		
		/*
		 * if(result == 1) {
		 * response.sendRedirect("/freeBoard/detail.do?boardNo="+boardNo); }
		 */
		
	
	
	
	
	
	}

}
