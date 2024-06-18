package kr.co.copang.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.copang.member.model.service.MemberService;
import kr.co.copang.member.model.service.MemberServiceImpl;

@WebServlet("/member/phoneChange.do")
public class PhoneChangeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService;
       
    public PhoneChangeController() {
        super();
        memberService = new MemberServiceImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
    }
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 사용자의 이름과 이메일, 새로운 핸드폰 번호를 파라미터로 받아옵니다.
				String userName = request.getParameter("name");
				String email = request.getParameter("email");
				String newPhone = request.getParameter("newPhone");
				
				 String userInputCode = request.getParameter("verificationCode");
			     String sessionCode = (String) request.getSession().getAttribute("verificationCode");

				// 핸드폰 번호를 변경합니다.
				int result = memberService.updatePhone(userName, email, newPhone);
				
				if (sessionCode == null || !sessionCode.toString().equals(userInputCode)) {
		            response.getWriter().write("<script> { history.back();}</script>");
		        } 

				if (result > 0) {
					// 변경이 성공한 경우
					
					HttpSession session = request.getSession();
					session.setAttribute("userPhone", newPhone);
					request.setAttribute("phoneStatus", "true");
					RequestDispatcher view = request.getRequestDispatcher("/views/member/myPage.jsp");
	                view.forward(request, response);
				} else {
					
					// 변경이 실패한 경우
					request.setAttribute("phoneStatus", "false");
					RequestDispatcher view = request.getRequestDispatcher("/views/member/myPage.jsp");
	                view.forward(request, response);
				}

			}
		}
