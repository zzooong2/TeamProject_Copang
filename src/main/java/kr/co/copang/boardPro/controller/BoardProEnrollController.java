package kr.co.copang.boardPro.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
		
//		<< CATEGORY_BOARD 전문가 판매 게시글 등록 >>
		
		String title = request.getParameter("detailTitle");
		String seondTitle = request.getParameter("secondTitle");
		String content = request.getParameter("detailContents");
		
		
		HttpSession session = request.getSession();
//		int memberNo = (int)session.getAttribute("userNo");
		int memberNo = 3;
		
		BoardProDto boardDto = new BoardProDto(); 
		boardDto.setBoardProTitle(title);
		boardDto.setBoardProSecondTitle(seondTitle);
		boardDto.setBoardProContents(content);
		boardDto.setUserNo(memberNo);
		
		
		BoardProServiceImpl boardProService = new BoardProServiceImpl(); 
		int result = boardProService.enroll(boardDto);

//		---------------------------------------------------------------------

//		<< BUSINESS_MENU 타입별 상세정보 등록 >>
		
//		CATEGORY_BOARD -> B_NO 조회
		int businessNo = boardProService.getBoardNo(boardDto);
		
		int sf = Integer.parseInt(request.getParameter("standard_function"));
		int sr = Integer.parseInt(request.getParameter("standard_retouch"));
		int sp = Integer.parseInt(request.getParameter("standard_pay"));
		int sw = Integer.parseInt(request.getParameter("standard_workDate"));
		
		int df = Integer.parseInt(request.getParameter("deluxe_function"));
		int dr = Integer.parseInt(request.getParameter("deluxe_retouch"));
		int dp = Integer.parseInt(request.getParameter("deluxe_pay"));
		int dw = Integer.parseInt(request.getParameter("deluxe_workDate"));
		
		
		int pf = Integer.parseInt(request.getParameter("premium_funcion"));
		int pr = Integer.parseInt(request.getParameter("premium_retouch"));
		int pp = Integer.parseInt(request.getParameter("premium_pay"));
		int pw = Integer.parseInt(request.getParameter("premium_workDate"));
		
//		상세정보 배열 생성
		ArrayList<BoardProDto> business = new ArrayList<>();
		
//		STANDARD DATA
		BoardProDto standardDto = new BoardProDto(sf, sr, sp, sw);
		
//		DELUXE DATA
		BoardProDto deluxeDto = new BoardProDto(df, dr, dp, dw);
		
//		PRIMIUM DATA
		BoardProDto primiumDto = new BoardProDto(pf, pr, pp, pw); 
		
		business.add(standardDto);
		business.add(deluxeDto);
		business.add(primiumDto);
		
		int typeResult = boardProService.typeEnroll(business, businessNo);

//		---------------------------------------------------------------------
		
		Collection<Part> parts = request.getParts();
		String uploadDirectory = "C:\\dev\\work-space\\SemiProject\\SemiProject\\src\\main\\webapp\\resources\\upload";
		
		// 파일 업로드 디렉토리가 존재하지 않으면 생성
		File filePath = new File(uploadDirectory);
		if(!filePath.exists()) {
			filePath.mkdirs();
		}
		
		String fileName = null;
		
		int fileResult = 0;
		
		for(Part part : parts) {
			fileName = getFileName(part);
			if(fileName != null) {
				part.write(filePath + File.separator + fileName);
				
				boardDto.setFilePath(uploadDirectory);
				boardDto.setFileName(fileName);
				fileResult = boardProService.fileUpload(boardDto, businessNo);
			}
		}
		
		if(result == 1 && fileResult == 1) {
			response.sendRedirect("/");
			/*
			 * response.sendRedirect(
			 * "/BoardPro/list.do?cpage=1&category=fb_title&search-text=");
			 */
		} else {
			response.sendRedirect("/error.jsp");
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
