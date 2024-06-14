package kr.co.copang.payment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.copang.payment.model.dto.BoardDTO;
import kr.co.copang.payment.model.service.PaymentServiceImpl;

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
		
		BoardDTO bDTO = new BoardDTO();
		
		bDTO.setUserNo(userNo);
		bDTO.setBoardNo(objectNo);
		bDTO.setBusinessPay(price);
		bDTO.setBoardTitle(objectTitle);
		
		PaymentServiceImpl paymentService = new PaymentServiceImpl();
		
		BoardDTO result = paymentService.getPaymentInfo(objectNo, userNo);
		
		System.out.println("------------OrderCompleteController-------------");
		System.out.println("userNo: " + userNo);
		System.out.println("price: " + price);
		System.out.println("objectNo: " + objectNo);
		System.out.println("objectTitle: " + objectTitle);
		System.out.println("------------------------------------------------");
		System.out.println("boardNo: " + result.getBoardNo());
		System.out.println("boardTitle: " + result.getBoardTitle());
		System.out.println("orderNo: " + result.getOrderNo());
		System.out.println("orderIndate: " + result.getOrderIndate());
		System.out.println("------------------------------------------------");
		System.out.println("getBusinessPay: " + result.getBusinessPay());
		System.out.println("getFileName: " + result.getFileName());
		System.out.println("------------------------------------------------");
		
		request.setAttribute("result", result);
		RequestDispatcher view = request.getRequestDispatcher("/views/payment/completeOrder.jsp");
		
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
