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
		
//		●------------------------------ << boardProEnroll.jsp 데이터 취합 >> ---------------------------------------●
		
		HttpSession session = request.getSession();
//		int memberNo = (int)session.getAttribute("userNo");
		int memberNo = 3;
		
//		----- Enroll Page1
		String title = request.getParameter("enroll_Title");
		String category = request.getParameter("enroll_Category");
		String serviceStyle = request.getParameter("enroll_Service");
		


//		----- Enroll Page2-1
		String serviceTypeName = request.getParameter("enroll_ServiceName");
		String seondGuide = request.getParameter("enroll_ServiceGuide");
		int servicePay = Integer.parseInt(request.getParameter("enroll_ServicePay"));
		int workDay = Integer.parseInt(request.getParameter("enroll_WorkDay"));
		int retouch = Integer.parseInt(request.getParameter("enroll_Retouch"));
		int consulting = Integer.parseInt(request.getParameter("enroll_Consulting"));
		int consultingTime = Integer.parseInt(request.getParameter("enroll_ConsultingTime"));
		
//		----- Enroll Page 2-2		
		String sServiceTypeName = request.getParameter("enroll_Standard_Name");
		String dServiceTypeName = request.getParameter("enroll_Deluxe_Name");
		String pServiceTypeName = request.getParameter("enroll_Premium_Name");
		
		String sSeondGuide = request.getParameter("enroll_Standard_ServiceGuide");
		String dSeondGuide = request.getParameter("enroll_Deluxe_ServiceGuide");
		String pSeondGuide = request.getParameter("enroll_Premium_ServiceGuide");
		
		int sServicePay = Integer.parseInt(request.getParameter("enroll_Standard_Pay"));
		int dServicePay = Integer.parseInt(request.getParameter("enroll_Deluxe_Pay"));
		int pServicePay = Integer.parseInt(request.getParameter("enroll_Premium_Pay"));
		
		int sWorkDay = Integer.parseInt(request.getParameter("enroll_Standard_WorkDay"));
		int dWorkDay = Integer.parseInt(request.getParameter("enroll_Deluxe_WorkDay"));
		int pWorkDay = Integer.parseInt(request.getParameter("enroll_Premium_WorkDay"));
		
		int sRetouch = Integer.parseInt(request.getParameter("enroll_Standard_Retouch"));
		int dRetouch = Integer.parseInt(request.getParameter("enroll_Deluxe_Retouch"));
		int pRetouch = Integer.parseInt(request.getParameter("enroll_Premium_Retouch"));
		
		int sConsulting = Integer.parseInt(request.getParameter("enroll_Standard_Consulting"));
		int dConsulting = Integer.parseInt(request.getParameter("enroll_Deluxe_Consulting"));
		int pConsulting = Integer.parseInt(request.getParameter("enroll_Premium_Consulting"));
		
		int sConsultingTime = Integer.parseInt(request.getParameter("enroll_Standard_ConsultingTime"));
		int dConsultingTime = Integer.parseInt(request.getParameter("enroll_Deluxe_ConsultingTime"));
		int pConsultingTime = Integer.parseInt(request.getParameter("enroll_Premium_ConsultingTime"));
		
		
		
//		----- Enroll Page3	
		String detailService = request.getParameter("enroll_ServiceContents");
		
		
		
//		----- Enroll Page4
		
		
		
//		●------------------------------ << CATEGORY_BOARD 전문가 판매 게시글 등록 >> ---------------------------------------●

		BoardProDto boardDto = new BoardProDto(); 
		boardDto.setUserNo(memberNo);
		boardDto.setBoardProTitle(title);
		boardDto.setBoardProCategory(category);
		boardDto.setBoardProServiceType(serviceStyle);
		boardDto.setBoardProContents(detailService);
		
		
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
		
		// HTTP 요청으로부터 파일 업로드를 처리할 Part 컬렉션을 가져옵니다.
		Collection<Part> parts = request.getParts();

		// 메인 이미지와 상세페이지 이미지를 업로드할 디렉토리 경로를 지정합니다.
		String mUploadDirectory = "C:\\dev\\work-space\\SemiProject\\SemiProject\\src\\main\\webapp\\resources\\upload\\main";
		String dUploadDirectory = "C:\\dev\\work-space\\SemiProject\\SemiProject\\src\\main\\webapp\\resources\\upload\\detail";

		// 파일 업로드 디렉토리가 존재하지 않으면 생성합니다.
		File mFilePath = new File(mUploadDirectory);
		File dFilePath = new File(dUploadDirectory);

		if (!mFilePath.exists()) {
		    mFilePath.mkdirs();
		}

		if (!dFilePath.exists()) {
		    dFilePath.mkdirs();
		}

		String fileName = null; // 업로드된 파일 이름을 저장할 변수
		int fileResult = 0; // 파일 업로드 결과를 추적하는 변수

		// 모든 Part 객체를 반복하여 파일을 업로드합니다.
		for (Part part : parts) {
		    fileName = getFileName(part); // Part 객체에서 파일 이름을 가져옵니다.
		    if (fileName != null) {
		        // 파일 이름이 "main"으로 시작하는 경우 메인 이미지 디렉토리로 저장합니다.
		        if (fileName.startsWith("main")) {
		            part.write(mFilePath + File.separator + fileName);
		            boardDto.setFilePath(mUploadDirectory); // 파일 경로를 DTO에 설정합니다.
		        } 
		        // 파일 이름이 "detail"로 시작하는 경우 상세페이지 이미지 디렉토리로 저장합니다.
		        else if (fileName.startsWith("detail")) {
		            part.write(dFilePath + File.separator + fileName);
		            boardDto.setFilePath(dUploadDirectory); // 파일 경로를 DTO에 설정합니다.
		        }
		        boardDto.setFileName(fileName); // 파일 이름을 DTO에 설정합니다.
		        fileResult = boardProService.fileUpload(boardDto, businessNo); // 파일 업로드를 수행합니다.
		    }
		}

		// 파일 업로드 및 비즈니스 로직 처리가 성공한 경우 메인 페이지로 이동합니다.
		if (result == 1 && fileResult == 1) {
		    response.sendRedirect("/");
		} 
		// 실패한 경우 오류 페이지로 이동합니다.
		else {
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
