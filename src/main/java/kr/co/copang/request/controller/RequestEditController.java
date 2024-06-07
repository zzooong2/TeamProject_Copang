package kr.co.copang.request.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.request.model.dto.RequestDTO;
import kr.co.copang.request.model.service.RequestServiceImpl;

@WebServlet("/request/edit.do")
public class RequestEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RequestEditController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");	
		response.setContentType("text/html; charset=UTF-8");
		
		int requestNo = Integer.parseInt(request.getParameter("rNo"));
		
		RequestServiceImpl requestService = new RequestServiceImpl();
		
		RequestDTO result = requestService.getRequest(requestNo);
		
		request.setAttribute("result", result);
		
		if(result.getRequestNo() == requestNo) {
			response.getWriter().write("success");
		} else {
			response.getWriter().write("failed");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
