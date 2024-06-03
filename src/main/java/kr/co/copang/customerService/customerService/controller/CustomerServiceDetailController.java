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

@WebServlet("/customerService/detail.do")
public class CustomerServiceDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustomerServiceDetailController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		// 서비스 호출
		CustomerServiceImpl customerService = new CustomerServiceImpl();
		
		// 쿼리문 실행결과 result 변수에 초기화
		CustomerServiceDTO result = customerService.getDetail(boardNo);
		
		// 데이터바인딩
		request.setAttribute("result", result);
		
		// 게시글 번호를 이용하여 게시글 상세조회
		RequestDispatcher view = request.getRequestDispatcher("/views/customerService/customerService/customerServiceDetail.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
