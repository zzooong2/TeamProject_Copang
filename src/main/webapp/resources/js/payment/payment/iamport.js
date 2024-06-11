function iamport(){
	const {IMP} = window;

	const price = document.getElementById("total-amount").innerHTML; // 결제금액
	const priceArr = price.split("<span>").map(Number); // 가져온 값 문자열 나누기
	
	const objectTitle = document.getElementById("object-title").innerHTML; // 결제 제품명
	const objectCeller = document.getElementById("object-celler").innerHTML; // 판매자
	
	console.log(priceArr[0]);
	console.log(objectTitle);
	console.log(objectCeller);
	
	
	IMP.init('imp31410636'); // 가맹점 식별코드
	IMP.request_pay({
		pg: 'html5_inicis',
		pay_method: 'card',
		name: objectTitle,
		amount: priceArr[0],
		buyer_name: objectCeller,
	}, res => {
		if(res.success) {
			console.log("성공");
			
			$.ajax({
				type: "POST",
				url: "/payment/complete.do",
				data: { priceArr : priceArr[0],
						objectTitle : objectTitle,
						objectCeller : objectCeller,
					   },
				success: function(success){
					window.location.href='/views/payment/completeOrder.jsp';
				},
				error: function(error){
					console.log("실패");
				}
			});
		} else{
			console.log("실패", res.error_msg);
		}
 	});
}