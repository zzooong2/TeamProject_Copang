package kr.co.copang.boardPro.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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
		int memberNo = 11;
		
//		----- Enroll Page1
		String title = request.getParameter("enroll_Title");
		String category = request.getParameter("enroll_Category");
		String middleCategory = null;
		String subcatCategory = null;
		String serviceStyle = request.getParameter("enroll_Service");
		String company = request.getParameter("enroll_Company");
		
		String detailService = request.getParameter("editorTxt");
		
		String[] twoCategory = request.getParameterValues("enroll_Middle_Category");
		String[] thirdCategory = request.getParameterValues("enroll_Subcat_Category");
		System.out.println(twoCategory);
		
		for(String item : twoCategory) {
			System.out.println("a : " + item);
			if(!item.equals("")) { 
				middleCategory = item;
			}
		}
		
		for(String item : thirdCategory) {
			if(!item.equals("")) { 
				subcatCategory = item;
			}
		}
		
		BoardProDto boardDto = new BoardProDto(); 
		boardDto.setUserNo(memberNo);
		boardDto.setBoardProCompany(company);
		boardDto.setBoardProTitle(title);
		boardDto.setBoardProCategory(category);
		boardDto.setBoardProMiddleCategory(middleCategory);
		boardDto.setBoardProSubcatCategory(subcatCategory);
		boardDto.setBoardProServiceType(serviceStyle);
		boardDto.setBoardProContents(detailService);
		
		BoardProServiceImpl boardProService = new BoardProServiceImpl(); 
		int result = boardProService.CategoryBoardEnroll(boardDto);
		
		int businessNo = boardProService.getBoardNo(boardDto);
		
		int typeResult = 0;
		
		if(request.getParameter("enroll_ServiceName") != null && request.getParameter("enroll_Standard_Name").equals("")) {
			
//		----- Enroll Page2-1
			String serviceTypeName = request.getParameter("enroll_ServiceName");
			String seondGuide = request.getParameter("enroll_ServiceGuide");
			int servicePay = Integer.parseInt(request.getParameter("enroll_ServicePay"));
			int workDay = Integer.parseInt(request.getParameter("enroll_WorkDay"));
			int retouch = Integer.parseInt(request.getParameter("enroll_Retouch"));
			int data = Integer.parseInt(request.getParameter("enroll_WorkDay"));
			int function = Integer.parseInt(request.getParameter("enroll_Retouch"));
			
			BoardProDto businessDto = new BoardProDto(serviceTypeName, seondGuide, servicePay, workDay, retouch, data, function);
			
			typeResult = boardProService.BusinessMenuSingleEnroll(businessDto, businessNo);
			
		} else {
			
//		----- Enroll Page 2-2	

			String sbusinessServiceName = request.getParameter("enroll_Standard_Name");
			String dbusinessServiceName = request.getParameter("enroll_Deluxe_Name");
			String pbusinessServiceName = request.getParameter("enroll_Premium_Name");
			
			String sbusinessServiceGuide = request.getParameter("enroll_Standard_ServiceGuide");
			String dbusinessServiceGuide = request.getParameter("enroll_Deluxe_ServiceGuide");
			String pbusinessServiceGuide = request.getParameter("enroll_Premium_ServiceGuide");
			
			int sbusinessServicePay = Integer.parseInt(request.getParameter("enroll_Standard_Pay"));
			int dbusinessServicePay = Integer.parseInt(request.getParameter("enroll_Deluxe_Pay"));
			int pbusinessServicePay = Integer.parseInt(request.getParameter("enroll_Premium_Pay"));
			
			int sbusinessServiceWorkDate = Integer.parseInt(request.getParameter("enroll_Standard_WorkDay"));
			int dbusinessServiceWorkDate = Integer.parseInt(request.getParameter("enroll_Deluxe_WorkDay"));
			int pbusinessServiceWorkDate = Integer.parseInt(request.getParameter("enroll_Premium_WorkDay"));
			
			int sbusinessServiceRetouch = Integer.parseInt(request.getParameter("enroll_Standard_Retouch"));
			int dbusinessServiceRetouch = Integer.parseInt(request.getParameter("enroll_Deluxe_Retouch"));
			int pbusinessServiceRetouch = Integer.parseInt(request.getParameter("enroll_Premium_Retouch"));
			
			int sbusinessServiceData = Integer.parseInt(request.getParameter("enroll_Standard_Data"));
			int dbusinessServiceData = Integer.parseInt(request.getParameter("enroll_Deluxe_Data"));
			int pbusinessServiceData = Integer.parseInt(request.getParameter("enroll_Premium_Data"));
			
			int sbusinessServiceFunction = Integer.parseInt(request.getParameter("enroll_Standard_Function"));
			int dbusinessServiceFunction = Integer.parseInt(request.getParameter("enroll_Deluxe_Function"));
			int pbusinessServiceFunction = Integer.parseInt(request.getParameter("enroll_Premium_Function"));
			
			
//			상세정보 배열 생성
				ArrayList<BoardProDto> business = new ArrayList<>();
				
//			패키지 가격 상품일 때
//			STANDARD DATA
				BoardProDto standardDto = new BoardProDto(sbusinessServiceName, sbusinessServiceGuide, sbusinessServicePay, sbusinessServiceWorkDate, sbusinessServiceRetouch, sbusinessServiceData, sbusinessServiceFunction);
				
//			DELUXE DATA
				BoardProDto deluxeDto = new BoardProDto(dbusinessServiceName, dbusinessServiceGuide, dbusinessServicePay, dbusinessServiceWorkDate, dbusinessServiceRetouch, dbusinessServiceData, dbusinessServiceFunction);
				
//			PRIMIUM DATA
				BoardProDto primiumDto = new BoardProDto(pbusinessServiceName, pbusinessServiceGuide, pbusinessServicePay, pbusinessServiceWorkDate, pbusinessServiceRetouch, pbusinessServiceData, pbusinessServiceFunction); 
				
				business.add(standardDto);
				business.add(deluxeDto);
				business.add(primiumDto);
				
				typeResult = boardProService.BusinessMenuEnroll(business, businessNo);
		}
		
