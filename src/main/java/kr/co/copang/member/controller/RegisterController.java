package kr.co.copang.member.controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;
import kr.co.copang.member.model.dto.MemberDto;
import kr.co.copang.member.model.service.MemberService;
import kr.co.copang.member.model.service.MemberServiceImpl;

@WebServlet("/member/register.do")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MemberService memberService;

    public RegisterController() {
        super();
        memberService = new MemberServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String userName = request.getParameter("user_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmpwd = request.getParameter("confirm_password");
        String phone = request.getParameter("phone");
        String[] businessFields = request.getParameterValues("business_field");
        String userType = request.getParameter("user_type");
        String duplicateCheck = request.getParameter("duplicateCheck");

        if ("unavailable".equals(duplicateCheck)) {
            returnAlert(response, "중복된 이메일입니다. 다른 이메일을 입력해주세요.", "/form/registerForm.do");
            return;
        }

        // 동의 여부 확인
        String over14 = request.getParameter("over_14");
        String termsOfService = request.getParameter("terms_of_service");
        String privacyPolicy = request.getParameter("privacy_policy");
        String marketing = request.getParameter("marketing");

        // 서버 유효성 검사
        final String NAME_PATTERN = "^[가-힣]+$";
        final String EMAIL_PATTERN = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        final String PWD_PATTERN = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-])[a-zA-Z0-9!@#$%^&*()_+=-]{8,16}$";
        final String PHONE_PATTERN = "^[0-9]{10,11}$";

        Pattern namePattern = Pattern.compile(NAME_PATTERN);
        Pattern emailPattern = Pattern.compile(EMAIL_PATTERN);
        Pattern pwdPattern = Pattern.compile(PWD_PATTERN);
        Pattern phonePattern = Pattern.compile(PHONE_PATTERN);

        Matcher nameMatcher = namePattern.matcher(userName);
        Matcher emailMatcher = emailPattern.matcher(email);
        Matcher pwdMatcher = pwdPattern.matcher(password);
        Matcher phoneMatcher = phonePattern.matcher(phone);

        if (!password.equals(confirmpwd)) {
            returnAlert(response, "비밀번호가 일치하지 않습니다.", "/form/registerForm.do");
            return;
        }

        if (!nameMatcher.matches()) {
            returnAlert(response, "이름은 한글만 가능합니다.", "/form/registerForm.do");
            return;
        }

        if (!emailMatcher.matches()) {
            returnAlert(response, "올바른 이메일을 입력하세요.", "/form/registerForm.do");
            return;
        }

        if (!pwdMatcher.matches()) {
            returnAlert(response, "패스워드 정책에 맞지 않습니다.", "/form/registerForm.do");
            return;
        }

        if (!phoneMatcher.matches()) {
            returnAlert(response, "연락처를 올바르게 기입하세요.", "/form/registerForm.do");
            return;
        }

        if (!"on".equals(over14) || !"on".equals(termsOfService) || !"on".equals(privacyPolicy)) {
            returnAlert(response, "필수 동의 항목을 체크하세요.", "/form/registerForm.do");
            return;
        }

        // 패스워드 암호화
        String salt = BCrypt.gensalt(12);
        String hashPassword = BCrypt.hashpw(password, salt);

        // Create MemberDto object
        MemberDto member = new MemberDto();
        member.setUserName(userName);
        member.setUserEmail(email);
        member.setUserPwd(hashPassword);
        member.setConfirmPwd(confirmpwd);
        member.setUserPhone(phone);
        member.setPartCode(userType.equals("전문가") ? 2 : 1); // 전문가 = 2, 의뢰자 = 1
        member.setFyoConsent("on".equals(over14) ? "Y" : "N");
        member.setsConsent("on".equals(termsOfService) ? "Y" : "N");
        member.setPiConsent("on".equals(privacyPolicy) ? "Y" : "N");
        member.setPosConsent("on".equals(marketing) ? "Y" : "N");

        int result = memberService.register(member, businessFields);

        if (result == 1) {
            returnAlert(response, "회원 가입에 성공하셨습니다.", "/views/member/login.jsp");
        } else {
            returnAlert(response, "회원 등록에 실패했습니다.", "/form/registerForm.do");
        }
    }

    private void returnAlert(HttpServletResponse response, String msg, String location) throws IOException {
        response.getWriter().write("<script>"
                + "alert('" + msg + "');"
                + "location.href='" + location + "';"
                + "</script>");
    }
}
