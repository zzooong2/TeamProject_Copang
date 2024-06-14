package kr.co.copang.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.copang.member.model.dto.MemberDto;
import kr.co.copang.member.model.service.MemberService;
import kr.co.copang.member.model.service.MemberServiceImpl;

@WebServlet("/member/paymentCheck.do")
public class PaymentCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService;
       
    public PaymentCheckController() {
        super();
        memberService = new MemberServiceImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("PaymentCheckController 호출됨");
		HttpSession session = request.getSession();
		MemberDto loggedInUser = (MemberDto) session.getAttribute("loggedInUser");
		System.out.println(loggedInUser);

		if (loggedInUser == null) {
			System.out.println("로그인 사용자 없음");
			response.sendRedirect("/views/member/login.jsp"); // 로그인 페이지로 리다이렉션
			return;
		}

		int userNo = loggedInUser.getUserNo();
		System.out.println("로그인한 사용자 번호: " + userNo);
		 
		 List<MemberDto> payments = memberService.getPaymentsByUserNo(userNo);
		// 결제 내역 로그로 확인
		 System.out.println("결제 내역 조회 결과: " + payments);
		request.setAttribute("payments", payments);
		
		// 세션에 activeSection 값을 설정
		session.setAttribute("activeSection", "payment");
		request.getRequestDispatcher("/views/member/myPage.jsp").forward(request, response); // 결제 내역을 보여주는 JSP 페이지로 포워드
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
