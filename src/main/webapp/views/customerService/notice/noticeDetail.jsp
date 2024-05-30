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

	<link rel="stylesheet" href="../../../resources/css/customerService/notice/noticeDetail.css">
	
	<%@ include file="/views/common/head.jsp"%>
	
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
	<main class="main">
        <div class="page-navigation">
            Copang  >  공지사항  >  게시글
        </div>

        <div class="notice-text">
            Notice
        </div>
        <section class="enroll-section">
            <form action="/noticeBoard/enroll.do" method="POST">
                <!-- type을 hidden 으로 설정하여 사용자에게는 보이지 않는 고객번호를 전달 -->
                <!-- <input type="hidden" name="member-no" value="${sessionScope.userNo}">  -->

                <div class="notice-title">코팡 서비스 점검안내 (06/31 00:00 ~ 06:00)</div>

                <div class="notice-writer">관리자 <2024-05-30 10:10:10></div>
                
                <div class="notice-content">코방 서비스 점검안내 드립니다. 이 공간에는 게시글의 내용이 들어가는 자리입니다.</div>
                
                <button type="submit" onclick="" class="edit-btn">수정</button>
                <button type="submit" onclick="" class="delete-btn">삭제</button>
                <button type="submit" onclick="goBack()" class="back-btn">뒤로가기</button>
            </form>
        </section>
    </main>
	
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
