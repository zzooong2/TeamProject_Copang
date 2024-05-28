<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <%@ include file="/views/common/head.jsp" %>
            <link rel="stylesheet" href="/resources/css/member/register.css">
        
    </head>

    <body>
        <%@ include file="/views/common/header.jsp" %>
    
    <div id="main" class="register-page">
        <div class="register-container">
            <h2 class="가입">간단한 정보만 입력! 가입완료!</h2>
            <form id="registerForm" action="/registerForm" method="post">
                <label for="username">이름</label>
                <br>
                <input type="text" id="user_name" name="user_name" placeholder="이름을 입력해 주세요." onkeyup="inputname()" required>
                <div id="textname"></div>

                <label for="email">이메일</label> <br>
                <input type="email" id="email" name="email" placeholder="이메일을 입력해 주세요." onkeyup="inputemail()" required>
                <div id="textemail"></div>

                <label for="password">비밀번호</label> <br>
                <input type="password" id="password" name="password" placeholder="비밀번호를 입력해 주세요.(8자리 이상)" onkeyup="inputpwd()" required>
                <div id="textpwd"></div>
                <label for="password">비밀번호 확인</label> <br>
                <input type="password" id="confirm_password" name="confirm_password" placeholder="비밀번호를 한번 더 입력해 주세요." onkeyup="inputpwd()" required>
                <div id="textpwd2"></div>
				
				<form action="/send-sms" method="post">
                <label for="phone">연락처</label> <br>
                <input type="tel" id="phone" name="phone" placeholder="연락처를 입력해 주세요. (-)미포함" required>
                <button type="submit" name="requestCode">인증번호 받기</button>
                </form>
                <form action="/send-sms" method="post">
    			<input type="text" name="verificationCode" placeholder="인증번호 입력" required>
    			<button type="submit" name="verifyCode">인증 확인</button>
				</form>
                <br>

                <label>회원 유형</label> <br>
                <input type="radio" id="expert" name="user_type" value="expert" required onclick="toggleBusinessField()">
                <label for="expert">전문가</label>
                <input type="radio" id="client" name="user_type" value="client" required onclick="toggleBusinessField()">
                <label for="client">의뢰자</label>
                <br><br>

                <label for="business_field">비즈니스 분야</label> <br>
                <div id="business_field">
                    <label for="business_it"><input type="checkbox" id="business_it" class="business-checkbox" name="business_field" onclick="inputIt()" value="IT"> IT.프로그래밍</label>
                    <label for="business_video"><input type="checkbox" id="business_video" class="business-checkbox" name="business_field" onclick="inputVideo()" value="Video"> 영상 및 사진</label>
                    <label for="business_design"><input type="checkbox" id="business_design" class="business-checkbox" name="business_field" onclick="inputDesign()" value="Design"> 디자인</label>
                    <label for="business_marketing"><input type="checkbox" id="business_marketing" class="business-checkbox" name="business_field" onclick="inputMarketing()" value="Marketing"> 마케팅</label>
                    <label for="business_education"><input type="checkbox" id="business_education" class="business-checkbox" name="business_field" onclick="inputEducation()" value="Education"> 교육</label>
                </div>
				<br>                
			<div class="agree_container">
                <div class="consent-section">
                    <label><input type="checkbox" id="agree_all" name="agree_all" onclick="toggleCheckboxes(this)"> 모두 동의합니다.</label>
                    <label><input type="checkbox" class="individual-consent" id="over_14" name="over_14" required> 만 14세 이상입니다. <span class="required">(필수)</span></label>
                    <label><input type="checkbox" class="individual-consent" id="terms_of_service" name="terms_of_service" required> 서비스 이용약관에 동의합니다. <span class="required">(필수)</span></label>
                    <label><input type="checkbox" class="individual-consent" id="privacy_policy" name="privacy_policy" required> 개인정보 수집/이용에 동의합니다. <span class="required">(필수)</span></label>
                    <label><input type="checkbox" class="individual-consent" id="marketing" name="marketing" > 마케팅 수신・홍보 목적의 개인정보 수집 및 이용에 동의합니다. <span class="optional">(선택)</span></label>
                    <br><br>
                </div>
			</div>
                <button type="button" id="submitButton" onclick="registerClick()">회원가입</button> <br>
            </form>
        </div>
    </div>
    <hr>
    <%@ include file="/views/common/footer.jsp" %>
        <script src="/resources/js/member/register.js"></script>
</body>
</html>