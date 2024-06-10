package kr.co.copang.customerService.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.copang.customerService.notice.model.dto.NoticeDTO;
import kr.co.copang.customerService.notice.model.service.NoticeServiceImpl;

@WebServlet("/notice/enroll.do")
public class NoticeEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeEnrollController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 데이터 받아서 변수에 저장
		HttpSession session = request.getSession();
		
		int userNo = (int)session.getAttribute("userNo");
		String noticeTitle = request.getParameter("notice-title");
		String noticeContents = request.getParameter("notice-contents");
		
		// DTO 정보 저장
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setUserNo(userNo);
		nDTO.setNoticeTitle(noticeTitle);
		nDTO.setNoticeContents(noticeContents);
		
		// 서비스 호출
		NoticeServiceImpl noticeService = new NoticeServiceImpl();
		
		int result = noticeService.enroll(nDTO);
		
		System.out.println(result);
		
		if(result == 1) {
			response.sendRedirect("/notice/list.do?cPage=1&category=N_TITLE&search-text=");
		} else {
			RequestDispatcher view = request.getRequestDispatcher("/views/customerService/notice/noitceEnroll.jsp");
			view.forward(request, response);
		}
	}

}
