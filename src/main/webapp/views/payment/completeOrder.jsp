<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 완료</title>

	 <!-- tab-icon -->
    <link rel="icon" href="../../../resources/img/tapIcon.png" />
	
    <link rel="stylesheet" href="../../resources/css/payment/completeOrder/completeHeader.css">
    <link rel="stylesheet" href="../../resources/css/payment/completeOrder/completeOrderList.css">
    
	<link rel="stylesheet" href="../../../resources/css/common/footer.css">
</head>
<body>
    <header>
        <div class="header">
            <img src="../../resources/img/Logo.png" alt="로고">
            <div class="header-font-number-1">1</div>
            <span class="header-font-1"> 주문확인 및 결제 </span>
            <span class="header-font-next-arrow"> > </span>
            <div class="header-font-number-2">2</div>
            <span class="header-font-2"> 주문 완료 </span>
        </div>
    </header>

    <section>
        <div class="none"></div>
    </section>

    <section class="complete-order-section">
        <div class="order-list">
            <h1>주문내역</h1>
            <div class="order-flex">
                <div class="item-1">
                    <img src="../../resources/img/item1.png" alt="제품사진">
                </div>
                <div class="item-2">
                    <h4>B2B 전문 번역 회사의 고품질 대량 전문 번역 서비스</h4>
                    <h6>한국 아이시스</h6>
                </div>
                <div class="item-3">
                    <h4>
                        <span class="amount-item-1">주문금액</span>
                    </h4>
                    <h4>
                        <span class="fee-item-1">수수료</span>
                    </h4>
                    <h4>
                        <span class="point-item-1">코팡캐시</span>
                    </h4>
                    <h4>
                        <span class="total-item-1">총 주문 금액</span>
                    </h4>
                </div>
                <div class="item-4">
                    <h4>
                        <span class="amount-item-2" id="amount">60000<span>원</span></span>
                    </h4>
                    <h4>
                        <span class="fee-item-2" id="fee">2100<span>원</span></span>
                    </h4>
                    <h4>
                        <span class="point-item-2" id="point">0<span>원</span></span>
                    </h4>
                    <h4>
                        <span class="total-item-2" id="total">62100<span>원</span></span>
                    </h4>
                </div>
            </div>      
        </div>
        
        <h1 class="complete-text">주문이 완료되었습니다.</h1>
    </section>
    
    
    <section>
    	<div class="request-space">
    		<div class="request">
    			<input class="request-title" value="" disabled>
    			<br>
    			<br>
    			<input class="request-contents" value="" disabled></input>
    		</div>
    	</div>
    </section>
    <%@ include file="/views/common/footer.jsp"%>
</body>
</html>