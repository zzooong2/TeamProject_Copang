package kr.co.copang.customerService.customerService.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.customerService.customerService.model.service.CustomerServiceImpl;

@WebServlet("/customerService/delete.do")
public class CustomerServiceDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CustomerServiceDeleteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		CustomerServiceImpl customerService = new CustomerServiceImpl();
		
		int result = customerService.delete(boardNo);
		
		if(result == 1) { 
			response.sendRedirect("/customerService/list.do?cPage=1&category=Q_TITLE&search-text=");
		}
	}

}
