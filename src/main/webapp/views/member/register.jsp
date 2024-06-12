<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        	<%@ include file="/views/common/head.jsp" %>
        	<link rel="icon" href="/resources/img/tapIcon.png">
            <link rel="stylesheet" href="/resources/css/member/register.css">
        	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   <!-- 제이쿼리 주소? -->
        	<!-- SweetAlert2 CSS -->
    		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.11.1/dist/sweetalert2.min.css">
    		<!-- SweetAlert2 JavaScript -->
    		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.11.1/dist/sweetalert2.all.min.js"></script>
    </head>

    <body>
        <%@ include file="/views/common/header.jsp" %>
    
    <br><br><br><br><br><br><br><br>
    <div id="main" class="register-page">
        <div class="register-container">
            <h2 class="가입">간단한 정보만 입력! 가입완료!</h2>
            <form action="/member/register.do" id="registerForm" method="POST">
            <input type="hidden" id="duplicateCheck" name="duplicateCheck">
            
            
                <label for="username">이름</label>
                <br>
                <input type="text" id="user_name" name="user_name" placeholder="이름을 입력해 주세요." oninput="inputname()" required>
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
				
				
                <label for="phone">연락처</label> <br>
				<input type="tel" id="phone" name="phone" placeholder="연락처를 입력해 주세요. (-)미포함" required>
				<div id="textphone"></div>
				
				<button type="button" name="requestCode" id="requestCodeBtn" onclick="inputphone()">인증번호 받기</button>
				<br>
				<div id="verificationCodeContainer" style="display: none;">
    			<label for="verificationCode">인증번호</label> <br>
    			<input type="text" id="verificationCode" name="verificationCode" placeholder="인증번호를 입력해 주세요." required>
    			<button type="button" id="verifyCodeBtn">확인</button>
				</div>

                <label>회원 유형</label> <br>
                <input type="radio" id="expert" name="user_type" value="전문가" required onclick="toggleBusinessField()">
                <label for="expert">전문가</label>
                <input type="radio" id="client" name="user_type" value="의뢰자" required onclick="toggleBusinessField()">
                <label for="client">의뢰자</label>
                <br>

                <label for="business_field">비즈니스 분야</label> <br>
                <div id="business_field">
                    <label for="business_it"><input type="checkbox" id="business_it" class="business-checkbox" name="business_field" onclick="inputIt()" value="1"> IT.프로그래밍</label>
                    <label for="business_video"><input type="checkbox" id="business_video" class="business-checkbox" name="business_field" onclick="inputVideo()" value="2"> 영상 및 사진</label>
                    <label for="business_design"><input type="checkbox" id="business_design" class="business-checkbox" name="business_field" onclick="inputDesign()" value="3"> 디자인</label>
                    <label for="business_marketing"><input type="checkbox" id="business_marketing" class="business-checkbox" name="business_field" onclick="inputMarketing()" value="4"> 마케팅</label>
                    <label for="business_education"><input type="checkbox" id="business_education" class="business-checkbox" name="business_field" onclick="inputEducation()" value="5"> 교육</label>
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
    <br><br><br><br><br><br><br><br><br>
    
    <%@ include file="/views/common/footer.jsp" %>
        <script src="/resources/js/member/register.js"></script>
        
        <script>
        let verificationCode = 0;

        $(document).ready(function() {
            // 인증번호 받기 버튼 클릭 이벤트
            $('#requestCodeBtn').on('click', function() {
                var phone = $('#phone').val();
                var patternphone = /^[0-9]{10,11}$/;
                
                if (!patternphone.test(phone)) {
                	Swal.fire('알림', '올바른 핸드폰 번호를 입력해주세요.', 'success');
                } else if(patternphone.test(phone)) {
                $.ajax({
                    url: '/send-sms',  // 서블릿의 URL
                    type: 'POST',
                    data: { phone: phone },
                    success: function(response) {
                    	console.log(response);
                    	verificationCode = response;
                    	Swal.fire('알림', '인증번호가 전송되었습니다.', 'success');
                        $('#verificationCodeContainer').show(); // 인증번호 입력란 보이기
                    },
                    error: function(error) {
                        console.error('Error:', error);
                    }
                });
                	
                }
            });

            // 인증번호 입력란에서 키 입력 이벤트
            $('#verifyCodeBtn').on('click', function() {
                var userInputCode = $('#verificationCode').val();
                if(userInputCode === verificationCode) {
                	Swal.fire('알림', '인증에 성공하셨습니다.', 'success');
                    Flag = true;
                } else {
                    Swal.fire('알림', '인증번호가 올바르지 않습니다.', 'error');
                    Flag = false;
                }
            });
        }); 
    </script>
        
        
</body>
</html>