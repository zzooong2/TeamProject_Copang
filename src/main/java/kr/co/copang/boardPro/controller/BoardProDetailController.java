package kr.co.copang.boardPro.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.boardPro.model.dto.BoardProDto;
import kr.co.copang.boardPro.model.service.BoardProServiceImpl;

@WebServlet("/BoardProDetailController")
public class BoardProDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardProDetailController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int boardProNo = Integer.parseInt(request.getParameter("B_NO"));
	
		BoardProServiceImpl boardProService = new BoardProServiceImpl(); 
		BoardProDto result = boardProService.getDetail(boardProNo);
		
		boardProService.getFileName(result);
		
		request.setAttribute("result", result);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/board/boardProDetail.jsp");
		view.forward(request, response);
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
