function searchType(boardProNo, boardProTitle, businessServicePay, fileName) {
	let objectTypeArr = document.getElementsByName("rightTabList01");
	
	const setBoardProNo = document.getElementById("boardProNo");
	const setObjectTitle = document.getElementById("objectTitle");
	const setObjectPrice = document.getElementById("objectPrice"); 
	const setObjectType = document.getElementById("objectType");
	const setImage = document.getElementById("fileName");
	
	setBoardProNo.value = boardProNo;
	setObjectTitle.value = boardProTitle;
	setObjectPrice.value = businessServicePay;
	setImage.value = fileName;	
	
	if(objectTypeArr.length > 0 ) {
			if (objectTypeArr[0].checked == true) {
			setObjectType.value = "STANDARD";
		} else if (objectTypeArr[1].checked == true) {
			setObjectType.value = "DELUXE";
		} else if (objectTypeArr[2].checked == true) {
			setObjectType.value = "PREMIUM";
		}
	} else {
		setObjectType.value = "SINGLE";
	}

	const typeForm = document.getElementById("type");
		
	typeForm.action = "/payment/orderPage.do";
	typeForm.method = "GET";
	typeForm.submit();
}

