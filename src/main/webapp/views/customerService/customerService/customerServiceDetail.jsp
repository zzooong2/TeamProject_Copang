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

	<link rel="stylesheet" href="../../../resources/css/customerService/customerService/customerServiceDetail.css">
	
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
	<main class="main">
        <div class="page-navigation">
            Copang  >  고객센터  >  게시글
        </div>

        <div class="customer-text">
            Customer Service
        </div>
        <section class="enroll-section">
            <form action="/customerService/delete.do" method="POST">
                <!-- type을 hidden 으로 설정하여 사용자에게는 보이지 않는 고객번호를 전달 -->
                <input type="hidden" name="boardNo" value="${result.boardNo}">

                <span class="board-title" id="boradTitle">${result.boardTitle}</span>

                <span class="board-writer" id="boardWriter">${result.userName} ${result.boardIndate}</span>
                
                <div class="board-contents" id="boardContetns">${result.boardContents}</div>
                
                <button type="button" class="edit-btn" onclick="location.href='/customerService/edit.do?boardNo=${result.boardNo}'">수정</button>
                <button type="submit" onclick="location.href='/customerService/delete.do'" class="delete-btn">삭제</button>
                <button type="button" onclick="location.href='/customerService/list.do?cPage=1&category=Q_TITLE&search-text='" class="back-btn">뒤로가기</button>
            </form>
        </section>
    </main>
	
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
