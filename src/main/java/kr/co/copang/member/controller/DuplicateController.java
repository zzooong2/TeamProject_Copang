package kr.co.copang.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.member.model.service.MemberServiceImpl;

@WebServlet("/member/duplicateId.do")
public class DuplicateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DuplicateController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	request.setCharacterEncoding("UTF-8");
	
	String email = request.getParameter("email");
	MemberServiceImpl memberService = new MemberServiceImpl();
	int duplicateCheck = memberService.duplicateId(email);
	
	if(duplicateCheck == 1) {  // 중복
		response.getWriter().write("unavailable");
	} else {   // 중복 X
		response.getWriter().write("available");
		
	}
	
	
	}

}
