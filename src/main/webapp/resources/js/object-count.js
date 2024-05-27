// 제품 초기가격
const objectPrice = document.getElementById('price').innerHTML;

function count(type)  {
    // 결과를 표시할 element
    const objectElement = document.getElementById('object-count');
    const dateElement = document.getElementById('date-count');
    const priceElement = document.getElementById('price');
    const finalAmount = document.getElementById("final-amount");

    // 현재 화면에 표시된 값
    let object = objectElement.innerText;
    let date = dateElement.innerText;
    let price = priceElement.innerHTML;
    let amount = finalAmount.innerHTML;

    console.log(amount);

    // 더하기/빼기
    if(type === 'plus' && object >= 1) {
        object = parseInt(object) + 1;
        date = parseInt(date) + 1;
        priceElement.innerHTML = parseInt(price) + parseInt(objectPrice);
        finalAmount.innerHTML = parseInt(amount) + parseInt(objectPrice) + "<span>원</span>";
    }else if(type === 'minus' && object >= 1)  {
        object = parseInt(object) - 1;
        date = parseInt(date) - 1;
        priceElement.innerHTML = parseInt(price) - parseInt(objectPrice);
        finalAmount.innerHTML = parseInt(amount) - parseInt(objectPrice)  + "<span>원</span>";

    }
    
    // 결과 출력
    objectElement.innerText = object;
    dateElement.innerText = date;
}