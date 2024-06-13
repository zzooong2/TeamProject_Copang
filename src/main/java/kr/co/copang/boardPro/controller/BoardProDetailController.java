package kr.co.copang.boardPro.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.co.copang.boardPro.model.dto.BoardProDto;
import kr.co.copang.boardPro.model.service.BoardProServiceImpl;

@WebServlet("/BoardPro/Detail.do")
public class BoardProDetailController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public BoardProDetailController() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      int boardProNo;
       try {
          boardProNo = Integer.parseInt(request.getParameter("boardNo"));
          
       } catch (NumberFormatException e) {
          boardProNo = Integer.parseInt(request.getParameter("businessNo"));
//           boardProNo = 11; // 기본 값 설정 또는 오류 처리
       }
   
      BoardProServiceImpl boardProService = new BoardProServiceImpl(); 
      
      ArrayList<BoardProDto> result = boardProService.getDetail(boardProNo);
      
      if(result != null && result.size() >= 6) {
         request.setAttribute("result", result.get(0));
         request.setAttribute("resultSingle", result.get(1));
         request.setAttribute("resultS", result.get(2));
         request.setAttribute("resultD", result.get(3));
         request.setAttribute("resultP", result.get(4));
         request.setAttribute("resultF", result.get(5));
      } else {
         request.setAttribute("error", "잘못된 접근입니다.");
      }
      
      // 파일 정보 확인
       BoardProDto mainFile = boardProService.getDetailFile(boardProNo);
       if (mainFile != null) {
           request.setAttribute("mainFile", mainFile);
       } else {
           request.setAttribute("error", "파일을 찾을 수 없습니다.");
       }
      
      ArrayList<BoardProDto> fileList = boardProService.getFiles(boardProNo);
      request.setAttribute("fileList", fileList);
      
      ArrayList<BoardProDto> reviewList = boardProService.getReviews(boardProNo);
      float avgValue = boardProService.getReviewAvg(boardProNo);
      String avg = String.format("%.1f", avgValue);
      request.setAttribute("avg", avg);
      
      if(reviewList != null) {
         request.setAttribute("reviewList", reviewList);
      } else {
         request.setAttribute("reviewList", new ArrayList<>());
      }
      
      RequestDispatcher view = request.getRequestDispatcher("/views/board/boardProDetail.jsp");
      view.forward(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
       response.setContentType("application/json"); // JSON 형식으로 응답을 전송
       response.setCharacterEncoding("UTF-8");
       
       HttpSession session = request.getSession();
       int userNo = (int) session.getAttribute("userNo");

       int starPoint = Integer.parseInt(request.getParameter("starPoint"));
       String reviewContent = request.getParameter("reviewContent");
       int boardProNo = Integer.parseInt(request.getParameter("boardProNo"));

       BoardProDto boardDto = new BoardProDto();
       boardDto.setUserNo(userNo);
       boardDto.setBoardProNo(boardProNo);
       boardDto.setReviewStarPoint(starPoint);
       boardDto.setReviewContent(reviewContent);

       BoardProServiceImpl boardProService = new BoardProServiceImpl();
       int result = boardProService.BoardReview(boardDto);

       if (result == 1) {
           // 새로 작성된 리뷰만 조회하여 JSON으로 변환하여 응답
           ArrayList<BoardProDto> newReviewList = boardProService.getNewReviews(boardProNo);
           Gson gson = new Gson();
           String jsonReviewList = gson.toJson(newReviewList);
           response.getWriter().write(jsonReviewList);
       } else {
           response.getWriter().write("Review submission failed");
       }
   }
}
