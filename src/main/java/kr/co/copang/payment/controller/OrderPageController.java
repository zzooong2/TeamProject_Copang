package kr.co.copang.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.payment.model.dto.BoardDTO;
import kr.co.copang.payment.model.service.PaymentServiceImpl;

@WebServlet("/payment/orderPage.do")
public class OrderPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderPageController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int boardProNo = Integer.parseInt(request.getParameter("boardProNo"));
		int boardNo = 12;
		String businessType = request.getParameter("rightTabMenu01");
		
		BoardDTO bDTO = new BoardDTO();
		
		bDTO.setBoardNo(boardNo);
		bDTO.setBusinessType(businessType);
		
		System.out.println(businessType);
		
		PaymentServiceImpl paymentService = new PaymentServiceImpl();
		
		BoardDTO result = paymentService.getDetail(bDTO);
		
		request.setAttribute("result", result);
		response.sendRedirect("/views/payment/payment.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
