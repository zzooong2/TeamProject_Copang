// const dataTransfer = new DataTransfer();

// document.getElementById("file").addEventListener("change", function() {

// 	const maxImages = 3; // 최대 이미지 개수

// 	if (event.target.files.length > maxImages) {
// 		alert(`이미지는 ${maxImages}장까지 업로드할 수 있습니다.`);
// 		return;
// 	}

// 	for (let image of event.target.files) {
// 		// 이미지 개수가 최대 개수에 도달했을 경우 추가 중단
// 		if (document.querySelectorAll("div#image_container img").length >= maxImages) {
// 			alert(`이미지는 ${maxImages}장까지 업로드할 수 있습니다.`);
// 			return;
// 		}

// 	}
// 		let fileArr = document.getElementById("file").files;

// 		if (fileArr != null && fileArr.length > 0 && dataTransfer.files.length < 3) {

// 			for (var i = 0; i < fileArr.length; i++) {
// 				dataTransfer.items.add(fileArr[i])
// 			}
// 			document.getElementById("file").files = dataTransfer.files;
// 			console.log("dataTransfer =>", dataTransfer.files);
// 			console.log("input FIles =>", document.getElementById("file").files)

// 		} else {
// 			alert(`이미지는 ${maxImages}장까지 업로드할 수 있습니다.`);
// 			return;
// 		}

// 	})


document.addEventListener("DOMContentLoaded", function() {
    // 첫 번째 파일 업로드 input 요소
    var fileInput1 = document.getElementById("Detail_right_Contents4_fileInput1");
    var preview1 = document.getElementById("Detail_right_Contents4_imagePreviews1");
    var imageCountDisplay1 = document.getElementById("imageCountDisplay1");

    fileInput1.addEventListener("change", function(event) {
        var files = event.target.files;

        // 2개 이상의 파일이 등록되면 경고창을 띄우고 파일을 제거합니다.
        if (files.length > 1) {
            alert("파일은 1개만 등록 가능합니다.");
            fileInput1.value = "";
            return;
        }

        preview1.style.backgroundImage = "none"; // 배경 이미지를 제거합니다.
        preview1.innerHTML = ""; // 기존의 프리뷰를 초기화합니다.

        var file = files[0]; // 첫 번째 파일만 가져옵니다.

        if (file) {
            var reader = new FileReader();

            reader.onload = function(e) {
                var img = document.createElement("img");
                img.src = e.target.result;
                preview1.appendChild(img);
            };

            reader.readAsDataURL(file);
        } else {
            // 파일이 선택되지 않았을 때 기본 배경 이미지를 설정합니다.
            preview1.style.backgroundImage = "url('default_image.jpg')";
        }

        // 파일 업로드 수량 표시를 갱신합니다.
        imageCountDisplay1.textContent = "1/1";
    });

    // 두 번째 파일 업로드 input 요소
    var fileInput2 = document.getElementById("Detail_right_Contents4_fileInput2");
    var preview2 = document.getElementById("Detail_right_Contents4_imagePreviews2");
    var imageCountDisplay2 = document.getElementById("imageCountDisplay2");

    fileInput2.addEventListener("change", function(event) {
        var files = event.target.files;

        // 6개 이상의 파일이 등록되면 경고창을 띄우고 파일을 제거합니다.
        if (files.length > 5) {
            alert("파일은 최대 5개까지 등록 가능합니다.");
            fileInput2.value = "";
            return;
        }

		preview2.style.backgroundImage = "none"; // 배경 이미지를 제거합니다.

        // 기존의 프리뷰를 초기화하지 않고 새로운 이미지를 추가합니다.
        Array.from(files).forEach(function(file) {
            var reader = new FileReader();

            reader.onload = function(e) {
                var img = document.createElement("img");
                img.src = e.target.result;
                preview2.appendChild(img);
            };

            reader.readAsDataURL(file);
        });

        // 파일 업로드 수량 표시를 갱신합니다.
		var totalImages = preview2.querySelectorAll("img").length + files.length;
    	imageCountDisplay2.textContent = totalImages + "/" + '5';
    });

    // 프리뷰에 나타나는 이미지를 클릭하여 삭제합니다.
    preview1.addEventListener("click", function(event) {
        if (event.target.tagName === "IMG") {
            event.target.remove();
            // 파일 업로드 수량 표시를 갱신합니다.
            imageCountDisplay1.textContent = "0/1";
        }
    });

    preview2.addEventListener("click", function(event) {
        if (event.target.tagName === "IMG") {
            event.target.remove();
            // 파일 업로드 수량 표시를 갱신합니다.
            imageCountDisplay2.textContent = preview2.querySelectorAll("img").length + "/" + Math.min(5, preview2.querySelectorAll("img").length);
        }
    });
});

document.getElementById('Detail_right_Contents4_imagePreviews1').addEventListener('click', function() {
    document.getElementById('Detail_right_Contents4_fileInput1').click();
});

document.getElementById('Detail_right_Contents4_imagePreviews2').addEventListener('click', function() {
    document.getElementById('Detail_right_Contents4_fileInput2').click();
});



