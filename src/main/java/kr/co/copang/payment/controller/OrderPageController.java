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

@WebServlet("/payment/orderPage.do")
public class OrderPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderPageController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		int userNo = (int)session.getAttribute("userNo");
		int boardProNo = Integer.parseInt(request.getParameter("boardProNo"));
		String objectTitle = request.getParameter("objectTitle");
		int objectPrice = Integer.parseInt(request.getParameter("objectPrice"));
		String objectType = request.getParameter("objectType");
		String fileName = request.getParameter("fileName");

		System.out.println("------------OrderPageController-------------");
		System.out.println("userNo: " + userNo);
		System.out.println("boardProNo: " + boardProNo);
		System.out.println("objectTitle: " + objectTitle);
		System.out.println("objectPrice: " + objectPrice);
		System.out.println("objectType: " + objectType);
		System.out.println("fileName: " + fileName);
		System.out.println("--------------------------------------------");
		
		BoardDTO bDTO = new BoardDTO();
		
		bDTO.setBoardNo(boardProNo);
		bDTO.setBoardTitle(objectTitle);
		bDTO.setBusinessPay(objectPrice);
		bDTO.setBusinessType(objectType);
		bDTO.setFileName(fileName);
		bDTO.setUserNo(userNo);
		
		PaymentServiceImpl paymentService = new PaymentServiceImpl();
		
		BoardDTO result = paymentService.getDetail(bDTO);
		result.setBoardNo(boardProNo);
		result.setBoardTitle(objectTitle);
		result.setBusinessPay(objectPrice);
		result.setBusinessType(objectType);
		result.setFileName(fileName);
		result.setUserNo(userNo);
		
		request.setAttribute("result", result);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/payment/payment.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
