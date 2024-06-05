function requestBoardShow(){
	const title = document.getElementById("title").value;
	const contents = document.getElementById("editorTxt").value;
	
	$.ajax({
		type: "POST",
		url: "/request/enroll.do",
		data: {title : title, 
				contents : contents
			   },

		success: function(success){
			if(success === "success") {
				
			} else {
				
			}
		},
		error: function(error) {
			
		}
	})
}