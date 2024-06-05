package kr.co.copang.customerService.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.customerService.notice.model.dto.NoticeDTO;
import kr.co.copang.customerService.notice.model.service.NoticeServiceImpl;

@WebServlet("/notice/detail.do")
public class NoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeDetailController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		NoticeServiceImpl noticeService = new NoticeServiceImpl();
		
		NoticeDTO result = noticeService.getDetail(noticeNo);
		
		request.setAttribute("result", result);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/customerService/notice/noticeDetail.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
