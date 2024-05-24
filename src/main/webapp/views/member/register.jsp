<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <%@ include file="/views/common/head.jsp" %>
            <link rel="stylesheet" href="/resources/css/member/register.css">
    </head>

    <body>
        <%@ include file="/views/common/header.jsp" %>


            <div id="main" style="padding-top: 200px;">

                <div class="register-container">
                    <h2 class="가입">회원가입</h2>
                    <form action="register" method="post">
                        <label for="username">이름</label>
                        <br>
                        <input type="text" id="user_name" name="user_name" placeholder="이름을 입력해 주세요." required>
                        <br>

                        <label for="email">이메일</label> <br>
                        <input type="email" id="email" name="email" placeholder="이메일을 입력해 주세요." required>
                        <br>

                        <label for="password">비밀번호</label> <br>
                        <input type="password" id="password" name="password" placeholder="비밀번호를 입력해 주세요. (8자리 이상)"
                            required>
                        <br>
                        <input type="password" id="confirm_password" name="confirm_password"
                            placeholder="비밀번호를 한번 더 입력해 주세요." required>
                        <br>

                        <label for="phone">연락처</label> <br>
                        <input type="tel" id="phone" name="phone" placeholder="연락처를 입력해 주세요." required>
                        <br>

                        <label>회원 유형</label> <br>
                        <input type="radio" id="expert" name="user_type" value="expert" required
                            onclick="toggleBusinessField()">
                        <label for="expert">전문가</label>
                        <input type="radio" id="client" name="user_type" value="client" required
                            onclick="toggleBusinessField()">
                        <label for="client">의뢰자</label>
                        <br>

                        <label for="business_field">비즈니스 분야</label> <br>
                        <div id="business_field">
                            <label><input type="checkbox" class="business-checkbox" name="business_field" value="IT">
                                IT</label>
                            <label><input type="checkbox" class="business-checkbox" name="business_field"
                                    value="design"> 디자인</label>
                            <label><input type="checkbox" class="business-checkbox" name="business_field" value="music">
                                음악</label>
                            <label><input type="checkbox" class="business-checkbox" name="business_field"
                                    value="marketing"> 마케팅</label>
                            <label><input type="checkbox" class="business-checkbox" name="business_field" value="video">
                                영상</label>
                        </div>
                        <br><br>

                        <div class="consent-section">
                            <label><input type="checkbox" id="agree_all" name="agree_all"
                                    onclick="toggleCheckboxes(this)"> 모두 동의합니다.</label>
                            <br>
                            <label><input type="checkbox" class="individual-consent" id="over_14" name="over_14"
                                    required> 만 14세 이상입니다. <span class="required">(필수)</span></label>
                            <br>
                            <label><input type="checkbox" class="individual-consent" id="terms_of_service"
                                    name="terms_of_service" required> 서비스 이용약관에 동의합니다. <span
                                    class="required">(필수)</span></label>
                            <br>
                            <label><input type="checkbox" class="individual-consent" id="privacy_policy"
                                    name="privacy_policy" required> 개인정보 수집/이용에 동의합니다. <span
                                    class="required">(필수)</span></label>
                            <br>
                            <label><input type="checkbox" class="individual-consent" id="marketing" name="marketing">
                                마케팅 수신・홍보 목적의 개인정보 수집 및 이용에 동의합니다. <span class="optional">(선택)</span></label>
                            <br><br>
                        </div>

                        <button type="submit">회원가입</button> <br>
                    </form>
                </div>


            </div>
            <hr>
            <%@ include file="/views/common/footer.jsp" %>
    </body>

    </html>

    <script>
        function toggleCheckboxes(source) {
            const checkboxes = document.querySelectorAll('.individual-consent');
            checkboxes.forEach(checkbox => checkbox.checked = source.checked);
        }

        function toggleBusinessField() {
            const userType = document.querySelector('input[name="user_type"]:checked').value;
            const checkboxes = document.querySelectorAll('.business-checkbox');

            checkboxes.forEach(checkbox => {
                checkbox.checked = false;
                checkbox.disabled = false;
            });

            if (userType === 'expert') {
                checkboxes.forEach(checkbox => {
                    checkbox.addEventListener('change', handleExpertCheckboxChange);
                });
            } else {
                checkboxes.forEach(checkbox => {
                    checkbox.removeEventListener('change', handleExpertCheckboxChange);
                });
            }
        }

        function handleExpertCheckboxChange(event) {
            const checkboxes = document.querySelectorAll('.business-checkbox');
            const currentCheckbox = event.target;

            if (currentCheckbox.checked) {
                checkboxes.forEach(checkbox => {
                    if (checkbox !== currentCheckbox) {
                        checkbox.checked = false;
                    }
                });
            }
        }
    </script>