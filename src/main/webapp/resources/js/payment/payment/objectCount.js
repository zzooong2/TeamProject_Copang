// 제품 초기가격
const objectPrice = parseInt(document.getElementById('price').innerHTML);
const feePercent = 0.035;

function count(type)  {
	const finalAmountVal = document.getElementById("final-amount"); // 주문금액
	
	let finalAmountSplit = finalAmountVal.innerText.split("원");
	const finalAmount = finalAmountSplit[0];
    // tag
    const objectElement = document.getElementById('object-count'); // 수량
    const dateElement = document.getElementById('date-count'); // 작업일
    const priceElement = document.getElementById('price'); // 가격
	
    const amountFee = document.getElementById('fee'); // 수수료
    const totalAmount = document.getElementById('total-amount'); // 합계금액

    // value
    let object = parseInt(objectElement.innerText.replace(/,/g, '')); // 수량
    let date = parseInt(dateElement.innerText.replace(/,/g, '')); // 작업일
    let price = parseInt(priceElement.innerHTML.replace(/,/g, '')); // 가격

    let amount = parseInt(String(finalAmount).replace(/,/g, '')); // 주문 금액

    let fee = parseInt(amountFee.innerHTML.replace(/,/g, '')); // 수수료

    let total = parseInt(totalAmount.innerHTML.replace(/,/g, '')); // 합계 금액

    // cal
    let calPrice = 0;
    let calAmount = 0;
    let calFee = 0;
    let calTotal = 0;

    // 더하기/빼기
    if(type === 'plus' && object >= 1) {
        object += 1; // 수량 증가
        date += 1; // 작업일 증가
        calPrice = price + objectPrice; // 가격 증가
        calAmount = amount + objectPrice; // 주문금액 증가
        calFee = Math.round((amount + objectPrice) * feePercent); // 수수료 증가

        calTotal = calAmount + calFee; // 합계 금액 증가
    }else if(type === 'minus' && object >= 1)  {
        object -= 1; // 수량 감소
        date -= 1; // 작업일 감소 
        calPrice = price - objectPrice; // 가격 감소

        calAmount = amount - objectPrice; // 주문금액 감소
        calFee = fee - Math.round(objectPrice*feePercent); // 수수료 감소

        calTotal = calAmount - calFee; // 합계 금액 증가
    }

    // 결과 출력
    objectElement.innerText = object;
    dateElement.innerText = date;
    priceElement.innerHTML =  calPrice.toLocaleString() + "<span>원</span>";
    finalAmountVal.innerHTML = calAmount.toLocaleString() + "<span>원</span>";
    amountFee.innerHTML = calFee.toLocaleString() + "<span>원</span>";
    totalAmount.innerHTML = calTotal.toLocaleString() + "<span>원</span>";
}
