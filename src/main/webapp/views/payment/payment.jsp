<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문확인 및 결제</title>
    <link rel="stylesheet" href="/resources/css/payment/paymentPage/header.css">
    <link rel="stylesheet" href="/resources/css/payment/paymentPage/orderList.css">
    <link rel="stylesheet" href="/resources/css/payment/paymentPage/paymentRole.css">
    <link rel="stylesheet" href="/resources/css/payment/paymentPage/price.css">
    <link rel="stylesheet" href="/resources/css/payment/paymentPage/requestDetail.css">

     <!-- tab-icon -->
    <link rel="icon" href="/resources/img/tapIcon.png" />

    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- jquery CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- smart Editor -->
    <script src="/resources/static/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="/resources/js/boardProEnroll/smartEditor.js"></script>
    
    <!-- ajax -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="/resources/css/common/footer.css">
</head>

<body>
    <header>
        <div class="header">
            <a href="/"><img src="/resources/img/Logo.png" alt="로고"></a>
            <div class="header-font-number-1">1</div>
            <span class="header-font-1"> 주문확인 및 결제 </span>
            <span class="header-font-next-arrow"> > </span>
            <div class="header-font-number-2">2</div>
            <span class="header-font-2"> 주문 완료 </span>
        </div>
    </header>

    <section class="payment-section">
        <div class="none"></div>

        <div class="payment-text">
            <h1>결제하기</h1> 
        </div>
        
        <div class="payment">
            <div class="order-list">
                <h4>주문 내역</h4> 
                <div class="order-flex">
                    <div class="item-1">
                        <img src="/resources/upload/main/${result.fileName}" alt="${result.fileName}">
                    </div>
                    <div class="item-2">
                        <h4 id="object-title">${result.boardTitle}</h4>
                        <h6 id="object-celler"></h6>
                    </div>
                </div>

                <table>
                    <thead>
                        <tr style="font-size: 12px;">
                            <td style="width: 40vh; text-align: left;">기본항목</td>
                            <td style="width: 10vh; text-align: center;">수량</td>
                            <td style="width: 10vh; text-align: center;">작업일</td>
                            <td style="width: 10vh; text-align: right;">가격</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr style="font-size: 12px; font-weight: bold;">
                            <td style="text-align: left;">${result.boardTitle}</td>
                            <td style="text-align: center;">
                                <input type='button' onclick='count("minus")' class="table-object-count" value='-' />
                                <div id='object-count' class="table-object-number">1</div>
                                <input type='button' onclick='count("plus")' class="table-object-count" value='+' />
                            </td>
                            <td style="text-align: center;">
                                <div id='date-count'>1</div>
                            </td>
                            <td style="text-align: right;">
                                <div id="price">${result.businessPay}</div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="payment-detail">
                <input type="radio" id="account-transfer" class="account-transfer" onclick="paymentView('account')">
                <label for="account-transfer" class="account-label">계좌 이체</label>
                
                <input type="radio" id="mobile-payment" class="mobile-payment" onclick="paymentView('mobile')">
                <label for="mobile-payment" class="mobile-label">휴대폰 결제</label>
                
                <input type="radio" id="card-payment" class="card-payment"  onclick="paymentView('card')">
                <label for="card-payment" class="card-label">카드 결제</label>

                <div class="tax-receipt">
                    <input type="checkbox" class="tax-check"> 세금계산서 발행요청하기
                    <ul>
                        <li>주문 금액에 대한 세금계산서는 거래 주체인 전문가가 직접 발행하며, 세금계산서 발행 가능한 사업자 전문가의 서비스 구매 시에만 신청하실 수 있습니다.</li>
                        <li>수수료에 대한 세금계산서는 코팡이 발행하며, 결제 단계에서 별도로 신청하실 수 있습니다.</li>
                        <li>본 서비스는 사업자 전문가의 서비스이므로 세금계산서 2종을 모두 신청하고 매입세액공제받을 수 있습니다.</li>
                        <li>세금계산서는 구매 확정일(거래 완료일)을 기준으로 발행됩니다.</li>
                        <li>쿠폰 할인 금액은 세금계산서 발행 금액에 포함되지 않습니다. 자세한 내용은 여기를 통해 확인해 주세요.</li>
                        <li>퀵계좌이체(실시간 계좌이체), 무통장입금 선택 시 신청한 '현금영수증'은 매입세액공제가 불가합니다.</li>
                        <li>신용카드 선택 시 발행된 '카드전표'는 결제에 대한 증빙용으로만 사용하실 수 있으며, 매입세액공제가 불가합니다.</li>
                    </ul>
                </div>
            </div>

            <div class="price">
                <h4 class="order-price">
                    <span class="amount-item-1">주문 금액</span>
                    <span class="amount-item-2" id="final-amount">${result.businessPay}<span>원</span></span>
                </h4>

                <h4 class="order-price">
                    <span class="fee-item-1">수수료</span>
                    <span class="fee-item-2" id="fee">2100<span>원</span>
                    </span>
                </h4>
                
                <h4 class="order-price">
                    <span class="point-item-1">코팡 캐시</span>
                    <span class="point-item-2" id="point">0원</span>
                </h4>
                
                <div class="empty-space"></div>

                <h4 class="order-price">
                    <span class="total-item-1">총 결제 금액</span>
                    <span class="total-item-2" id="total-amount"><span>원</span></span>
                </h4>
            </div>
            
            <button type="button" class="payment-btn" id="payment-btn" onclick="iamport()">결제</button>
        </div>

        <h1 class="detail-request-text">의뢰내용</h1>
        <div class="request-detail">
            <div class="detail">
	 			<input type="hidden" id="userNo" name="userNo" value="${result.userNo}">
	 			<input type="hidden" id="boardProNo" name="boardProNo" value="${result.boardNo}" />
	 			<input type="hidden" id="requestNo" name="requestNo" value="" />
	 			
                <input type="text" id="title" name="request-title" placeholder=" 제목을 입력해주세요.(* 현재 페이지 내에서만 작성 및 수정 가능합니다.)" class="request-title">
                <br>
                <br>
                <div id="smarteditor">
                    <textarea id="editorTxt" rows="35" name="request-contents" class="request-content" placeholder=" 내용을 입력하세요."></textarea>
                </div>
            </div>
        </div>
           	<button type="button" class="submit-btn" onclick="save(); requestBoardShow()">등록</button>
            <button type="button" class="edit-enroll-btn" onclick="save(); requestEditEnroll()">수정</button>	
        
       	<div class="request-success">
   			<input type="text" id="title" name="request-title" placeholder="의뢰내용이 성공적으로 저장되었습니다." class="success" disabled>
    		<button type="button" class="edit-btn" onclick="requestEditShow()">수정하기</button>	
       	</div>
       	
    </section>
    <%@ include file="/views/common/footer.jsp"%>
    
<script src="/resources/js/payment/payment/objectCount.js"></script>
<script src="/resources/js/payment/payment/paymentRole.js"></script>

<!-- ajax -->
<script src="/resources/ajax/payment/requestBoard.js"></script>

<!-- 결제 API -->
<script src="/resources/js/payment/payment/iamport.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>

<!-- 주문번호 생성파일 -->
<script src="/resources/js/payment/payment/createOrderNumber.js"></script>

<!-- 수수료 계산 -->
<script>
$(document).ready(function (){
	const amountVal = document.getElementById("final-amount").innerText;
	let amount = amountVal.split("원"); // amount[0] 상품가격

	let fee = 0; // 수수료 
	
	fee = Math.round(amount[0]*0.035);
	
	document.getElementById("fee").innerText = fee + "원";
	document.getElementById("total-amount").innerText = parseInt(amount[0]) + fee;
	
});
</script>	

</body>
</html>