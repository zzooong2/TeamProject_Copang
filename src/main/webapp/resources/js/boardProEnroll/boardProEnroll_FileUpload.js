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





// /////////////////////////////////////////// 파일 업로드 JavaScript \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

const dataTransfer = new DataTransfer();

document.addEventListener("DOMContentLoaded", function() {
    // 첫 번째 파일 업로드 input 요소
    let fileInput1 = document.getElementById("Detail_right_Contents4_fileInput1");
    let preview1 = document.getElementById("Detail_right_Contents4_imagePreviews1");
    let imageCountDisplay1 = document.getElementById("imageCountDisplay1");

    fileInput1.addEventListener("change", function(event) {
        let files = event.target.files;

        // 2개 이상의 파일이 등록되면 경고창을 띄우고 파일을 제거합니다.
        if (files.length > 1) {
            alert("파일은 1개만 등록 가능합니다.");
            fileInput1.value = "";
            return;
        }

        preview1.style.backgroundImage = "none"; // 배경 이미지를 제거합니다.
        preview1.innerHTML = ""; // 기존의 프리뷰를 초기화합니다.

        let file = files[0]; // 첫 번째 파일만 가져옵니다.

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

    // 프리뷰를 클릭하면 파일 선택 창을 엽니다.
    preview1.addEventListener("click", function() {
        fileInput1.click();
    });

    // 두 번째 파일 업로드 input 요소
    let fileInput2 = document.getElementById("Detail_right_Contents4_fileInput2");
    let preview2 = document.getElementById("Detail_right_Contents4_imagePreviews2");
    let imageCountDisplay2 = document.getElementById("imageCountDisplay2");

    fileInput2.addEventListener("change", function(event) {
        let files = event.target.files;

        // 기존에 선택된 파일과 새로운 파일을 합칩니다.
        for (let i = 0; i < files.length; i++) {
            dataTransfer.items.add(files[i]);
        }

        // 5개 이상의 파일이 등록되면 경고창을 띄우고 파일을 제거합니다.
        if (dataTransfer.files.length > 5) {
            alert("파일은 최대 5개까지 등록 가능합니다.");
            for (let i = dataTransfer.files.length - 1; i >= 5; i--) {
                dataTransfer.items.remove(i);
            }
        }

        fileInput2.files = dataTransfer.files;

        // 프리뷰를 갱신합니다.
        preview2.innerHTML = ""; // 기존의 프리뷰를 초기화합니다.
        for (let i = 0; i < dataTransfer.files.length; i++) {
            let file = dataTransfer.files[i];
            let reader = new FileReader();

            reader.onload = function(e) {
                let img = document.createElement("img");
                img.src = e.target.result;
                preview2.appendChild(img);
            };

            reader.readAsDataURL(file);
        }

        // 파일 업로드 수량 표시를 갱신합니다.
        imageCountDisplay2.textContent = dataTransfer.files.length + "/5";
    });

    // 프리뷰를 클릭하면 파일 선택 창을 엽니다.
    preview2.addEventListener("click", function(event) {
        if (event.target.tagName === "IMG") {
            let index = Array.from(preview2.children).indexOf(event.target);
            dataTransfer.items.remove(index);
            fileInput2.files = dataTransfer.files;

            // 프리뷰에서 이미지를 제거합니다.
            event.target.remove();

            // 파일 업로드 수량 표시를 갱신합니다.
            imageCountDisplay2.textContent = dataTransfer.files.length + "/5";
        } else {
            fileInput2.click();
        }
    });
});




// ==========================================================================================================

/*var fileInput2 = document.getElementById("Detail_right_Contents4_fileInput2");
var preview2 = document.getElementById("Detail_right_Contents4_imagePreviews2");
var imageCountDisplay2 = document.getElementById("imageCountDisplay2");
var uploadAllFilesButton = document.getElementById("boardProEnroll_Next_Button3");

fileInput2.addEventListener("change", function(event) {
    var files = event.target.files;

    // 6개 이상의 파일이 등록되면 경고창을 띄우고 파일을 제거합니다.
    if (files.length > 5) { // 등록한 파일의 갯수(수량 = 길이)가 최대 5보다 작을 때
        alert("파일은 최대 5개까지 등록 가능합니다."); // 상단 alert 팝업 출력
        fileInput2.value = ""; // 입력시도한 파일 초기화
        return;
    }

    preview2.style.backgroundImage = "none"; // 배경 이미지를 제거합니다.

    // 기존의 프리뷰를 초기화하지 않고 새로운 이미지를 추가합니다.
	// FileReader : File 또는 Blob객체를 비동기적으로 처리하는 방법을 제공하는 객체
	// abort, load, error와 같은 이벤트에서 발생한 프로세스를 처리하는데 사용
    Array.from(files).forEach(function(file) { // 파일 목록을 배열로 변환하고 입력된 모든 파일에 반복 적용함
        var reader = new FileReader(); // FileReader 객체 생성

        reader.onload = function(e) { // 파일 데이터가 확인이 되면 함수 실행
            var img = document.createElement("img"); // 새로운 'img'요소를 생성
            img.src = e.target.result; // 입력한 파일 데이터를 img.src 속성에 할당(주소)
            preview2.appendChild(img); // 생성한 'img' 요소를 preview2(프리뷰)에 추가
        };

        reader.readAsDataURL(file); // 읽어낸 파일 데이터를 URL로 변환

        // AJAX를 사용하여 파일을 서버에 전송합니다.
		// FormData : 
        var formData = new FormData(); // FormData 객체 생성
        formData.append("file", file); // FormData 객체에 파일 데이터를 'file' 이름으로 추가

        fetch('/BoardPro/enroll.do', { // 서버에 파일을 비동기 요청 발송
            method: 'POST', // method 타입 : POST
            body: formData // jsp form 내용에 FormData 객체를 추가 전송
        })
        .then(response => response.json()) // 서버의 응답을 json으로 변환
        .then(data => {
            // 서버에서 응답받은 데이터 처리
            console.log('File uploaded:', data); // 업로드한 데이터 처리가 완료되었을 때 출력하는 콘솔
        })
        .catch(error => {
            console.error('Error uploading file:', error); // 업드한 데이터 처리가 문제 발생시 출력하는 콘솔
        });
    });

    // 파일 업로드 수량 표시
    var totalImages = preview2.querySelectorAll("img").length + files.length; // 현재 프리뷰에 있는 이미지 개수와 새로 추가된 파일 개수를 합산
    imageCountDisplay2.textContent = totalImages + "/" + '5'; // 등록된 이미지 수량을 화면에 표시
});

uploadAllFilesButton.addEventListener("click", function() {
    // 서버에서 저장된 파일 리스트를 가져와서 전송하는 로직
    fetch('/getUploadedFiles')
        .then(response => response.json())
        .then(data => {
            // 서버에서 응답받은 파일 리스트를 사용하여 최종 전송 처리
            console.log('Files to be uploaded:', data);
            // 예: 전체 파일을 다시 전송하는 로직 작성
        })
        .catch(error => {
            console.error('Error fetching uploaded files:', error);
        });
});*/


    

    preview2.addEventListener("click", function(event) {
        if (event.target.tagName === "IMG") {
            event.target.remove();
            // 파일 업로드 수량 표시를 갱신합니다.
            imageCountDisplay2.textContent = preview2.querySelectorAll("img").length + "/" + Math.min(5, preview2.querySelectorAll("img").length);
        }
    });
/*});*/

document.getElementById('Detail_right_Contents4_imagePreviews1').addEventListener('click', function() {
    document.getElementById('Detail_right_Contents4_fileInput1').click();
});

document.getElementById('Detail_right_Contents4_imagePreviews2').addEventListener('click', function() {
    document.getElementById('Detail_right_Contents4_fileInput2').click();
});



