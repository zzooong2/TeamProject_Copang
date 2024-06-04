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
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String userName = request.getParameter("user_name");
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmpwd = request.getParameter("confirm_password");
        String phone = request.getParameter("phone");
        String[] businessFields = request.getParameterValues("business_field");
        String userType = request.getParameter("user_type");
        String duplicateCheck = request.getParameter("duplicateCheck");
        
        
        if ("unavailable".equals(duplicateCheck)) {
        	request.setAttribute("errorMessage", "중복된 이메일입니다. 다른 이메일을 입력해주세요.");
        	
			/* response.sendRedirect("/form/registerForm.do"); */
        	RequestDispatcher view = request.getRequestDispatcher("/views/member/register.jsp");
            view.forward(request, response);
        	return;
        }
        
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
        member.setFyoConsent("on".equals(over14) ? "Y" : "N");
        member.setsConsent("on".equals(termsOfService) ? "Y" : "N");
        member.setPiConsent("on".equals(privacyPolicy) ? "Y" : "N");
        member.setPosConsent("on".equals(marketing) ? "Y" : "N");
        
     // 필수 동의 항목 체크
        if (!"Y".equals(member.getFyoConsent()) || !"Y".equals(member.getsConsent()) || !"Y".equals(member.getPiConsent())) {
            request.setAttribute("errorMessage", "필수 동의 항목에 동의해야 합니다.");
            RequestDispatcher view = request.getRequestDispatcher("/views/member/register.jsp");
            view.forward(request, response);
            return;
        }
        
        int result = memberService.register(member, businessFields);
        
        if(result == 1) {
    		RequestDispatcher view = request.getRequestDispatcher("/views/member/login.jsp");
    		view.forward(request, response);
    	} else {
            request.setAttribute("errorMessage", "회원 등록에 실패했습니다.");
    		RequestDispatcher view = request.getRequestDispatcher("/form/registerForm.do/#");
    		view.forward(request, response);
    	}
	}

}
