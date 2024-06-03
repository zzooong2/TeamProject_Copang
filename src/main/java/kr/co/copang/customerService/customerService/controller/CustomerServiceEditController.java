package kr.co.copang.customerService.customerService.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.customerService.customerService.model.dto.CustomerServiceDTO;
import kr.co.copang.customerService.customerService.model.service.CustomerServiceImpl;

@WebServlet("/customerService/edit.do")
public class CustomerServiceEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustomerServiceEditController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 데이터 받아와서 변수에 초기화
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		CustomerServiceImpl customerService = new CustomerServiceImpl();	
		
		CustomerServiceDTO result = customerService.edit(boardNo);
		
		request.setAttribute("result", result);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/customerService/customerService/customerServiceEdit.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
