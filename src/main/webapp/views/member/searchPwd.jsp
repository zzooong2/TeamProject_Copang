<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/views/common/head.jsp"%>
	<link rel="icon" href="/resources/img/tapIcon.png">
	<link rel="stylesheet" href="/resources/css/member/searchPwd.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	
	<h1 class="copang">CoPang</h1>	
	<hr class="hr_text">
	
	
	<div class="search_container">
	<div class="container">
        <h2 class="idPwdSearch">아이디 비밀번호 찾기</h2>
        <div class="button-group">
            <button class="search_button" id="find-id-button">아이디 찾기</button>
            <button class="search_button" id="find-pw-button">비밀번호 찾기</button>
        </div>
        <div id="id_form" class="form hidden">
            <label for="name">이름</label>
            <input type="text" id="name" placeholder="이름을 입력해 주세요."> <br>
            <label for="phone">휴대폰 번호</label>
            <input type="text" id="phone_id" name="phone_id" placeholder="연락처를 입력해 주세요. (-)미포함"><br>
            <button class="certification_button" type="button" name="requestCode" id="requestCodeBtn"  onclick="inputphone('id')">휴대폰 인증받기</button>
            <div id="textphone"></div>
            
            <div id="verificationCodeContainer_id" style="display: none;">
    			<label for="verificationCode">인증번호</label> <br>
    			<input type="text" id="verificationCode_id" name="verificationCode" placeholder="인증번호를 입력해 주세요." required>
    			<button class="certification_button" type="button" id="verifyCodeBtn_id">아이디 찾기</button>
			</div>
            
        </div>
        <div id="pw_form" class="form hidden">
        	<label for="email">아이디</label>
            <input type="text" id="email" placeholder="이메일을 입력해 주세요."><br>
            <label for="phone">휴대폰 번호</label>
            <input type="text" id="phone_pw" name="phone_pw" placeholder="연락처를 입력해 주세요. (-)미포함"><br>
            <button class="certification_button" type="button" name="requestCode" id="requestCodeBtn"  onclick="inputphone('pwd')">휴대폰 인증받기</button>
            <div id="textphone1"></div>
            
            <div id="verificationCodeContainer_pw" style="display: none;">
    			<label for="verificationCode_pw">인증번호</label> <br>
    			<input type="text" id="verificationCode_pw" name="verificationCode" placeholder="인증번호를 입력해 주세요." required>
    			<button class="certification_button" type="button" id="verifyCodeBtn_pw">비밀번호 변경</button>
			</div>
        </div>
        <img class="searchLogo" src="/resources/img/Logo.png" alt="logo">
    </div>
	</div>
    <!-- <script src="scripts.js"></script> -->
        
        
	
    <br><br><br><br><br><br><br>
	<script src="/resources/js/member/searchPwd.js"></script>
</body>
</html>
