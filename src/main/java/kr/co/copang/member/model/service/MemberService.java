package kr.co.copang.member.model.service;

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
	
}
