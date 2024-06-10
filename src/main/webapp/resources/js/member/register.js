let pwdFlag = false; // 패스워드 플래그
let pwdFlag2 = false; // 패스워드 플래그
let Flag = false; // 인증 플래그
let emailFlag = false; // 이메일 인증 플래그

window.onload = function() {
	
	// 페이지 로드 시 실행되는 함수
	const userTypeRadios = document.querySelectorAll('input[name="user_type"]');
    userTypeRadios.forEach((radio) => {
        radio.addEventListener('change', toggleBusinessField);
    });
    toggleBusinessField(); // 초기 로드 시 상태 설정
	
	// 페이지 로드 시 실행되는 함수
	const agreeAllCheckbox = document.getElementById('agree_all');
    const individualCheckboxes = document.querySelectorAll('.individual-consent');

    // "모두 동의합니다" 체크박스에 이벤트 리스너 추가
    agreeAllCheckbox.addEventListener('change', function() {
        toggleCheckboxes(this);
    });

    // 개별 동의 항목에 이벤트 리스너 추가
    individualCheckboxes.forEach((checkbox) => {
        checkbox.addEventListener('change', updateAgreeAllCheckbox);
    });
    
    // 초기 상태 설정
    updateAgreeAllCheckbox();
}
// 이름 유효성 검사
function inputname() {
   	const Patternname = /^[가-힣]+$/;
    const name = document.getElementById("user_name").value;
    const textname = document.getElementById("textname");

    if(Patternname.test(name)) {
        textname.innerHTML = " ";
    } else {
        textname.innerHTML = "올바른 이름을 입력하세요.";
        textname.style.color = "red";
    }
}

// 이메일  유효성 검사
function inputemail() {
    const Patternemail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; // 이메일 형식을 검사하는 정규표현식
    const email = document.getElementById('email').value;
    const textemail = document.getElementById("textemail");
	const duplicateCheck = document.getElementById("duplicateCheck");

    if (Patternemail.test(email)) {
		textemail.innerHTML = " ";
    } else {
        textemail.innerHTML = "올바른 이메일을 입력하세요.";
		textemail.style.color = "red";
    }

	$.ajax({
     	type: "POST",   // HTTP 메서드
        url: "/member/duplicateId.do",   // 요청할 URL
       	data: { email : email},  // 전송할 데이터 { 키 : 값 }
        success: function(res) {   // 요청이 성공했을 때  
        	console.log(res);
        if(res === "available") {
			emailFlag = true;
        	} else {
        	duplicateCheck.value = "unavailable";
        	textemail.style.color = "red";
        	textemail.innerHTML = "중복된 이메일입니다.";
			emailFlag = false;
        	}
        },
        error: function(err) {     // 요청이 실패했을 때
        	console.error('Error:', err);
        }
     });
}

// 비밀번호 유효성 검사
function inputpwd() {
	const patternpwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-])[a-zA-Z0-9!@#$%^&*()_+=-]{8,16}$/;
    const pwd = document.getElementById("password").value;
    const pwd2 = document.getElementById("confirm_password").value;
    const textpwd2 = document.getElementById("textpwd2");
    const textpwd = document.getElementById("textpwd");
	if(pwdFlag && pwd === pwd2) {
        textpwd2.innerHTML = "비밀번호가 일치합니다.";
        textpwd2.style.color = "green";
		pwdFlag2 = true;
    } else if(pwdFlag && pwd2 !== ''){
        textpwd2.innerHTML = "비밀번호가 일치하지 않습니다.";
        textpwd2.style.color = "red";
		pwdFlag2 = false;
	}
	if(patternpwd.test(pwd)) {
        textpwd.innerHTML = "사용 가능한 비밀번호입니다.";
        textpwd.style.color = "green";
		pwdFlag = true;
    } else {
        textpwd.innerHTML = "8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.";
        textpwd.style.color = "red";
		pwdFlag = false;
    }
}
// 핸드폰 번호 유효성 검사 
function inputphone() {
	const patternphone = /^[0-9]{10,11}$/;
	const phone = document.getElementById('phone').value;
	const textphone = document.getElementById("textphone");
	
	if(patternphone.test(phone)) {
        textphone.innerHTML = " ";
		document.getElementById("requestCodeBtn").addEventListener("click", function() {
		document.getElementById("verificationCodeContainer").style.display = "block";
		});
    } else {
        textphone.innerHTML = "올바른 번호를 입력하세요.";
        textphone.style.color = "red";
    }
}

