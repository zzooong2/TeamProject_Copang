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
	<link rel="stylesheet" href="/resources/css/customerService/customerService/customerServiceEdit.css">
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
    <main class="main">
        <section class="enroll-section">
	        <div class="page-navigation">
	            Copang  >  고객센터  >  수정
	        </div>
	
	        <div class="customer-text">
	            Customer Service
	        </div>
        
            <form action="/customerService/editEnroll.do" method="POST">
                <!-- type을 hidden 으로 설정하여 사용자에게는 보이지 않는 고객번호를 전달 -->
                <input type="hidden" id="boardNo" name="boardNo" value="${result.boardNo}">

                <input type="text" id="boardTitle" name="boardTitle" class="board-title" value="${result.boardTitle}" required>
                
                <textarea id="editorTxt" name="boardContents" class="board-content" rows="35" cols="100" required>${result.boardContents}</textarea>
                
                <input type="text" id="boardWriter" class="board-writer" value="${result.userName}" disabled>
                
                <button type="submit" class="edit-btn" onclick="save()">수 정</button>
            </form>
        </section>
    </main>
	
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
