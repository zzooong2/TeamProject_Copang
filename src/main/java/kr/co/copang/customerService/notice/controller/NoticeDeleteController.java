package kr.co.copang.customerService.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.copang.customerService.notice.model.service.NoticeServiceImpl;

@WebServlet("/notice/delete.do")
public class NoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeDeleteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		NoticeServiceImpl noticeService = new NoticeServiceImpl();
		
		int result = noticeService.delete(noticeNo);
		
		if(result == 1) {
			response.sendRedirect("/notice/list.do");
		}
	}

}
