package kr.co.copang.boardPro.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.copang.boardPro.model.dto.BoardProDto;
import kr.co.copang.boardPro.model.service.BoardProServiceImpl;

@WebServlet("/BoardPro/Detail.do")
public class BoardProDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardProDetailController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    int boardProNo = 1;
//		int boardProNo = Integer.parseInt(request.getParameter("B_NO"));
	
		BoardProServiceImpl boardProService = new BoardProServiceImpl(); 
		
		ArrayList<BoardProDto> result = boardProService.getDetail(boardProNo);
		
		if(result != null && result.size() >= 5) {
			request.setAttribute("result", result.get(0));
			request.setAttribute("resultS", result.get(1));
			request.setAttribute("resultD", result.get(2));
			request.setAttribute("resultP", result.get(3));
			request.setAttribute("resultF", result.get(4));
		} else {
			request.setAttribute("error", "잘못된 접근입니다.");
		}
		
		ArrayList<BoardProDto> reviewList = boardProService.getReviews(boardProNo);
		
		if(reviewList != null) {
			request.setAttribute("reviewList", reviewList);
		} else {
			request.setAttribute("reviewList", new ArrayList<>());
		}
		
		RequestDispatcher view = request.getRequestDispatcher("/views/board/boardProDetail.jsp");
		view.forward(request, response);
		
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		
		int boardProNo = (int)session.getAttribute("boardNo");
		int userNo = (int)session.getAttribute("userNo");
		
		int starPoint = Integer.parseInt(request.getParameter("starPoint"));
		String reviewContent = request.getParameter("reviewContent");
		
		BoardProDto boardDto = new BoardProDto(); 
		boardDto.setUserNo(userNo);
		boardDto.setBoardProNo(boardProNo);
		boardDto.setReviewStarPoint(starPoint);
		boardDto.setReviewContent(reviewContent);
		
		BoardProServiceImpl boardProService = new BoardProServiceImpl();
		int result = boardProService.BoardReview(boardDto);
		
		
	}

}
