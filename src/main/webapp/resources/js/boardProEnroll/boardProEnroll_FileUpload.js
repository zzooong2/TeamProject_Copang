// /////////////////////////////////////////// 파일 업로드 JavaScript \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

document.addEventListener("DOMContentLoaded", function() {
    // 첫 번째 파일 업로드 input 요소
    let fileInput1 = document.getElementById("Detail_right_Contents4_fileInput1");
    let preview1 = document.getElementById("Detail_right_Contents4_imagePreviews1");
    let imageCountDisplay1 = document.getElementById("imageCountDisplay1");

    // 기존에 선택한 파일 목록을 저장할 배열
    let selectedFiles1 = [];

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
            let reader = new FileReader();

            reader.onload = function(e) {
                let img = document.createElement("img");
                img.src = e.target.result;
                preview1.appendChild(img);
            };

            reader.readAsDataURL(file);

            // 선택한 파일을 배열에 추가합니다.
            selectedFiles1 = [file];
        } else {
            // 파일이 선택되지 않았을 때 기본 배경 이미지를 설정합니다.
            preview1.style.backgroundImage = "url('default_image.jpg')";

            // 선택한 파일 목록을 초기화합니다.
            selectedFiles1 = [];
        }

        // 파일 업로드 수량 표시를 갱신합니다.
        imageCountDisplay1.textContent = selectedFiles1.length + "/1";
    });

    // 프리뷰를 클릭하면 파일 선택 창을 엽니다.
    preview1.addEventListener("click", function() {
        fileInput1.click();
    });

    // 두 번째 파일 업로드 input 요소
    let fileInput2 = document.getElementById("Detail_right_Contents4_fileInput2");
    let preview2 = document.getElementById("Detail_right_Contents4_imagePreviews2");
    let imageCountDisplay2 = document.getElementById("imageCountDisplay2");

    // 기존에 선택한 파일 목록을 저장할 배열
    let selectedFiles2 = [];

    fileInput2.addEventListener("change", function(event) {
        const dataTransfer = new DataTransfer();
        let files = event.target.files;

        // 기존에 선택한 파일 목록을 dataTransfer 객체에 추가합니다.
        for (let i = 0; i < selectedFiles2.length; i++) {
            dataTransfer.items.add(selectedFiles2[i]);
        }

        // 새로 선택한 파일을 dataTransfer 객체에 추가합니다.
        for (let i = 0; i < files.length; i++) {
            dataTransfer.items.add(files[i]);
        }

        // 5개 이상의 파일이 등록되면 경고창을 띄우고 초과된 파일을 제거합니다.
        if (dataTransfer.files.length > 5) {
            alert("파일은 최대 5개까지 등록 가능합니다.");

            // 초과된 파일을 제거합니다.
            dataTransfer.items.clear();
            for (let i = 0; i < selectedFiles2.length; i++) {
                dataTransfer.items.add(selectedFiles2[i]);
            }
            for (let i = 0; i < 5 - selectedFiles2.length; i++) {
                dataTransfer.items.add(files[i]);
            }
        }
	console.log(dataTransfer.files);
        fileInput2.files = dataTransfer.files;

        // 프리뷰를 갱신합니다.
        preview2.style.backgroundImage = "none"; // 배경 이미지를 제거합니다.
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

        // 선택한 파일 목록을 업데이트합니다.
        selectedFiles2 = Array.from(dataTransfer.items).map(item => item.getAsFile()).filter(file => file !== null);

        // 파일 업로드 수량 표시를 갱신합니다.
        imageCountDisplay2.textContent = selectedFiles2.length + "/5";
    });

    // 프리뷰를 클릭하면 파일 선택 창을 엽니다.
    preview2.addEventListener("click", function(event) {
        if (event.target.tagName === "IMG") {
            let index = Array.from(preview2.children).indexOf(event.target);

            // 선택한 파일 목록에서 클릭된 인덱스의 파일을 제거합니다.
            selectedFiles2.splice(index, 1);

            const dataTransfer = new DataTransfer();

            // 선택한 파일을 dataTransfer 객체에 추가합니다.
            for (let i = 0; i < selectedFiles2.length; i++) {
                dataTransfer.items.add(selectedFiles2[i]);
            }

            fileInput2.files = dataTransfer.files;

            // 프리뷰에서 이미지를 제거합니다.
            event.target.remove();

            // 파일 업로드 수량 표시를 갱신합니다.
            imageCountDisplay2.textContent = selectedFiles2.length + "/5";
        } else {
            fileInput2.click();
        }
    });
});






