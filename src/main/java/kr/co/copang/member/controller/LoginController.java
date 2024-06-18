package kr.co.copang.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
		
		MemberServiceImpl memberService = new MemberServiceImpl();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String rememberMe = request.getParameter("remember_me");
		
		System.out.println("로그인 시도: " + email);
		
        MemberDto member = memberService.login(email);
		
     // 로그인 시도한 이메일과 일치하는 회원이 없는 경우
        if (member == null) {
        	returnAlert(response, "아이디 또는 비밀번호가 틀렸습니다.", "/views/member/login.jsp");
            return;
        }

        // 사용자가 입력한 비밀번호와 데이터베이스에서 조회한 암호화된 비밀번호를 비교
        if (BCrypt.checkpw(password, member.getUserPwd())) {
            HttpSession session = request.getSession();
            session.setAttribute("userName", member.getUserName());
            session.setAttribute("userEmail", member.getUserEmail());
            session.setAttribute("userPhone", member.getUserPhone());
            session.setAttribute("userNo", member.getUserNo());
            session.setAttribute("partCode", member.getPartCode());
            session.setAttribute("loggedInUser", member); // 여기서 "loggedInUser"는 세션에 저장될 사용자 객체의 이름입니다.
            
            // "로그인 상태 유지" 체크박스를 선택한 경우 쿠키에 이메일 저장
            if ("on".equals(rememberMe)) {
                Cookie cookie = new Cookie("autoLogin", email);
                cookie.setMaxAge(60 * 60 * 24 * 7); // 쿠키 유효 기간 7일
                cookie.setPath("/"); // 경로 설정
                response.addCookie(cookie);
                System.out.println("자동 로그인 쿠키 설정: " + cookie.getValue());
            }
            
            // 로그인 성공 시 메인 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/");
            
        } else {
            // 비밀번호가 일치하지 않는 경우
        	returnAlert(response, "아이디 또는 비밀번호가 틀렸습니다.", "/views/member/login.jsp");
            return;
        }
    }
	
	
	private void returnAlert(HttpServletResponse response, String msg, String location) throws IOException {
        response.getWriter().write("<script>"
                + "alert('" + msg + "');"
                + "location.href='" + location + "';"
                + "</script>");
    }
}