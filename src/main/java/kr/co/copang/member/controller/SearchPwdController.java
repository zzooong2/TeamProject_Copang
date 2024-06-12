package kr.co.copang.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.copang.member.model.dto.MemberDto;
import kr.co.copang.member.model.service.MemberServiceImpl;

@WebServlet("/member/searchPwd.do")
public class SearchPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchPwdController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		MemberServiceImpl memberService = new MemberServiceImpl();
		
		String userEmail = request.getParameter("userEmail");
		String userPhone = request.getParameter("userPhone");
		
		String userInputCode = request.getParameter("verificationCode");
        String sessionCode = (String) request.getSession().getAttribute("verificationCode");
		
        MemberDto member = memberService.searchPwd(userEmail, userPhone);
        
        if (sessionCode == null || !sessionCode.toString().equals(userInputCode)) {
            response.getWriter().write("<script> history.back();</script>");
            return;
        }
        
     // 세션에 저장된 인증 코드와 사용자가 입력한 코드가 일치하는지 확인
        
        	
            if (member != null) {
            	request.setAttribute("passwordStatus", "true");
            	HttpSession session = request.getSession();
            	session.setAttribute("userEmail", userEmail);
            	RequestDispatcher view = request.getRequestDispatcher("/views/member/searchPwd.jsp");
                view.forward(request, response);
                
            } else {
            	request.setAttribute("passwordStatus", "false");
            	RequestDispatcher view = request.getRequestDispatcher("/views/member/searchPage.jsp");
                view.forward(request, response);
            }
        

    }

}
