package kr.co.copang.customerService.customerService.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.customerService.customerService.model.dto.CustomerServiceDTO;
import kr.co.copang.customerService.customerService.model.service.CustomerServiceImpl;

@WebServlet("/customerService/editEnroll.do")
public class CustomerServiceEditEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustomerServiceEditEnrollController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String boardTitle = request.getParameter("boardTitle");
		String boardContents = request.getParameter("boardContents");
		
		System.out.println(boardNo);
		System.out.println(boardTitle);
		System.out.println(boardContents);
		
		CustomerServiceDTO csDTO = new CustomerServiceDTO();
		
		CustomerServiceImpl customerService = new CustomerServiceImpl();
		
		int result = customerService.editEnroll(csDTO);
		
		if(result == 1) {
			response.sendRedirect("/customerService/detail.do?boardNo=" + boardNo);
		}
	}

}
