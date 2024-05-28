package kr.co.copang.sms;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send-sms")
public class TestSms extends HttpServlet {
	private String apiKey;
    private String apiSecret;
    private String generatedCode;

    @Override
    public void init() throws ServletException {
        // 서블릿이 초기화될 때 API 키와 시크릿 키를 설정합니다.
        apiKey = getServletContext().getInitParameter("NCSQAGRNBVMJMSTJ");
        apiSecret = getServletContext().getInitParameter("0BOKIJB8IT8MXHGE0L9CIYWVDTMAE5WB");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String phone = request.getParameter("phone");
        String verificationCode = request.getParameter("verificationCode");
        
        if (request.getParameter("requestCode") != null) {
            // 인증번호 요청 버튼이 클릭된 경우
            generatedCode = generateRandomCode();
            sendSms(phone, generatedCode); // SMS 보내기
        } else if (request.getParameter("verifyCode") != null) {
            // 인증 확인 버튼이 클릭된 경우
            if (verificationCode.equals(generatedCode)) {
                // 인증번호가 일치하는 경우
                response.getWriter().write("인증 성공");
            } else {
                // 인증번호가 일치하지 않는 경우
                response.getWriter().write("인증 실패");
            }
        }
    }

    // SMS 보내기 메서드
    private void sendSms(String phone, String code) {
        // 여기에 실제 SMS를 보내는 코드를 구현합니다.
    }

    // 4자리의 랜덤 숫자를 생성하는 메서드
    private String generateRandomCode() {
        Random random = new Random();
        int code = random.nextInt(10000); // 0부터 9999까지의 랜덤 숫자 생성
        return String.format("%04d", code); // 4자리 숫자로 포맷팅하여 반환
    }
}