// 체크박스 초기화 함수
function resetCheckboxes() {
    const checkboxes = document.querySelectorAll('.business-checkbox');
    checkboxes.forEach((checkbox) => {
        checkbox.checked = false;
    });
}

// 전문가 선택 시 단일 선택만 가능하게 하기 위한 함수
function enableSingleSelection() {
    const checkboxes = document.querySelectorAll('.business-checkbox');
    checkboxes.forEach((checkbox) => {
        checkbox.onclick = function() {
            if (this.checked) {
                checkboxes.forEach((box) => {
                    if (box !== this) box.checked = false;
                });
            }
        };
    });
}

// 의뢰자 선택 시 다중 선택이 가능하게 하기 위한 함수
function enableMultipleSelection() {
    const checkboxes = document.querySelectorAll('.business-checkbox');
    checkboxes.forEach((checkbox) => {
        checkbox.onclick = null; // 기존 클릭 이벤트 제거
    });
}

// 회원 유형에 따라 비즈니스 분야 입력란을 토글하는 함수
function toggleBusinessField() {
    const expert = document.getElementById('expert');
    resetCheckboxes(); // 회원 유형 변경 시 체크박스 초기화
    if (expert.checked) {
        enableSingleSelection();
    } else {
        enableMultipleSelection();
    }
}

// 동의 체크박스 전체 선택/해제
function toggleCheckboxes(source) {
    const checkboxes = document.querySelectorAll('.individual-consent');
    checkboxes.forEach((checkbox) => {
        checkbox.checked = source.checked;
    });
}

// 개별 동의 항목 선택 시 "모두 동의합니다" 체크박스 상태를 업데이트하는 함수
function updateAgreeAllCheckbox() {
    const checkboxes = document.querySelectorAll('.individual-consent');
    const agreeAllCheckbox = document.getElementById('agree_all');
    agreeAllCheckbox.checked = Array.from(checkboxes).every(checkbox => checkbox.checked);
}

// 유효성 검사 후 회원가입 버튼 눌리게
function registerClick() {
	const Patternname = /^[가-힣]+$/;
	const Patternemail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	const patternpwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-])[a-zA-Z0-9!@#$%^&*()_+=-]{8,16}$/
	
	const space = /\s/;
    const name = document.getElementById("user_name").value;
    const email = document.getElementById("email").value;
    const pwd = document.getElementById("password").value;
    const pwd2 = document.getElementById("confirm_password").value;
	const check14 = document.getElementById("over_14");
	const checkService = document.getElementById("terms_of_service");
	const checkPolicy = document.getElementById("privacy_policy");
	const expert = document.getElementById("expert");
	const client = document.getElementById("client");
	const it = document.getElementById("business_it");
	const video = document.getElementById("business_video");
	const design = document.getElementById("business_design");
	const marketing = document.getElementById("business_marketing");
	const education = document.getElementById("business_education");

if (space.test(name) || space.test(email) || space.test(pwd) || space.test(pwd2)) {
    alert("띄어쓰기 불가입니다.");
	} else if (!name) {
    alert("이름을 입력해주세요.");
	} else if (!Patternname.test(name)) {
	alert("올바른 이름을 입력해주세요.");
	} else if (!email) {
    alert("이메일을 입력해주세요.");
	} else if (!Patternemail.test(email)) {
    alert("올바른 이메일 주소를 입력해주세요.");
	} else if(!emailFlag){
	alert("이메일 주소가 중복되었습니다. 다시 입력해주세요.");	
	} else if (!pwd) {
    alert("비밀번호를 입력해주세요.");
	} else if (!patternpwd.test(pwd)) {
    alert("비밀번호는 8-16자 사이의 문자, 숫자, 특수문자를 포함해야 합니다.");
	} else if(!pwd2) {
	alert("비밀번호 확인을 입력해주세요.");
	} else if (pwd !== pwd2) {
    alert("비밀번호가 일치하지 않습니다.");
	} else if(!expert.checked && !client.checked){
	alert("회원 유형을 체크하세요.");	
	} else if(!it.checked && !video.checked && !design.checked && !marketing.checked && !education.checked) {
	alert("비즈니스 분야를 체크하세요.");		
	} else if(!check14.checked || !checkService.checked || !checkPolicy.checked) {
	alert("필수 동의칸을 체크하세요.");
	} else if(!Flag) {
	alert("인증 실패했습니다.");	
	} else {
		document.getElementById('registerForm').submit();
		// from 태그 가져와서 submit 이벤트 발생
	}
	
	
};


