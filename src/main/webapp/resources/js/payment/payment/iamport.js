function iamport(){
	const {IMP} = window;

	const price = document.getElementById("total-amount").innerHTML; // 결제금액
	const priceArr = price.split("<span>원</span>"); // 가져온 값 문자열 나누기
	
	const objectTitle = document.getElementById("object-title").innerHTML; // 결제 제품명
	const objectNo = document.getElementById("boardProNo").innerHTML; // 게시글 번호
	
	console.log(objectNo)
		
	const paymentPrice = priceArr[0].replace(",", "");
	
	IMP.init('imp31410636'); // 가맹점 식별코드
	IMP.request_pay({
		pg: 'html5_inicis',
		pay_method: 'card',
		name: objectTitle,
		amount: paymentPrice
	}, res => {
		if(res.success) {
			console.log("성공");
			
			$.ajax({
				type: "POST",
				url: "/payment/complete.do",
				data: { priceArr : priceArr[0],
						objectTitle : objectTitle
					   },
				success: function(success){
					window.location.href='/payment/completeOrder.do?price=' + priceArr[0] + '&objectTitle=' + objectTitle + '&objectNo=' + objectNo;
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