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
window.onload = function () {
    const header = document.getElementsByTagName("header")[0];
    header.style.position = "unset";

    showSection('profile');
}

/* 번호 변경 클릭시 */
function enablePhoneInput() {
    document.getElementById("phone").disabled = false;  // 전화번호 필드 활성화
    document.getElementById("phoneInputSection").style.display = "block";
}






let Flag = false; // 인증 플래그
let verificationCode = 0;

$(document).ready(function() {
    // 인증번호 확인 버튼 클릭 이벤트
    $('#verifyCodeBtn').on('click', function() {
        var userInputCode = $('#verificationCode').val();
        if (userInputCode == verificationCode) {
            Flag = true;
            $('#verificationModal').hide();
            // 여기서 번호 변경 처리 로직을 추가할 수 있습니다.
        } else {
            Swal.fire('알림', '인증번호가 올바르지 않습니다.', 'error');
            Flag = false;
        }
    });

    // 인증번호 받기 버튼 클릭 이벤트
    $('#sendCodeBtn_phone').on('click', function() {
        const phone = document.getElementById('newPhone').value;
        const textphone = document.getElementById("textphone");
        const patternphone = /^[0-9]{10,11}$/;

        if (patternphone.test(phone)) {
            textphone.innerHTML = "";
            console.log("시작");
            $.ajax({
                url: '/send-sms', // 서블릿의 URL
                type: 'POST',
                data: { phone: phone },
                success: function(response) {
                    console.log(response);
                    verificationCode = response;
                    Swal.fire('알림', '인증번호가 전송되었습니다.', 'success').then(function() {
                        $('#verificationModal').show();
                    });
                },
                error: function(error) {
                    console.error('Error:', error);
                }
            });
            console.log("끝");
        } else {
            textphone.innerHTML = "올바른 번호를 입력하세요.";
            textphone.style.color = "red";
        }
    });
});

// 핸드폰 번호 유효성 검사
function inputphone() {
    const phone = document.getElementById('newPhone').value;
    const textphone = document.getElementById("textphone");
    const patternphone = /^[0-9]{10,11}$/;

    if (patternphone.test(phone)) {
        textphone.innerHTML = "";
    } else {
        textphone.innerHTML = "올바른 번호를 입력하세요.";
        textphone.style.color = "red";
    }
}

// 번호 변경 버튼 클릭 시
function enablePhoneInput() {
    document.getElementById("currentPhoneSection").style.display = "none";
    document.getElementById("phoneInputSection").style.display = "block";
}

// 모달 닫기 함수
function closeModal() {
    var modal = document.getElementById('verificationModal');
    modal.style.display = 'none';
}

// 페이지 로드 시 기본 섹션 보이기
window.onload = function () {
    const header = document.getElementsByTagName("header")[0];
    header.style.position = "unset";

    showSection('profile');
}

// 모든 섹션 숨기기 및 선택된 섹션 보이기
function showSection(sectionId) {
    var sections = document.getElementsByClassName('section');
    for (var i = 0; i < sections.length; i++) {
        sections[i].style.display = 'none';
    }

    var selectedSection = document.getElementById(sectionId);
    if (selectedSection) {
        selectedSection.style.display = 'block';
    }
}

		if (phoneStatus === "true") {
			phoneStatus = "";
            Swal.fire('변경 완료!', '핸드폰 번호 변경 완료! 마이페이지로 이동', 'success').then(() => {
            window.location.href = '/views/member/myPage.jsp';
            });
        }
	
	// 인증번호 못하면 안넘길거임
	document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("profileForm");

    // 폼 제출 이벤트 리스너 등록
    form.addEventListener("submit", function (event) {
        if (!Flag) {
            event.preventDefault(); // 폼 제출을 막음
            Swal.fire('알림', '핸드폰 번호 인증이 완료되지 않았습니다.', 'warning');
        }
    });
});

// 비밀번호 변경 
  		document.querySelector('form').addEventListener('submit', function(event) {
			
			const patternpwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-])[a-zA-Z0-9!@#$%^&*()_+=-]{8,16}$/;
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            // 유효성 검사
            if (newPassword !== confirmPassword) {
                Swal.fire('알림', '새 비밀번호가 일치하지 않습니다.', 'error');
                event.preventDefault();
            }

            // 추가 유효성 검사 (예: 최소 길이, 특수문자 포함 여부 등)
            if (patternpwd.test(newPassword)) {
                Swal.fire('알림', '비밀번호는 8-16자 사이의 문자, 숫자, 특수문자를 포함해야 합니다.', 'error');
                event.preventDefault();
            }
        });

		if (pwdStatus === "false") {
			pwdStatus = "";
            Swal.fire('알림', '현 비밀번호가 일치하지 않습니다.', 'error').then(() => {
			showSection(status);
            // window.location.href = '/views/member/myPage.jsp';
            });
        } else if(newPwdStatus === "false") {
			newPwdStatus = "";
            Swal.fire('알림', '새로운 비밀번호가 서로 일치하지 않습니다.', 'error').then(() => {
            showSection(status);
            });
		} else if(pwdValidation === "false") {
			pwdValidation = "";
            Swal.fire('알림', '비밀번호는 8-16자 사이의 문자, 숫자, 특수문자를 포함해야 합니다.', 'error').then(() => {
            showSection(status);
            });
		} 

		if (pwdChange === "true") {
			pwdChange = "";
            Swal.fire('알림', '비밀번호가 변경되었습니다.', 'success').then(() => {
            window.location.href = '/views/member/login.jsp';
            });
        } else if(pwdChange === "false") {
			pwdChange = "";
            Swal.fire('알림', '오류가 발생했습니다.', 'error').then(() => {
            });
		}
