package kr.co.copang.common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/form/*")
public class FormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FormController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html; charset=utf-8");
		
		String action = request.getPathInfo();
		String nextPage = "";
		
		if(action.equals("/enrollForm.do")) {
			nextPage = "/views/board/boardProEnroll.jsp";
		} else if(action.equals("/customerServiceEnrollForm.do")) {
			nextPage = "/views/customerService/customerService/customerServiceEnroll.jsp"; // Q&A 작성
		} else if (action.equals("/customerServiceListForm.do")){
			nextPage = "/views/customerService/customerService/customerServiceList.jsp"; // Q&A 목록
		}
		
		
		
		if(nextPage != null && !nextPage.isEmpty()) {
			RequestDispatcher view = request.getRequestDispatcher(nextPage);
			view.forward(request, response);
		} else {
			response.sendRedirect("/views/error.jsp");
		}
		
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

}
