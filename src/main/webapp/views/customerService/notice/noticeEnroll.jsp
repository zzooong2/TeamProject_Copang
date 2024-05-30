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

    <!-- jquery CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- smarteditor js -->
    <script src="../../../resources/static/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="../../../resources/js/payment/payment/smartEditor.js"></script>

	<%@ include file="/views/common/head.jsp"%>
	<link rel="stylesheet" href="../../../resources/css/customerService/notice/noticeEnroll.css">
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
    <main class="main">
        <section class="enroll-section">
	        <div class="page-navigation">
	            Copang  >  공지사항  >  작성
	        </div>
	
	        <div class="notice-text">
	            Notice
	        </div>
        
            <form action="/noticeBoard/enroll.do" method="POST">
                <!-- type을 hidden 으로 설정하여 사용자에게는 보이지 않는 고객번호를 전달 -->
                <!-- <input type="hidden" name="member-no" value="${sessionScope.userNo}">  -->

                <input type="text" id="notice-title" class="notice-title" placeholder="제목을 입력해주세요." required>
                
                <textarea id="editorTxt" class="notice-content" rows="35" cols="100" required></textarea>
                
                <input type="text" id="notice-writer" class="notice-writer" value="관리자" disabled>
                
                <button class="enroll-btn" onclick="location.href='/views/customerService/notice/noticeList.jsp'">작 성</button>
                <!-- <button type="submit" onclick="save()" class="enroll-btn">작성</button> -->
            </form>
        </section>
    </main>
	
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
