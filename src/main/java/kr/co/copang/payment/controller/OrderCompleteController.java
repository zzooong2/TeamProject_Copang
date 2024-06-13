package kr.co.copang.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.copang.payment.model.dto.BoardDTO;

@WebServlet("/payment/completeOrder.do")
public class OrderCompleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderCompleteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		
		int userNo = (int)session.getAttribute("userNo");
		int price = Integer.parseInt(request.getParameter("price"));
		int objectNo = Integer.parseInt(request.getParameter("objectNo"));
		String objectTitle = request.getParameter("objectTitle");
		
		System.out.println("objectNo: " + objectNo);
		
		BoardDTO bDTO = new BoardDTO();
		
		bDTO.setUserNo(userNo);
		bDTO.setBusinessPay(price);
		bDTO.setBoardTitle(objectTitle);
		bDTO.setBoardNo(objectNo);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
