<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/views/common/head.jsp"%>
	<link rel="icon" href="/resources/img/tapIcon.png">
	<link rel="stylesheet" href="/resources/css/member/login.css">
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
	
	<div id="main" class="login-page" style="padding-top: 100px; padding-bottom: 100px;">
		<div class="login_container" >
        <h2 class="로그인">COPANG</h2>
        <form action="/member/login.do" method="POST">
            <label for="email">이메일</label>
            <br>
            <input type="email" id="email" name="email" placeholder="이메일을 입력해 주세요." required>
            <br><br>

            <label for="password">비밀번호</label>
            <br>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력해 주세요." required>
            <br><br>

            <button type="submit">로그인</button>
            <br><br>

            <div class="extra-options">
                <input type="checkbox" id="remember_me" name="remember_me">
                <label for="remember_me">로그인 상태 유지</label>
                <a href="/views/member/searchPwd.jsp" class="find-info">아이디/비밀번호 찾기</a><br>
            </div>
            <a href="/">
                <img class="loginLogo" src="/resources/img/Logo.png" alt="logo">
            </a>
        </form>
    </div>
</div>
	
	
	<%@ include file="/views/common/footer.jsp"%>
<script>
	window.onload = function() {
	const header = document.getElementsByTagName("header")[0];
	header.style.position = "unset";
	}
</script>
</body>
</html>
