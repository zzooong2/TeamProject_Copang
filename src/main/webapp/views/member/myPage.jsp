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
                            <li onclick="showSection('Field')">비즈니스 분야</li>
                            <li onclick="showSection('payment')">결제 내역</li>
                            <li onclick="showSection('delete')">회원 탈퇴</li>
                        </ul>
                    </div>
                    <div class="content">
                        <div id="profile" class="section">
                            <h2>내 정보 수정</h2>
                            <form class="profile_page" id="profileForm">
                                <div class="form_group">
                                    <label for="name">이름</label><br>
                                    <input type="text" id="name" name="name" value="사용자 이름" disabled>
                                </div>
                                <div class="form_group">
                                    <label for="email">이메일</label><br>
                                    <input type="email" id="email" name="email" value="user@example.com" disabled>
                                </div>
                                <div class="form_group">
                                    <label for="phone">연락처</label><br>
                                    <input type="text" id="phone" name="phone" value="010-1234-5678" disabled><br>
                                    <button type="button" onclick="enablePhoneInput()">번호 변경</button>
                                </div>
                                <div id="phoneInputSection" style="display: none;">
                                    <input type="text" id="newPhone" name="newPhone" placeholder="새 연락처 입력">
                                    <button type="button" onclick="sendVerificationCode()">휴대폰 인증</button>
                                </div>
                            </form>
                        </div>

                        <div id="password" class="section">
                            <h2>비밀번호 변경</h2>
                            <form class="password_page" id="passwordForm">
                                <label for="currentPassword">현재 비밀번호</label>
                                <input type="password" id="currentPassword" name="currentPassword"
                                    placeholder="기존 비밀번호를 입력해주세요.">
                                <label for="newPassword">변경할 비밀번호</label>
                                <input type="password" id="newPassword" name="newPassword"
                                    placeholder="변경할 비밀번호를 입력해주세요.">
                                <label for="confirmPassword">한번 더 입력</label>
                                <input type="password" id="confirmPassword" name="confirmPassword"
                                    placeholder="변경할 비밀번호를 한번더 입력해주세요.">
                                <button type="submit">비밀번호 변경</button>
                            </form>
                        </div>

                        <div id="Field" class="section">
                            <h2>비즈니스 분야 변경</h2><br><br>
                            <form class="field_page" id="fieldForm">
                                <div class="form_group">
                                    <label for="business">비즈니스 분야</label><br>
                                    <label><input type="checkbox" name="businessField" value="IT.프로그래밍" disabled>
                                        IT.프로그래밍</label><br>
                                    <label><input type="checkbox" name="businessField" value="영상 및 사진" disabled> 영상 및
                                        사진</label><br>
                                    <label><input type="checkbox" name="businessField" value="디자인" disabled>
                                        디자인</label><br>
                                    <label><input type="checkbox" name="businessField" value="마케팅" disabled> 마케팅</label><br>
                                    <label><input type="checkbox" name="businessField" value="교육" disabled> 교육</label><br>
                                    <button type="button" onclick="enableBusinessField()">변경하기</button>
                                </div>
                            </form>
                        </div>

                        <div id="payment" class="section">
                            <h2>결제 내역</h2>
                            <table class="payment_table">
                                <thead>
                                    <tr>
                                        <th>결제코드</th>
                                        <th>결제일</th>
                                        <th>결제명</th>
                                        <th>결제금액</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>123456</td>
                                        <td>2024-05-01</td>
                                        <td>서비스 A</td>
                                        <td>₩50,000</td>
                                    </tr>
                                    <tr>
                                        <td>789012</td>
                                        <td>2024-05-15</td>
                                        <td>서비스 B</td>
                                        <td>₩75,000</td>
                                    </tr>
                                    <!-- 추가 결제 내역은 여기서 반복 -->
                                </tbody>
                            </table>
                            <div class="payment_notice">
                                <p class="notice_title">꼭 확인해주세요!</p>
                                <ol>
                                    <li>세금계산서는 거래 주체인 전문가가 의뢰인에게 발행합니다.</li>
                                    <li>세금계산서는 사업자 인증 받은 기업전문가에게 요청하실 수 있습니다.</li>
                                    <li>이벤트 쿠폰 사용 금액은 할인된 금액이기 때문에 세금계산서에 포함되지 않습니다.</li>
                                    <li>거래명세서는 결제가 완료되었음을 증명하는 용도로만 활용 가능하며 세무상의 지출증빙 효력이 없습니다.</li>
                                    <li>현금영수증은 개인의 소득공제용으로만 사용 가능하며, 결제 당시 지출 증빙용으로 선택하셨더라도 매입세액공제를 받으실 수 없습니다.</li>
                                </ol>
                            </div>
                        </div>

                        <div id="delete" class="section">
                            <h2>회원 탈퇴</h2>
                            <form class="delete_form" id="deleteForm">
                                <div class="reasons">
                                    <p class="p_text">코팡을 떠나시는 이유를 선택해주세요.</p>
                                    <label><input type="checkbox" name="reason" value="no_service"> 서비스 이용이
                                        불편해요</label>
                                    <label><input type="checkbox" name="reason" value="low_quality"> 서비스 퀄리티가
                                        낮아요</label>
                                    <label><input type="checkbox" name="reason" value="bad_users"> 비매너 회원을
                                        만났어요</label>
                                    <label><input type="checkbox" name="reason" value="frequent_errors"> 잦은 오류가
                                        발생해요</label>
                                    <label><input type="checkbox" name="reason" value="find_alternative"> 대체할 만한 서비스를
                                        찾았어요</label>
                                    <label><input type="checkbox" name="reason" value="benefits_issue"> 쿠폰 · 적립금 등 혜택이
                                        적어요</label>
                                </div>
                                <label for="password">비밀번호를 입력해주세요</label><br>
                                <input type="password" id="password" name="password">
                                <div class="additional_info">
                                    <p>주의사항:</p>
                                    <ul>
                                        <li>현재 사용중인 계정 정보는 회원 탈퇴 후 복구가 불가합니다.</li>
                                        <li>진행 중인 거래건이 있거나 페널티 조치 중인 경우 탈퇴 신청이 불가합니다.</li>
                                        <li>탈퇴 후 회원님의 정보는 전자상거래 소비자보호법에 의거한 코팡 개인정보처리방침에 따라 관리됩니다.</li>
                                    </ul>
                                </div>
                                <button type="submit" id="deleteButton">회원 탈퇴</button>
                            </form>
                        </div>
                    </div>
                </div>
            </main>

            <script src="script.js"></script>
                <script src="/resources/js/member/myPage.js"></script>
            <%@ include file="/views/common/footer.jsp" %>
    </body>

    </html>