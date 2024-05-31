function showSection(sectionId) {
    // 모든 섹션 숨기기
    var sections = document.getElementsByClassName('section');
    for (var i = 0; i < sections.length; i++) {
        sections[i].style.display = 'none';
    }
    
    // 선택된 섹션 보이기
    var selectedSection = document.getElementById(sectionId);
    if (selectedSection) {
        selectedSection.style.display = 'block';
    }
}

// 페이지 로드 시 기본 섹션 보이기
window.onload = function() {
    const header = document.getElementsByTagName("header")[0];
    header.style.position = "unset";
    
    showSection('profile');
}
/* 번호 변경 클릭시 */
function enablePhoneInput() {
    document.getElementById("phone").disabled = true;
    document.getElementById("phoneInputSection").style.display = "block";
}
/* 비즈니스 유형 클릭시 */
function enableBusinessField() {
    var businessFieldCheckboxes = document.getElementsByName("businessField");
    for (var i = 0; i < businessFieldCheckboxes.length; i++) {
        businessFieldCheckboxes[i].disabled = false;
    }
}

/* 회원탈퇴 버튼 클릭 */
document.getElementById('password').addEventListener('input', function() {
            var password = document.getElementById('password').value;
            var deleteButton = document.getElementById('deleteButton');
            if (password.length > 0) {
                deleteButton.disabled = false;
            } else {
                deleteButton.disabled = true;
            }
        });