package kr.co.copang.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import kr.co.copang.member.model.dto.MemberDto;
import kr.co.copang.member.model.service.MemberServiceImpl;

@WebServlet("/member/userDelete.do")
public class UserDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserDeleteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 	MemberServiceImpl memberService = new MemberServiceImpl();
	        HttpSession session = request.getSession();
	        
	        // 로그인된 사용자 정보 가져오기
	        MemberDto loggedInUser = (MemberDto) session.getAttribute("loggedInUser");
	        
	        if (loggedInUser == null) {
	            // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
	            response.sendRedirect(request.getContextPath() + "/views/member/login.jsp");
	            return;
	        }
	        
	        String password = request.getParameter("password");
	        String userEmail = loggedInUser.getUserEmail();
	        
	        // 비밀번호 확인
	        if (BCrypt.checkpw(password, loggedInUser.getUserPwd())) {
	            int result = memberService.userDelete(userEmail, password);
	            if (result > 0) {
	                // 탈퇴 성공 시 세션 무효화 및 메시지 전달
	                session.invalidate();
	                request.setAttribute("passwordStatus", "true");
	                RequestDispatcher dispatcher = request.getRequestDispatcher("/views/member/myPage.jsp");
	                dispatcher.forward(request, response);
	            } else {
	                // 탈퇴 실패 시 메시지 전달
	            	request.setAttribute("errorSection", "error");
	            	request.setAttribute("deleteError", "false");
	            	request.getRequestDispatcher("/views/member/myPage.jsp").forward(request, response);
	            }
	        } else {
	            // 비밀번호가 일치하지 않는 경우
	        	request.setAttribute("errorSection", "error");
	        	request.setAttribute("passwordStatus", "false");
	    		request.getRequestDispatcher("/views/member/myPage.jsp").forward(request, response);
	        }
	    }
	}
