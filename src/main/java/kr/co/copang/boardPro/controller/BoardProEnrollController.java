package kr.co.copang.boardPro.controller;

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
import kr.co.copang.boardPro.model.service.BoardProServiceImpl;

@WebServlet("/BoardPro/enroll.do")
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
		
		String bs = request.getParameter("business_type_standard");
		int sf = Integer.parseInt(request.getParameter("standard_function"));
		int sw = Integer.parseInt(request.getParameter("standard_workDate"));
		int sr = Integer.parseInt(request.getParameter("standard_retouch"));
		int sp = Integer.parseInt(request.getParameter("standard_pay"));
		
		String bd = request.getParameter("business_type_deluxe");
		int df = Integer.parseInt(request.getParameter("deluxe_function"));
		int dw = Integer.parseInt(request.getParameter("deluxe_workDate"));
		int dr = Integer.parseInt(request.getParameter("deluxe_retouch"));
		int dp = Integer.parseInt(request.getParameter("deluxe_pay"));
		
		String bp = request.getParameter("business_type_premium");
		int pf = Integer.parseInt(request.getParameter("premium_funcion"));
		int pw = Integer.parseInt(request.getParameter("premium_workDate"));
		int pr = Integer.parseInt(request.getParameter("premium_retouch"));
		int pp = Integer.parseInt(request.getParameter("premium_pay"));
		
		HttpSession session = request.getSession();
		int memberNo = (int)session.getAttribute("userNo");
	
		BoardProDto boardDto = new BoardProDto(); 
		boardDto.setBoardProTitle(title);
		boardDto.setBoardProSecondTitle(seondTitle);
		boardDto.setBoardProContents(content);
		boardDto.setBusinessType(bs);
		boardDto.setBusinessFunction(sf);
		boardDto.setBusinessRetouch(sr);
		boardDto.setBusinessPay(sp);
		boardDto.setBusinessType(bd);
		boardDto.setBusinessFunction(df);
		boardDto.setBusinessRetouch(dr);
		boardDto.setBusinessPay(dp);
		boardDto.setBusinessType(bp);
		boardDto.setBusinessFunction(pf);
		boardDto.setBusinessRetouch(pr);
		boardDto.setBusinessPay(pp);
		
		Collection<Part> parts = request.getParts();
		String uploadDirectory = "C:\\dev\\work-space\\SemiProject\\SemiProject\\src\\main\\webapp\\resources\\upload";
		
		File filePath = new File(uploadDirectory);
		if(!filePath.exists() ) {
			filePath.mkdirs();
		}
		
		String fileName = null;
		
		BoardProServiceImpl boardProService = new BoardProServiceImpl(); 
		int result = boardProService.enroll(boardDto);
		int typeResult = boardProService.typeEnroll(boardDto);; 
		
		
		BoardProDto boardProDto = boardProService.selectNo(boardDto);
		
		for(Part part : parts) {
			fileName = getFileName(part);
			if(fileName != null) {
				part.write(filePath + File.separator + fileName);
				
				boardProDto.setFilePath(uploadDirectory);
				boardProDto.setFileName(fileName);
				int resultUpload = boardProService.fileUpload(boardProDto);
			}
		}
		
		if(result == 1) {
			response.sendRedirect("/freeBoard/list.do?cpage=1&category=fb_title&search-text=");
		}
	
	}
	
	private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 2, token.length() - 1);
            }
        }
        return null;
    }
	
	
}
