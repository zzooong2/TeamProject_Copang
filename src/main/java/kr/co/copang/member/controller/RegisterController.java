package kr.co.copang.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.member.model.dto.MemberDto;
import kr.co.copang.member.model.service.MemberService;
import kr.co.copang.member.model.service.MemberServiceImpl;

@WebServlet("/member/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService;
       
    public RegisterController() {
        super();
        memberService = new MemberServiceImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String userName = request.getParameter("user_name");
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmpwd = request.getParameter("confirm_password");
        String phone = request.getParameter("phone");
        String[] businessFields = request.getParameterValues("businessField[]");
        String userType = request.getParameter("user_type");
        
        // 동의 여부 확인
        String over14 = request.getParameter("over_14");
        String termsOfService = request.getParameter("terms_of_service");
        String privacyPolicy = request.getParameter("privacy_policy");
        String marketing = request.getParameter("marketing");
        
        // Create MemberDto object
        MemberDto member = new MemberDto();
        member.setUserName(userName);
        member.setUserEmail(email);
        member.setUserPwd(password);
        member.setConfirmPwd(confirmpwd);
        member.setUserPhone(phone);
        member.setPartCode(userType.equals("전문가") ? 2 : 1); // 전문가 = 2, 의뢰자 = 1
        member.setFyoConsent(over14);
        member.setsConsent(termsOfService);
        member.setPiConsent(privacyPolicy);
        member.setPosConsent(marketing);
        
		/*
		 * member("on".equals(over14) ? "Y" : "N");
		 * member.setTermsOfService("on".equals(termsOfService) ? "Y" : "N");
		 * member.setPrivacyPolicy("on".equals(privacyPolicy) ? "Y" : "N");
		 * member.setMarketing("on".equals(marketing) ? "Y" : "N");
		 */
        
        int result = memberService.register(member, businessFields);
        
        if(result == 1) {
    		RequestDispatcher view = request.getRequestDispatcher("/views/member/login.jsp");
    		view.forward(request, response);
    	} else {
    		RequestDispatcher view = request.getRequestDispatcher("/views/member/register.jsp");
    		view.forward(request, response);
    	}
	}

}
