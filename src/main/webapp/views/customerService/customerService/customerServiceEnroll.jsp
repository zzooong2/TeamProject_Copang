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
	<link rel="stylesheet" href="../../../resources/css/customerService/customerService/customerServiceEnroll.css">
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
    <main class="main">
        <section class="enroll-section">
	        <div class="page-navigation">
	            Copang  >  고객센터  >  작성
	        </div>
	
	        <div class="notice-text">
	            Customer Service
	        </div>
        
            <form action="/customerService/enroll.do" method="POST">
               
                <input type="text" id="notice-title" name="notice-title" class="notice-title" placeholder="제목을 입력해주세요.">
                
                <textarea id="editorTxt" name="notice-contents" class="notice-contents" rows="35" cols="150"></textarea>
                
                <input type="text" id="notice-writer" class="notice-writer" value="관리자" disabled>
                
                <button class="enroll-btn" type="submit" onclick="save()">작 성</button>
                <!-- <button type="submit" onclick="save()" class="enroll-btn">작성</button> -->
            </form>
        </section>
    </main>
	
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
