/* 클릭시 아래 생기게 */
document.addEventListener('DOMContentLoaded', function() {
    const findIdButton = document.getElementById('find-id-button');
    const findPwButton = document.getElementById('find-pw-button');
    const idForm = document.getElementById('id_form');
    const pwForm = document.getElementById('pw_form');

    // 페이지 로드 시 기본 상태 설정
    idForm.classList.remove('hidden');
    pwForm.classList.add('hidden');
    findIdButton.classList.add('active');
    findPwButton.classList.remove('active');

    findIdButton.addEventListener('click', function() {
        idForm.classList.remove('hidden');
        pwForm.classList.add('hidden');
        findIdButton.classList.add('active');
        findPwButton.classList.remove('active');
    });

    findPwButton.addEventListener('click', function() {
        pwForm.classList.remove('hidden');
        idForm.classList.add('hidden');
        findPwButton.classList.add('active');
        findIdButton.classList.remove('active');
    });

	
});
	
		// 인증번호 받기 버튼 클릭 이벤트 (아이디 찾기)
		let Flag = false; // 인증 플래그
		let verificationCode = 0;
		$(document).ready(function() {
	    // 인증번호 확인 버튼 클릭 이벤트 (아이디 찾기)
	    $('#verifyCodeBtn_id').on('click', function() {
	        var userInputCode = $('#verificationCode_id').val();
	        if(userInputCode == verificationCode) {
	            Flag = true;
	        } else {
	            Swal.fire('알림', '인증번호가 올바르지 않습니다.', 'error');
	            Flag = false;
	        }
	    });
	    $('#verifyCodeBtn_pw').on('click', function() {
	        var userInputCode = $('#verificationCode_pw').val();
	        if(userInputCode == verificationCode) {
	            Flag = true;
	        } else {
	            Swal.fire('알림', '인증번호가 올바르지 않습니다.', 'error');
	            Flag = false;
	        }
	    });
});
	    

		// 핸드폰 번호 유효성 검사 
	function inputphone(type) {
	const patternphone = /^[0-9]{10,11}$/;
	const phoneid = document.getElementById('phone_id').value;
	const phonepwd = document.getElementById('phone_pw').value;
	const textphone = document.getElementById("textphone");
	
	if(patternphone.test(phoneid) || patternphone.test(phonepwd)) {
        textphone.innerHTML = " ";
		if(type === 'id') {
			document.getElementById("verificationCodeContainer_id").style.display = "block";
			console.log("시작");
	        $.ajax({
	            url: '/send-sms',  // 서블릿의 URL
	            type: 'POST',
	            data: { phone: phoneid },
	            success: function(response) {
	                console.log(response);
	                verificationCode = response;
	                alert('인증번호가 전송되었습니다.');
	            },
	            error: function(error) {
	                console.error('Error:', error);
	            }
	        });
			console.log("끝");
		} else if (type === 'pwd') {
			document.getElementById("verificationCodeContainer_pw").style.display = "block";
	        $.ajax({
	            url: '/send-sms',  // 서블릿의 URL
	            type: 'POST',
	            data: { phone: phonepwd },
	            success: function(response) {
	                console.log(response);
	                verificationCode = response;
	                alert('인증번호가 전송되었습니다.');
	            },
	            error: function(error) {
	                console.error('Error:', error);
	            }
	        });
		}
    } else {
        textphone.innerHTML = "올바른 번호를 입력하세요.";
        textphone.style.color = "red";
    }
}


		
        // 가져온 변수 사용 예시
        if (alertStatus === "true") {
			alertStatus = "";
            Swal.fire('인증완료!', userEmail + ' 입니다.', 'success').then(() => {
            window.location.href = '/views/member/searchPage.jsp';
            });
        } else if(alertStatus === "false") {
			alertStatus = "";
            Swal.fire('알림', '가입 정보가 없습니다.', 'error').then(() => {
            window.location.href = '/views/member/searchPage.jsp';
            });
        }



