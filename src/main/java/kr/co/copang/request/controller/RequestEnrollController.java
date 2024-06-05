package kr.co.copang.request.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.request.model.dto.RequestDTO;
import kr.co.copang.request.model.service.RequestServiceImpl;

@WebServlet("/request/enroll.do")
public class RequestEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RequestEnrollController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String requestTitle = request.getParameter("request-title");
		String requestContents = request.getParameter("request-contents");
		
		RequestDTO rDTO = new RequestDTO();
		
		rDTO.setRequestTitle(requestTitle);
		rDTO.setRequestContents(requestContents);
		
		RequestServiceImpl requestService = new RequestServiceImpl();
		
		int result = requestService.enroll(rDTO);
		
		request.setAttribute("result", result);
		
		if(result == 1) {
			response.getWriter().write("success");
		} else { 
			response.getWriter().write("failed");
		}
	}

}
