package kr.co.copang.member.controller;

import java.io.IOException;
import java.util.Objects;

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

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberServiceImpl memberService = new MemberServiceImpl();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		MemberDto member = new MemberDto();
		member.setUserEmail(email);
		member.setUserPwd(password);
		
		// 암호화된 패스워드 조회
		MemberDto hashPassword = memberService.login(email);
		
		if(BCrypt.checkpw(password, hashPassword.getUserPwd())) {
			
			if(Objects.isNull(hashPassword.getUserPwd())) {
				response.sendRedirect("/views/common/error.jsp"); // 로그인 실패
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("userName", hashPassword.getUserName());
				session.setAttribute("partName", hashPassword.getUsertype());
				session.setAttribute("userNo", hashPassword.getUserNo());
				session.setAttribute("partCode", hashPassword.getPartCode());
				
				RequestDispatcher view = request.getRequestDispatcher("/");
				view.forward(request, response);
			}
			
			
		}
	}

}
