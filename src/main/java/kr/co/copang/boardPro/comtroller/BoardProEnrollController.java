package kr.co.copang.boardPro.comtroller;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.co.copang.boardPro.model.dto.BoardProDto;

@WebServlet("/BoardProEnrollController")
public class BoardProEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardProEnrollController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		String title = request.getParameter("detailTitle");
		String seondTitle = request.getParameter("secondTitle");
		String content = request.getParameter("detailContents");
		
		// 어떤 사용자가 글작성 요청을 했는지 확인
		HttpSession session = request.getSession();
		int memberNo = (int)session.getAttribute("userNo");
	
		BoardProDto boardDto = new BoardProDto(); 
		boardDto.setBoardProTitle(title);
		boardDto.setBoardProSecondTitle(seondTitle);
		boardDto.setBoardProContents(content);
		
		Collection<Part> parts = request.getParts();
		String uploadDirectory = "C:\\dev\\work-space\\SemiProject\\SemiProject\\src\\main\\webapp\\resources\\upload";
		
		File filePath = new File(uploadDirectory);
		if(!filePath.exists() ) {
			filePath.mkdirs();
		}
		
		String fileName = null;
		
		
		
		
		
		
		
		
		
		
		
	
	}

}
