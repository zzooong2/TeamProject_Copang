package kr.co.copang.sms;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@WebServlet("/send-sms")
public class TestSms extends HttpServlet {
    
    DefaultMessageService messageService;
    String FROM;

    
    @Override
    public void init() throws ServletException {
        // 서블릿이 초기화될 때 API 키와 시크릿 키를 설정합니다.
    	
    	apiKey keys = new apiKey();
    	String apiKey = keys.getApiKey();
    	String apiSecret = keys.getApiSecret();
    	FROM = keys.getFROM();
    	
    	
    	
        this.messageService = NurigoApp.INSTANCE.initialize(apiKey, apiSecret, "https://api.coolsms.co.kr");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 요청에서 발신번호, 수신번호 가져오기
        String phone = request.getParameter("phone");
        
        // 랜덤한 4자리 숫자 생성
        String verificationCode = generateRandomCode();

        // 문자 메시지 텍스트 생성
        String text = "코팡 인증문자[" + verificationCode + "] 입니다.";

		SingleMessageSentResponse result = sendOne(phone, text);
        
        // 여기에 실제로 SMS를 보내는 코드를 구현합니다.
        // 이 코드는 임시로 출력하도록 했습니다.
		String result1 = verificationCode; 
        request.getSession().setAttribute("verificationCode", verificationCode);

        // 응답으로 결과를 반환합니다.
        response.setContentType("text/plain");
        response.getWriter().write(verificationCode);
    }
    
    public SingleMessageSentResponse sendOne(String phone,String text) {
        Message message = new Message();
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom(FROM);
        message.setTo(phone);
        message.setText(text);

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);

        return response;
    }

    // 4자리의 랜덤 숫자를 생성하는 메서드
    private String generateRandomCode() {
        Random random = new Random();
        int code = random.nextInt(10000); // 0부터 9999까지의 랜덤 숫자 생성
        return String.format("%04d", code); // 4자리 숫자로 포맷팅하여 반환
    }
}