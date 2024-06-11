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
			const searchIdForm = document.getElementById("searchIdForm");
	        var userInputCode = $('#verificationCode_id').val();
	        if(userInputCode == verificationCode) {
	            Flag = true;
				searchIdForm.submit();
	        } else {
	            Swal.fire('알림', '인증번호가 올바르지 않습니다.', 'error');
				$('#verificationCodeContainer_id').hide();
	            Flag = false;
				
	        }
	    });
	    $('#verifyCodeBtn_pw').on('click', function() {
			const searchPwdForm = document.getElementById("searchPwdForm");
	        var userInputCode = $('#verificationCode_pw').val();
	        if(userInputCode == verificationCode) {
	            Flag = true;
				searchPwdForm.submit();
	        } else {
	            Swal.fire('알림', '인증번호가 올바르지 않습니다.', 'error');
				$('#verificationCodeContainer_pw').hide();
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
	                Swal.fire('알림', '인증번호가 전송되었습니다.', 'success');
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
	                Swal.fire('알림', '인증번호가 전송되었습니다.', 'success');
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


		
        // 가입정보 가져와 확인하고 팝업창
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

		
		if (passwordStatus === "true") {
			passwordStatus = "";
            Swal.fire('인증완료!', '비밀번호 변경페이지로 이동합니다.', 'success').then(() => {
            window.location.href = '/views/member/searchPwd.jsp';
            });
        } else if(passwordStatus === "false") {
			passwordStatus = "";
            Swal.fire('알림', '가입 정보가 없습니다.', 'error').then(() => {
            window.location.href = '/views/member/searchPage.jsp';
            });
        }

		// 비밀번호 변경
		$(document).ready(function() {
    	$('#changePwdForm').submit(function(event) {
        event.preventDefault(); // 기본 이벤트 제거
        
        var password = $('#password').val();
        var confirm_password = $('#confirm_password').val();
        
        // 비밀번호와 재입력한 비밀번호가 일치하는지 확인
        if (password !== confirm_password) {
            Swal.fire('알림', '비밀번호가 일치하지 않습니다.', 'error');
            return;
        }
        
        // 서버로 비밀번호 변경 요청을 보냄
        $.ajax({
            url: '/member/changePwd.do',
            type: 'POST',
            data: $('#changePwdForm').serialize(),
            success: function(response) {
                // 서버로부터 응답을 받으면, 이에 따른 처리를 수행
                if (response === 'success') {
                    Swal.fire('알림', '비밀번호가 변경되었습니다.', 'success').then(() => {
                        // 비밀번호가 성공적으로 변경되면 어떤 작업을 수행할지 정의
                        // 예를 들어, 로그인 페이지로 리다이렉트할 수 있습니다.
                        window.location.href = '/views/member/login.jsp';
                    });
                } else if (response === 'failure') {
                    // 비밀번호 변경에 실패한 경우
                    Swal.fire('알림', '비밀번호 변경에 실패했습니다. 다시 시도해주세요.', 'error');
                } else if (response === 'invalid') {
					Swal.fire('알림', '8~16자의 영문 대/소문자, 숫자, 특수문자를 사용하세요.', 'error');
				}
            },
            error: function(xhr, status, error) {
                // 서버와의 통신 에러가 발생한 경우
                console.error('Error:', error);
                Swal.fire('알림', '서버와의 통신에 문제가 발생했습니다.', 'error');
            }
        });
    });
});





