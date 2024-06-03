package kr.co.copang.customerService.customerService.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.customerService.customerService.model.dto.CustomerServiceDTO;
import kr.co.copang.customerService.customerService.model.service.CustomerServiceImpl;

@WebServlet("/customerService/list.do")
public class CustomerServiceListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustomerServiceListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서비스 호출
		CustomerServiceImpl customerService = new CustomerServiceImpl();
		
		// query문 결과 변수에 담기
		ArrayList<CustomerServiceDTO> list = customerService.getList();
		
		// 데이터 바인딩
		request.setAttribute("list", list);

		RequestDispatcher view = request.getRequestDispatcher("/views/customerService/customerService/customerServiceList.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
