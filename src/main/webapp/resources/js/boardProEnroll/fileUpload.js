const dataTransfer = new DataTransfer();

document.getElementById("file").addEventListener("change", function() {

	const maxImages = 3; // 최대 이미지 개수

	if (event.target.files.length > maxImages) {
		alert(`이미지는 ${maxImages}장까지 업로드할 수 있습니다.`);
		return;
	}

	for (let image of event.target.files) {
		// 이미지 개수가 최대 개수에 도달했을 경우 추가 중단
		if (document.querySelectorAll("div#image_container img").length >= maxImages) {
			alert(`이미지는 ${maxImages}장까지 업로드할 수 있습니다.`);
			return;
		}

	}
		let fileArr = document.getElementById("file").files;

		if (fileArr != null && fileArr.length > 0 && dataTransfer.files.length < 3) {

			for (var i = 0; i < fileArr.length; i++) {
				dataTransfer.items.add(fileArr[i])
			}
			document.getElementById("file").files = dataTransfer.files;
			console.log("dataTransfer =>", dataTransfer.files);
			console.log("input FIles =>", document.getElementById("file").files)

		} else {
			alert(`이미지는 ${maxImages}장까지 업로드할 수 있습니다.`);
			return;
		}

	})
