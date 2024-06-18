<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 완료</title>

	 <!-- tab-icon -->
    <link rel="icon" href="/resources/img/tapIcon.png" />
	
    <link rel="stylesheet" href="/resources/css/payment/completeOrder/completeHeader.css">
    <link rel="stylesheet" href="/resources/css/payment/completeOrder/completeOrderList.css">
    
	<link rel="stylesheet" href="/resources/css/common/footer.css">
</head>
<body>
    <header>
        <div class="header">
            <a href="/"><img src="/resources/img/Logo.png" alt="로고" class="logo"></a>
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
            <h1 class="order-text">주문내역</h1>
               <img src="/resources/upload/main/${result.fileName}" alt="${result.fileName}" class="img">
               
               <h4 class="item-2">${result.boardTitle}</h4>
               
               <div class="item-3">
	               	<span class="amount-item-1">주문금액</span>
			        <span class="amount-item-2" id="amount">${result.businessPay} 원</span>
               </div>
               
               <div class="item-4">
			        <span class="fee-item-1">주문번호</span>
			        <span class="fee-item-2" id="fee">${result.orderNo}</span>
               </div>
        </div>
        <h1 class="complete-text">주문이 완료되었습니다.</h1>
    </section>
    
    <section>
	    	<div class="request-space">
	    		<div class="request">
	    			<div class="request-title">${result.requestTitle}</div>
	    			<br>
	    			<br>
	    			<div class="request-contents">${result.requestContents}</div>
	    		</div>
	    	</div>
    </section>
    <%@ include file="/views/common/footer.jsp"%>
</body>
</html>