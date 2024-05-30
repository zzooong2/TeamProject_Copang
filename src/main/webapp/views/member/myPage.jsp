<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <%@ include file="/views/common/head.jsp" %>
            <link rel="stylesheet" href="/resources/css/member/myPage.css">
    </head>

    <body>
        <%@ include file="/views/common/header.jsp" %>
            <main class="main">
                <div class="container">
                    <div class="sidebar">
                        <h2>마이페이지</h2>
                        <ul>
                            <li onclick="showSection('profile')">내 정보 수정</li>
                            <li onclick="showSection('password')">비밀번호 변경</li>
                            <li onclick="showSection('Field')">회원/비즈니스 유형</li>
                            <li onclick="showSection('payment')">결제 내역</li>
                            <li onclick="showSection('delete')">회원 탈퇴</li>
                        </ul>
                    </div>
                    <div class="content">
                        <div id="profile" class="section">
                            <h2 style="padding-top:100px; padding-left:100px;">내 정보 수정</h2>
                            <form class="profile_page" id="profileForm">
                                <div class="form-group">
                                    <label for="name">이름</label>
                                    <input type="text" id="name" name="name" value="사용자 이름" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="email">이메일</label>
                                    <input type="email" id="email" name="email" value="user@example.com" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="phone">연락처</label>
                                    <input type="text" id="phone" name="phone" value="010-1234-5678" disabled>
                                    <button type="button" onclick="enablePhoneInput()">번호 변경</button>
                                </div>
                                <div id="phoneInputSection" style="display: none;">
                                    <input type="text" id="newPhone" name="newPhone" placeholder="새 연락처 입력">
                                    <button type="button" onclick="sendVerificationCode()">인증 번호 전송</button>
                                </div>
                                <div class="form-group">
                                    <label>회원 유형</label><br>
                                    <label><input type="checkbox" name="userType" value="전문가" disabled> 전문가</label>
                                    <label><input type="checkbox" name="userType" value="의뢰자" disabled> 의뢰자</label>
                                    <button type="button" onclick="enableUserType()">변경하기</button>
                                </div>
                                <div class="form-group">
                                    <label>비즈니스 분야</label><br>
                                    <label><input type="checkbox" name="businessField" value="IT.프로그래밍" disabled>
                                        IT.프로그래밍</label>
                                    <label><input type="checkbox" name="businessField" value="영상 및 사진" disabled> 영상 및
                                        사진</label>
                                    <label><input type="checkbox" name="businessField" value="디자인" disabled> 디자인</label>
                                    <label><input type="checkbox" name="businessField" value="마케팅" disabled> 마케팅</label>
                                    <label><input type="checkbox" name="businessField" value="교육" disabled> 교육</label>
                                    <button type="button" onclick="enableBusinessField()">변경하기</button>
                                </div>
                                <button type="submit">저장</button>
                            </form>
                        </div>




                        <div id="password" class="section" style="display:none;">
                            <h2 style="padding-top:100px; padding-left:100px;">비밀 번호 변경</h2>
                            <form class="password_page" id="passwordForm">
                            
                            </form>

                        </div>
                        
                        <div id="Field" class="section" style="display:none;">
                            <h2 style="padding-top:100px; padding-left:100px;">회원/비즈니스 유형</h2>

                        </div>

                        <div id="payment" class="section" style="display:none;">
                            <h2 style="padding-top:100px; padding-left:100px;">결제 내역</h2>

                        </div>
                        
                        
                        <div id="delete" class="section" style="display:none;">
                            <h2 style="padding-top:100px; padding-left:100px;">회원 탈퇴</h2>

                        </div>
                        
                    </div>
                </div>
            </main>

            <script src="script.js"></script>
            <%@ include file="/views/common/footer.jsp" %>
                <script src="/resources/js/member/myPage.js"></script>
    </body>

    </html>