package kr.co.copang.payment.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		int objectNo = Integer.parseInt(request.getParameter("objectNo"));
		String objectTitle = request.getParameter("objectTitle");
		String orderNumber = generateOrderNumber();
		
		HttpSession session = request.getSession();
		
		int userNo = (int)session.getAttribute("userNo");
		
		System.out.println("------------PaymentCompleteController-------------");
		System.out.println("회원번호: " + userNo);
		System.out.println("주문금액: " + price);
		System.out.println("주문제품: " + objectTitle);
		System.out.println("주문번호: " + orderNumber);
		System.out.println("--------------------------------------------------");
		
		PaymentDTO pDTO = new PaymentDTO();
		
		pDTO.setUserNo(userNo);
		pDTO.setObjectPrice(price);
		pDTO.setObjectNo(objectNo);
		pDTO.setObjectTitle(objectTitle);
		pDTO.setOrderNo(orderNumber);
		
		request.setAttribute("pDTO", pDTO);
		
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
