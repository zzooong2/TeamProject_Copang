<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/views/common/head.jsp"%>
	<link rel="stylesheet" href="/resources/css/member/login.css">
</head>
<body>s
	<%@ include file="/views/common/header.jsp"%>
	
	<div id="main" style="padding-top: 100px;">
		<div class="login-container" >
        <h2 class="로그인">COPANG</h2>
        <form action="login" method="post">
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
                <a href="#" class="find-info">아이디/비밀번호 찾기</a>
            </div>
        </form>
    </div>
</div>
	
	
    <hr>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>