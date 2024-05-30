package kr.co.copang.boardPro.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
		
/*		Collection<Part> parts = request.getParts();
		String uploadDirectory = "C:\\dev\\work-space\\SemiProject\\SemiProject\\src\\main\\webapp\\resources\\upload";
		
		File filePath = new File(uploadDirectory);
		if(!filePath.exists() ) {
			filePath.mkdirs();
		}
		
		String fileName = null;
		
		BoardProDto fileUploadDto = boardProService.selectNo(boardDto);
		
		System.out.println("1. fileUploadDto : " + fileUploadDto);
		
		for(Part part : parts) {*/
			
//			for문 동작 여부 확인 ------------------------------------------------------
/*
 * System.out.println("2. for문 시작");
 * 
 * fileName = getFileName(part); if(fileName != null) { part.write(filePath +
 * File.separator + fileName);
 * 
 * fileUploadDto.setFilePath(uploadDirectory);
 * fileUploadDto.setFileName(fileName);
 */
				
//				uploadDirectory 값이 생성 되는지 확인 ----------------------------------
//				System.out.println("3. uploadDirectory : " + uploadDirectory);

//				fileName 값이 생성 되는지 확인 -----------------------------------------
//				System.out.println("4. fileName : " + fileName);
				
//				첨부파일 등록 실행 ----------------------------------------------------
//				int resultUpload = boardProService.fileUpload(boardDto, businessNo);
				
//				resultUpload 등록 반환값이 들어 오는지 확인 ------------------------------
//				System.out.println("5. resultUpload : " + resultUpload);
				
//			} else {
//				System.out.println("6. fileName에 값이 없습니다.");
				
//			}
//		}
		
		
		
		
//		---------------------------------------------------------------------		
		
		String uploadDirectory = "C:\\dev\\work-space\\SemiProject\\SemiProject\\src\\main\\webapp\\resources\\upload";
		int size = 10 * 520 * 520;
		
		File curretDir = new File(uploadDirectory);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(curretDir);
		factory.setSizeThreshold(size);
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List<FileItem> items = upload.parseRequest(request);
			
			for(FileItem  d : items) { 
				System.out.println("a : " + d);
			}
			System.out.println("dd");
			
			for(FileItem fi : items) {
				if(fi.isFormField() ) {
					System.out.println(fi.getFieldName() + " = " + fi.getString("utf-8"));
				}
				else {
					System.out.println(fi.getFieldName());
					String origin = fi.getName();
					System.out.println(origin);
					String ext = origin.substring(origin.lastIndexOf(".")); // 확장자 가져오기 
					
					UUID uuid = UUID.randomUUID(); // 단점 보완! 이름 고유값 줌으로써!
					String name = uuid + ext;
					
					System.out.println(fi.getSize());
					
					File upPath = new File(curretDir + "\\" + getTodayStr());  // 날짜별 구분 여러모로 좋음
					if(!upPath.exists()) {
						upPath.mkdirs();
					}
					
					fi.write(new File(upPath, name));
				}                                       
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		if(result == 1) {
			response.sendRedirect("/");
			/*
			 * response.sendRedirect(
			 * "/BoardPro/list.do?cpage=1&category=fb_title&search-text=");
			 */
		}
	
	}
	
//	private String getFileName(Part part) {
//        String contentDisposition = part.getHeader("content-disposition");
//        System.out.println("토큰 : " + contentDisposition);
//        String[] tokens = contentDisposition.split(";");
//        for (String token : tokens) {
//            if (token.trim().startsWith("filename")) {
//                return token.substring(token.indexOf('=') + 2, token.length() - 1);
//            }
//        }
//        return null;
//    }
	
	
	private String getTodayStr() {
		return new SimpleDateFormat("yyyy/MM/dd").format(System.currentTimeMillis()); // 포맷한 날짜 개념으로 파일 뎁스생김.
	}
	
}
