$(document).ready(function() {
        // 비밀번호 변경
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
                    console.log(response);
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