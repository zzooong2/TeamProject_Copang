function searchType(boardProNo, boardProTitle, businessServicePay) {
	let objectTypeArr = document.getElementsByName("rightTabList01");
	
	const setBoardProNo = document.getElementById("boardProNo");
	const setObjectTitle = document.getElementById("objectTitle");
	const setObjectPrice = document.getElementById("objectPrice"); 
	const setObjectType = document.getElementById("objectType"); 
	
	setBoardProNo.value = boardProNo;
	setObjectTitle.value = boardProTitle;
	setObjectPrice.value = businessServicePay;
		
	if (objectTypeArr[0].checked == true) {
		setObjectType.value = "STANDARD";
	} else if (objectTypeArr[1].checked == true) {
		setObjectType.value = "DELUXE";
	} else if (objectTypeArr[2].checked == true) {
		setObjectType.value = "PREMIUM";
	}
	
	console.log(setBoardProNo.value);
	console.log(setObjectTitle.value);
	console.log(setObjectPrice.value);
	console.log(setObjectType.value);

	const typeForm = document.getElementById("type");
		
	typeForm.action = "/payment/orderPage.do";
	typeForm.method = "GET";
	typeForm.submit();
}

