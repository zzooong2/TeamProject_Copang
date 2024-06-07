<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CoPang</title>
    
    <!-- tab-icon -->
    <link rel="icon" href="../../../resources/img/tapIcon.png" />

	
	<%@ include file="/views/common/head.jsp"%>
	<link rel="stylesheet" href="../../../resources/css/customerService/notice/noticeDetail.css">
	
	
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
	<main class="main main-sub">
        <div class="page-navigation">
            Copang  >  공지사항  >  게시글
        </div>

        <div class="notice-text">
            Notice
        </div>
        <section class="enroll-section">
            <form action="/notice/delete.do" method="POST">
                <!-- type을 hidden 으로 설정하여 사용자에게는 보이지 않는 고객번호를 전달 -->
                <input type="hidden" name="noticeNo" value="${result.noticeNo}">

                <div class="notice-title">${result.noticeTitle}</div>

                <div class="notice-writer">${result.userName} ${result.noticeIndate}</div>
                
                <div class="notice-content">${result.noticeContents}</div>
                
                <c:if test="${partCode == 3}">
	                <button type="button" onclick="location.href='/notice/edit.do?noticeNo=${result.noticeNo}'" class="edit-btn">수정</button>
	                <button type="submit" class="delete-btn">삭제</button>
                </c:if>
                <button type="button" onclick="location.href='/notice/list.do?cPage=1&category=N_TITLE&search-text='" class="back-btn">뒤로가기</button>
            </form>
        </section>
    </main>
	
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
