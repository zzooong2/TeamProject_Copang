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

@WebServlet("/member/searchId.do")
public class SearchIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService;
       
    public SearchIdController() {
        super();
        memberService = new MemberServiceImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 폼에서 전송된 이름과 핸드폰번호를 가져옵니다.
        String userName = request.getParameter("userName");
        String userPhone = request.getParameter("userPhone");

        String userInputCode = request.getParameter("verificationCode");
        String sessionCode = (String) request.getSession().getAttribute("verificationCode");
        
        
        if (sessionCode == null || !sessionCode.toString().equals(userInputCode)) {
            response.getWriter().write("<script> { history.back();}</script>");
            return;
        }

        // 서비스를 통해 아이디를 검색합니다.
        MemberDto foundMember = memberService.searchId(userName, userPhone);

        // 결과를 팝업창으로 전달합니다.
        if (foundMember != null) {
            // 일치하는 정보가 있는 경우
            String userEmail = foundMember.getUserEmail();
            request.setAttribute("userEmail", userEmail);
            request.setAttribute("alertStatus", "true");
            
            RequestDispatcher view = request.getRequestDispatcher("/views/member/searchPage.jsp");
            view.forward(request, response);
			
        } else {
            // 일치하는 정보가 없는 경우
            request.setAttribute("alertStatus", "false");
            RequestDispatcher view = request.getRequestDispatcher("/views/member/searchPage.jsp");
            view.forward(request, response);
        }
    }
	
	
}