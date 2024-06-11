<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/views/common/head.jsp"%>
    <link rel="icon" href="/resources/img/tapIcon.png">
    <link rel="stylesheet" href="/resources/css/member/searchPage.css">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.11.1/dist/sweetalert2.min.css">
    <!-- SweetAlert2 JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.11.1/dist/sweetalert2.all.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    
    <h1 class="copang">CoPang</h1>    
    <hr class="hr_text">
    
    
    <div class="search_container">
        <div class="container">
            <h2 class="idPwdSearch">비밀번호 변경</h2>
            
            <div id="pw_form" class="form">
                <form action="/member/changePwd.do" method="post" id="changePwdForm">
                    <label for="password">새 비밀번호 입력</label>
                    <input type="password" id="password" name="password" placeholder="8~16자의 영문 대/소문자, 숫자, 특수문자" required><br>
                    <label for="confirm_password">한번 더 입력</label>
                    <input type="password" id="confirm_password" name="confirm_password" placeholder="비밀번호를 재 입력해주세요." required><br>
                    <button class="certification_button" type="submit" id="verifyCodeBtn">비밀번호 변경</button>
                </form>    
            </div>
            
            <a href="/">
                <img class="searchLogo" src="/resources/img/Logo.png" alt="logo">
            </a>
        </div>
    </div>
    
    <script>
    // JavaScript 변수에 값을 할당
    var userEmail = "<%= request.getAttribute("userEmail") %>";
    var changeStatus = "<%= request.getAttribute("changeStatus") %>";
    var passwordStatus = "<%= request.getAttribute("passwordStatus") %>";
    var alertStatus = "";
    </script>
    <script src="/resources/js/member/searchPage.js"></script>
</body>
</html>
