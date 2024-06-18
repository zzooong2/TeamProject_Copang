package kr.co.copang.member.model.service;

import java.util.List;

import kr.co.copang.member.model.dto.MemberDto;

public interface MemberService {
	
	// 회원가입
	public int register(MemberDto member, String[] businessFields);

	
	// 중복검사
	public int duplicateId(String id);
	
	// 암호화된 패스워드 가져오기
	public MemberDto login(String id);
	
	// 아이디 찾기
	public MemberDto searchId(String userName, String userPhone);
	
	// 비밀번호 찾기
	public MemberDto searchPwd(String userEmail, String userPhone);
	
	// 비밀번호 변경
	public int updatePwd(String userEmail, String newPassword);
	
	// 핸드폰번호 변경
	public int updatePhone(String userName, String userEmail, String userPhone);
	
	// 결제내역 가져오기
	public List<MemberDto> getPaymentsByUserNo(int userNo);
	
	// 회원 탈퇴 
	public int userDelete(String userEmail, String password);
	    
	   
	
	
}