//		---------------------------------------------------------------------
		
		// HTTP 요청으로부터 파일 업로드를 처리할 Part 컬렉션을 가져옵니다.
		Collection<Part> parts = request.getParts();

		// 메인 이미지와 상세페이지 이미지를 업로드할 디렉토리 경로를 지정합니다.
		String mUploadDirectory = "/Users/zzooong2/semiProject/semiProject/src/main/webapp/resources/upload/detail";
		String dUploadDirectory = "/Users/zzooong2/semiProject/semiProject/src/main/webapp/resources/upload/main";

		// 파일 업로드 디렉토리가 존재하지 않으면 생성합니다.
		File mFilePath = new File(mUploadDirectory);
		File dFilePath = new File(dUploadDirectory);

		if (!mFilePath.exists()) {
		    mFilePath.mkdirs();
		}

		if (!dFilePath.exists()) {
		    dFilePath.mkdirs();
		}

		String[] fileName = {null, null, null, null, null, null}; // 업로드된 파일 이름을 저장할 변수
		int fileResult = 0; // 파일 업로드 결과를 추적하는 변수

		// 모든 Part 객체를 반복하여 파일을 업로드합니다.
		for (Part part : parts) {
		    getFileName(part,fileName); // Part 객체에서 파일 이름을 가져옵니다.

		    if (fileName[0] != null) {
		        // 파일 이름이 "main"으로 시작하는 경우 메인 이미지 디렉토리로 저장합니다.
		        if (fileName[1].startsWith("mUploadFile")) {
		            part.write(mFilePath + File.separator + fileName[0]);
		            boardDto.setFilePath(mUploadDirectory); // 파일 경로를 DTO에 설정합니다.
		        } 
		        // 파일 이름이 "detail"로 시작하는 경우 상세페이지 이미지 디렉토리로 저장합니다.
		        else if (fileName[1].startsWith("dUploadFile")) {
		            part.write(dFilePath + File.separator + fileName[0]);
		            boardDto.setFilePath(dUploadDirectory); // 파일 경로를 DTO에 설정합니다.
		        }
		        boardDto.setFileName(fileName[0]); // 파일 이름을 DTO에 설정합니다.
		        fileResult = boardProService.fileUpload(boardDto, businessNo); // 파일 업로드를 수행합니다.
		    }
		}
		
		// 파일 업로드 및 비즈니스 로직 처리가 성공한 경우 메인 페이지로 이동합니다.
		if (result == 1 && typeResult == 1 && fileResult == 1) {
		    response.sendRedirect("/BoardPro/Detail.do");
		} 
		// 실패한 경우 오류 페이지로 이동합니다.
		else {
		    response.sendRedirect("/error.jsp");
		}
	}
	
	private void getFileName(Part part, String[] fileName) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
            	fileName[0] = token.substring(token.indexOf('=') + 2, token.length() - 1);
            }
            
            if (token.trim().startsWith("name")) {
            	fileName[1] = token.substring(token.indexOf('=') + 2, token.length() - 1);
            }
        }
    }
}
