// 전역 변수로 카운터를 유지
let counter = 0;


function generateOrderNumber() {
  // 오늘 날짜 가져오기
  const date = new Date();
  const formattedDate = date.toISOString().slice(0, 10).replace(/-/g, '');

  // 1에서 5 사이의 랜덤 숫자 생성
  const randomNumber = Math.floor(Math.random() * 5) + 1;

  // 001부터 시작하여 순차적으로 증가하는 번호 생성
  counter += 1;
  const formattedSequenceNumber = counter.toString().padStart(3, '0');

  // 날짜, 랜덤 숫자, 순차 번호를 결합하여 주문 번호 생성
  return `${formattedDate}${randomNumber}${formattedSequenceNumber}`;
}

// 주문번호
const orderNumber = document.getElementById("create-order-number");
orderNumber.innerText = generateOrderNumber();
