function iamport(){
	const {IMP} = window

	const price = document.getElementById("total-amount").innerHTML; // 결제금액
	const priceArr = price.split("<span>").map(Number); // 가져온 값 문자열 나누기
	
	const objectTitle = document.getElementById("object-title").innerHTML; // 결제 제품명
	const objectCeller = document.getElementById("object-celler").innerHTML; // 판매자

	// 가맹점 식별코드
	IMP.init('imp31410636');
	IMP.request_pay({
		pg: 'html5_inicis',
		pay_method: 'card',
		merchant_uid: '12345', // 주문번호
		name: objectTitle,
		amount: priceArr[0],
		buyer_name: objectCeller,
	}, res => {
		if(res.success) {
			console.log("성공");
			
			$.ajax({
				type: "POST",
				url: "/payment/complete.do",
				data: { 
						
					   }, 
			})
			
		} else{
			console.log("실패", res.error_msg);
		}
 	});
}