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

        <div class="notice-text">
            Customer Service
        </div>
        <section class="enroll-section">
            <form action="/customerServiceBoard/enroll.do" method="POST">
                <!-- type을 hidden 으로 설정하여 사용자에게는 보이지 않는 고객번호를 전달 -->
                <!-- <input type="hidden" name="member-no" value="${sessionScope.userNo}">  -->

                <div class="notice-title">CSS가 적용되지 않아요..</div>

                <div class="notice-writer">김현중 <2024-05-30 10:10:10></div>
                
                <div class="notice-content">어딘가에 분명히 오타가 있을거에요.... 이 공간에는 게시글의 내용이 들어가는 자리입니다.</div>
                
                <button type="button" onclick="location.href='/views/customerService/customerService/customerServiceEdit.jsp'" class="edit-btn">수정</button>
                <button type="submit" onclick="" class="delete-btn">삭제</button>
                <button type="button" onclick="location.href='/views/customerService/customerService/customerServiceList.jsp'" class="back-btn">뒤로가기</button>
            </form>
        </section>
    </main>
	
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
