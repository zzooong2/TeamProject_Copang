package kr.co.copang.request.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		// 로그인 기능 구현시 session 에 담겨있는 userNo 를 이용해서 변수 초기화
		HttpSession session = request.getSession();
		
		int userNo = (int)session.getAttribute("userNo");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String requestTitle = request.getParameter("title"); // ajax 로직에 데이터 던지는 key 값으로 받아올것
		String requestContents = request.getParameter("contents");
		
		RequestDTO rDTO = new RequestDTO();
		
		rDTO.setUserNo(userNo);
		rDTO.setRequestTitle(requestTitle);
		rDTO.setRequestContents(requestContents);
		rDTO.setBoardNo(boardNo);
		
		RequestServiceImpl requestService = new RequestServiceImpl();
		
		int result = requestService.enroll(rDTO);
		
		RequestDTO requestBoard = requestService.getRequestNo(userNo);
		
		request.setAttribute("result", result);
		request.setAttribute("requestBoard", requestBoard);
		
		if(result == 1) {
			response.getWriter().write("success," + requestBoard.getRequestNo());
		} else { 
			response.getWriter().write("failed,");
		}
	}

}
