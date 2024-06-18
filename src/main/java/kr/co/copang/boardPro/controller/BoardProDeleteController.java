package kr.co.copang.boardPro.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.boardPro.model.service.BoardProServiceImpl;

@WebServlet("/boardPro/delete.do")
public class BoardProDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardProDeleteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int boardProNo = Integer.parseInt(request.getParameter("boardProNo"));
		
		System.out.println(boardProNo);
		
		BoardProServiceImpl boardProService = new BoardProServiceImpl();
		
		String type = boardProService.getMainCategory(boardProNo);
		
		System.out.println("Controller : " + type);
		
		int BMresult = boardProService.setBMDelete(boardProNo);
		int Uresult = boardProService.setUDelete(boardProNo);
		int CBRresult = boardProService.setCBRDelete(boardProNo);
		int RBresult = boardProService.setRBDelete(boardProNo);
		int CBresult = boardProService.setCBDelete(boardProNo);
		
		
		System.out.println("1. BUSINESS_MENU : " + BMresult);
		System.out.println("2. UPLOAD : " + Uresult);
		System.out.println("3. CATEGORY_BOARD_REVIEW : " + CBRresult);
		System.out.println("4. REQUEST_BOARD : " + RBresult);
		System.out.println("5. CATEGORY_BOARD : " + CBresult);
		
		
		
		if(BMresult == 1 && Uresult >= 1 && CBresult == 1) {
			System.out.println("파일 삭제가 정상적으로 동작했습니다.");
			response.sendRedirect("/category/list.do?type="+type+"&middleCategory=&subCategory=&cPage=1");
			
		} else {
			System.out.println("파일이 삭제되지 않았습니다.");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
	}

}










