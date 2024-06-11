package kr.co.copang.payment.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.payment.model.dto.PaymentDTO;
import kr.co.copang.payment.model.service.PaymentServiceImpl;

@WebServlet("/payment/complete.do")
public class PaymentCompleteController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public PaymentCompleteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int price = Integer.parseInt(request.getParameter("priceArr"));
		String objectTitle = request.getParameter("objectTitle");
		String objectCeller = request.getParameter("objectCeller");
		String orderNumber = generateOrderNumber();
		
		System.out.println("주문금액: " + price);
		System.out.println("주문제품: " + objectTitle);
		System.out.println("판매자명: " + objectCeller);
		System.out.println("주문번호: " + orderNumber);
		
		PaymentDTO pDTO = new PaymentDTO();
		
		pDTO.setObjectPrice(price);
		pDTO.setObjectTitle(objectTitle);
		pDTO.setObjectCeller(objectCeller);
		pDTO.setOrderNo(orderNumber);
		
		PaymentServiceImpl paymentService = new PaymentServiceImpl();
		
		int result = paymentService.payment(pDTO);
		
		if(result == 1) {
			response.getWriter().write("success");
		} else {
			response.getWriter().write("failed");
		}
	}
	
	private static AtomicInteger counter = new AtomicInteger(0);
	private static String generateOrderNumber() {
		// 오늘 날짜 가져오기
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        
        // 001부터 시작하여 순차적으로 증가하는 번호 생성
        int sequenceNumber = counter.incrementAndGet();
        String formattedSequenceNumber = String.format("%03d", sequenceNumber);
        
		return date + formattedSequenceNumber;
	}

}
