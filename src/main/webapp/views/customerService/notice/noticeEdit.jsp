<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CoPang</title>
	
    <!-- tab-icon -->
    <link rel="icon" href="/resources/img/tapIcon.png" />

    <!-- jquery CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- smarteditor js -->
    <script src="/resources/static/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="/resources/js/payment/payment/smartEditor.js"></script>

	<%@ include file="/views/common/head.jsp"%>
	<link rel="stylesheet" href="/resources/css/customerService/notice/noticeEdit.css">
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
    <main class="main">
        <section class="edit-section">
	        <div class="page-navigation">
	            Copang  >  공지사항  >  수정
	        </div>
	
	        <div class="notice-text">
	            Notice
	        </div>
        
            <form action="/notice/editEnroll.do" method="POST">
                <!-- type을 hidden 으로 설정하여 사용자에게는 보이지 않는 고객번호를 전달 -->
                <input type="hidden" name="noticeNo" value="${result.noticeNo}">

                <input type="text" name="noticeTitle" class="notice-title" value="${result.noticeTitle}" required>
                
                <textarea id="editorTxt" name="noticeContents" class="notice-content" rows="35" cols="100" required>${result.noticeContents}</textarea>
                
                <input type="text" name="noticeWriter" class="notice-writer" value="${result.userName}" disabled>
                
                <button class="edit-btn" type="submit" onclick="save()">수 정</button>
            </form>
        </section>
    </main>
	
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
