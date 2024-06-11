package kr.co.copang.member.controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.copang.member.model.service.MemberServiceImpl;

@WebServlet("/member/changePwd.do")
public class ChangePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangePwdController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		
		// 사용자가 입력한 새로운 비밀번호
        String newPassword = request.getParameter("password");
        // 세션에 저장된 사용자 이메일 가져오기
        String userEmail = (String) session.getAttribute("userEmail");
        
        String pwdPattertn = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-])[a-zA-Z0-9!@#$%^&*()_+=-]{8,16}$";
        Pattern pwdPattern = Pattern.compile(pwdPattertn);
        Matcher pwdMatcher = pwdPattern.matcher(newPassword);
        
        if(!pwdMatcher.matches()) {
        	response.getWriter().write("invalid"); // 유효하지 않은 비밀번호 형식
        	return;
        } 
		
        
     // MemberServiceImpl 객체 생성
        MemberServiceImpl memberService = new MemberServiceImpl();
        // 비밀번호 변경 메서드 호출
        int result = memberService.updatePwd(userEmail, newPassword);
        
        System.out.println(result);
        	
        	if (result > 0) {
        		response.getWriter().write("success");
        	} else {
        		response.getWriter().write("failure");
        	}
        
	}	
}
