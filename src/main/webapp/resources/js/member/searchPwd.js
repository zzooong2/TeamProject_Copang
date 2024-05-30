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

	window.onload = function() {
	const header = document.getElementsByTagName("header")[0];
	header.style.position = "unset";
	}
	
	

		// 아이디 찾기 버튼 클릭 이벤트 리스너
    /*$('#find-id-button').on('click', function() {
        $('#id_form').removeClass('hidden'); // 아이디 찾기 폼 보이기
        $('#pw_form').addClass('hidden'); // 비밀번호 찾기 폼 숨기기
        $('#find-id-button').addClass('active'); // 아이디 찾기 버튼 활성화
        $('#find-pw-button').removeClass('active'); // 비밀번호 찾기 버튼 비활성화
    });

    // 비밀번호 찾기 버튼 클릭 이벤트 리스너
    $('#find-pw-button').on('click', function() {
        $('#pw_form').removeClass('hidden'); // 비밀번호 찾기 폼 보이기
        $('#id_form').addClass('hidden'); // 아이디 찾기 폼 숨기기
        $('#find-pw-button').addClass('active'); // 비밀번호 찾기 버튼 활성화
        $('#find-id-button').removeClass('active'); // 아이디 찾기 버튼 비활성화
    });*/
		// 인증번호 받기 버튼 클릭 이벤트 (아이디 찾기)
		let verificationCode = 0;
		$(document).ready(function() {
	    // 인증번호 확인 버튼 클릭 이벤트 (아이디 찾기)
	    $('#verifyCodeBtn_id').on('click', function() {
	        var userInputCode = $('#verificationCode_id').val();
	        if(userInputCode == verificationCode) {
	            alert('인증에 성공했습니다.');
	            Flag = true;
	        } else {
	            alert('인증번호가 올바르지 않습니다.');
	            Flag = false;
	        }
	    });
	    $('#verifyCodeBtn_pw').on('click', function() {
	        var userInputCode = $('#verificationCode_pw').val();
	        if(userInputCode == verificationCode) {
	            alert('인증에 성공했습니다.');
	            Flag = true;
	        } else {
	            alert('인증번호가 올바르지 않습니다.');
	            Flag = false;
	        }
	    });
});
	    // 인증번호 확인 버튼 클릭 이벤트 (비밀번호 찾기)

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

