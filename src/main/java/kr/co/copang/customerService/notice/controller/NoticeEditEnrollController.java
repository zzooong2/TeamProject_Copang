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

@WebServlet("/notice/editEnroll.do")
public class NoticeEditEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeEditEnrollController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContents = request.getParameter("noticeContents");
		
		NoticeDTO nDTO = new NoticeDTO();
		
		nDTO.setNoticeNo(noticeNo);
		nDTO.setNoticeTitle(noticeTitle);
		nDTO.setNoticeContents(noticeContents);
		
		NoticeServiceImpl noticeService = new NoticeServiceImpl();
		
		int result = noticeService.editEnroll(nDTO); 
		
		if(result == 1) {
			response.sendRedirect("/notice/detail.do?noticeNo=" + noticeNo);
		}
		
	}

}
