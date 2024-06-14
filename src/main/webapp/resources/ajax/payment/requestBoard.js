function requestBoardShow(){
	const title = document.getElementById("title").value;
	const contents = document.getElementById("editorTxt").value;
	const boardNo = document.getElementById("boardProNo").value;
	
	$.ajax({
		type: "POST",
		url: "/request/enroll.do",
		data: {title : title, // { key : value } 
				contents : contents,
				boardNo : boardNo
			   },

		success: function(success){
			// 값을 , 기준으로 나눠 배열로 저장
			let successValue = success.split(",");
			console.log(successValue[0]);
			console.log(successValue[1]);

			if(successValue[0] === "success") {
				document.getElementsByClassName("request-detail")[0].style.display="none"; 
				document.getElementsByClassName("submit-btn")[0].style.display="none"; 
				document.getElementsByClassName("request-success")[0].style.display="block";
				document.getElementById("requestNo").value=successValue[1];
			}
			
		},
		error: function(error) {
					
		}
	})
}


function requestEditShow() {
	const rNo = document.getElementById("requestNo").value;
	const title = document.getElementById("title").value;
	const contents = document.getElementById("editorTxt").value;
	
	$.ajax({
		type: "GET",
		url: "/request/edit.do",
		data: {rNo : rNo,
			   title : title,
			   contents : contents
			  },
	
		success: function(success){
			console.log("성공");
			if(success === "success"){
			document.getElementsByClassName("request-success")[0].style.display="none";
			document.getElementsByClassName("request-detail")[0].style.display="block";
			document.getElementsByClassName("edit-enroll-btn")[0].style.display="block";
			}
		},
		error: function(error){
			
		}
	}) 
}

function requestEditEnroll() {
	const rNo = document.getElementById("requestNo").value;
	const title = document.getElementById("title").value;
	const contents = document.getElementById("editorTxt").value;
	
	$.ajax({
		type: "POST",
		url: "/request/editEnroll.do",
		data: {rNo : rNo,
			   title : title,
			   contents : contents
			  },
		success: function(success){
			if(success === "success"){
				document.getElementsByClassName("request-detail")[0].style.display="none";		
				document.getElementsByClassName("request-success")[0].style.display="block";
			}
		},
		error: function(error){
			
		}
	})
}