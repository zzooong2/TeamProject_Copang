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
		
        MemberDto member = memberService.login(email);
		
     // 로그인 시도한 이메일과 일치하는 회원이 없는 경우
        if (member == null) {
            // 로그인 실패 메시지를 request에 저장하여 전달
            request.setAttribute("loginError", "이메일 또는 비밀번호가 올바르지 않습니다.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/member/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // 사용자가 입력한 비밀번호와 데이터베이스에서 조회한 암호화된 비밀번호를 비교
        if (BCrypt.checkpw(password, member.getUserPwd())) {
            HttpSession session = request.getSession();
            session.setAttribute("userName", member.getUserName());
            session.setAttribute("partName", member.getUsertype());
            session.setAttribute("userNo", member.getUserNo());
            session.setAttribute("partCode", member.getPartCode());

            // 로그인 성공 시 메인 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            // 비밀번호가 일치하지 않는 경우
            // 로그인 실패 메시지를 request에 저장하여 전달
            request.setAttribute("loginError", "이메일 또는 비밀번호가 올바르지 않습니다.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/member/login.jsp");
            dispatcher.forward(request, response);
        }
    }
}