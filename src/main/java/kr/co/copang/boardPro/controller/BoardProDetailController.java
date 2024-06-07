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

@WebServlet("/BoardPro/Detail.do")
public class BoardProDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardProDetailController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    // 기본값으로 설정할 게시물 번호
	    int defaultBoardProNo = 85;
	    
	    // 요청에서 B_NO 파라미터 가져오기, 없을 경우 기본값 사용
	    int boardProNo;
	    String boardProNoParam = request.getParameter("B_NO");
	    if (boardProNoParam != null && !boardProNoParam.isEmpty()) {
	        boardProNo = Integer.parseInt(boardProNoParam);
	    } else {
	        boardProNo = defaultBoardProNo;
	    }
		
//		int boardProNo = Integer.parseInt(request.getParameter("B_NO"));
	
		BoardProServiceImpl boardProService = new BoardProServiceImpl(); 
		
		ArrayList<BoardProDto> result = boardProService.getDetail(boardProNo);
		
		request.setAttribute("result", result.get(0));
		request.setAttribute("resultS", result.get(1));
		request.setAttribute("resultD", result.get(2));
		request.setAttribute("resultP", result.get(3));
		request.setAttribute("resultF", result.get(4));
		
		RequestDispatcher view = request.getRequestDispatcher("/views/board/boardProDetail.jsp");
		view.forward(request, response);
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
