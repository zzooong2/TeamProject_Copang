package kr.co.copang.member.controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

@WebServlet("/member/passwordChange.do")
public class PasswordChangeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PasswordChangeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		HttpSession session = request.getSession();
		String userEmail = (String) session.getAttribute("userEmail");		
		
		if (userEmail == null) {
            response.sendRedirect(request.getContextPath() + "/views/member/login.jsp");
        }
		
		MemberServiceImpl memberService = new MemberServiceImpl();
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        System.out.println(currentPassword);
        System.out.println(newPassword);
        System.out.println(confirmPassword);
        
        String pwdPattertn = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-])[a-zA-Z0-9!@#$%^&*()_+=-]{8,16}$";
        Pattern pwdPattern = Pattern.compile(pwdPattertn);
        Matcher pwdMatcher = pwdPattern.matcher(newPassword);
		
        MemberDto member = memberService.login(userEmail);
        // 현재 비밀번호 확인
        if (member == null || !BCrypt.checkpw(currentPassword, member.getUserPwd())) {
        	request.setAttribute("pwdStatus", "false");
        	request.setAttribute("status", "password");
            RequestDispatcher view = request.getRequestDispatcher("/views/member/myPage.jsp");
            view.forward(request, response);
            return;
        }
        // 비밀번호 비교
        if (!newPassword.equals(confirmPassword)) {
        	request.setAttribute("newPwdStatus", "false");
        	request.setAttribute("status", "password");
            RequestDispatcher view = request.getRequestDispatcher("/views/member/myPage.jsp");
            view.forward(request, response);
            return;
        }
        // 비밀번호 유효성 검사
        if (!pwdMatcher.matches()) {
        	request.setAttribute("pwdValidation", "false");
        	request.setAttribute("status", "password");
            RequestDispatcher view = request.getRequestDispatcher("/views/member/myPage.jsp");
            view.forward(request, response);
            return;
        }

        // 비밀번호 변경
        int result = memberService.updatePwd(userEmail, newPassword);
        if (result > 0) {
        	request.setAttribute("pwdChange", "true");
        	session.invalidate(); // 세션 무효화
            RequestDispatcher view = request.getRequestDispatcher("/views/member/myPage.jsp");
            view.forward(request, response);
        } else {
        	request.setAttribute("pwdChange", "false");
            RequestDispatcher view = request.getRequestDispatcher("/views/member/myPage.jsp");
            view.forward(request, response);
        }
		
	}	
}
