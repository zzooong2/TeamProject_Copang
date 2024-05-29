<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/views/common/head.jsp"%>
	<link rel="stylesheet" href="/resources/css/member/searchPwd.css">
</head>
<body>
	
	<div class="search_container" s>
	<div class="container">
        <h1>아이디 / 비밀번호 찾기</h1>
        <div class="button-group">
            <button id="find-id-button">아이디 찾기</button>
            <button id="find-pw-button">비밀번호 찾기</button>
        </div>
        <div id="id-form" class="form hidden">
            <input type="text" placeholder="이름 입력">
            <input type="text" placeholder="휴대폰 번호 입력">
            <button>휴대폰 인증받기</button>
        </div>
        <div id="pw-form" class="form hidden">
            <input type="text" placeholder="아이디 입력">
            <input type="text" placeholder="휴대폰 번호 입력">
            <button>휴대폰 인증받기</button>
        </div>
    </div>
	</div>
    <script src="scripts.js"></script>
        
        
	
    <br><br><br><br><br><br><br>
	<script src="/resources/js/member/searchPwd.js"></script>
<script>
	window.onload = function() {
	const header = document.getElementsByTagName("header")[0];
	header.style.position = "unset";
	}
</script>
</body>
</html>
