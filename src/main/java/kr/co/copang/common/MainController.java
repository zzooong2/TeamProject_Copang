package kr.co.copang.common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.copang.member.model.dto.MemberDto;
import kr.co.copang.member.model.service.MemberServiceImpl;

@WebServlet("")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberServiceImpl memberService;
       
    public MainController() {
        super();
        memberService = new MemberServiceImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 자동 로그인 처리
        HttpSession session = request.getSession();
        
        
        // 이미 로그인 시도를 한 경우 처리
        Boolean loginAttempted = (Boolean) session.getAttribute("loginAttempted");
        if (loginAttempted != null && loginAttempted) {
            // 이미 시도했다면 index.jsp로 바로 포워딩
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
            return;
        }
        
        // 로그인 시도 플래그 설정
        session.setAttribute("loginAttempted", true);
        
        
        
        
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("autoLogin")) {
                    String email = cookie.getValue();
                    System.out.println("쿠키에서 가져온 이메일: " + email);
                    
                    MemberDto member = memberService.login(email);
                    if (member != null) {
                    	System.out.println("자동 로그인 성공: " + member);
                        session.setAttribute("userName", member.getUserName());
                        session.setAttribute("userEmail", member.getUserEmail());
                        session.setAttribute("userPhone", member.getUserPhone());
                        session.setAttribute("userNo", member.getUserNo());
                        session.setAttribute("partCode", member.getPartCode());
                        session.setAttribute("loggedInUser", member); // 여기서 "loggedInUser"는 세션에 저장될 사용자 객체의 이름입니다.
                        response.sendRedirect(request.getContextPath() + "/");
                        return;
                    } else {
                        System.out.println("자동 로그인 실패: 이메일에 해당하는 사용자 없음");
                    }
                }
            }
        } else {
            System.out.println("쿠키가 없습니다.");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
