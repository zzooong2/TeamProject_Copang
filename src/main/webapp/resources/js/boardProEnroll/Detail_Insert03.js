document.addEventListener('DOMContentLoaded', function() {
    var boldButton = document.querySelector('.Detail_right_Contents3_Boldbutton');
    var italicButton = document.querySelector('.Detail_right_Contents3_Italicbutton');
    var underlineButton = document.querySelector('.Detail_right_Contents3_Underlinebutton');
    var contentEditableDiv = document.querySelector('.Detail_right_Contents3_Textbox');

    // 버튼 클릭 시 즉시 스타일 적용
    boldButton.addEventListener('click', function() {
        applyStyle('bold');
        contentEditableDiv.focus(); // 텍스트 입력 영역에 포커스 주기
        boldButton.classList.toggle('active');
    });

    italicButton.addEventListener('click', function() {
        applyStyle('italic');
        contentEditableDiv.focus();
        italicButton.classList.toggle('active');
    });

    underlineButton.addEventListener('click', function() {
        applyStyle('underline');
        contentEditableDiv.focus();
        underlineButton.classList.toggle('active');
    });

    // applyStyle 함수 정의
    function applyStyle(style) {
        // 선택된 텍스트가 없어도 스타일 적용 가능하도록 포커스를 텍스트 입력 영역으로 이동
        contentEditableDiv.focus();
        document.execCommand(style, false, null); // 스타일 적용
    }
});
