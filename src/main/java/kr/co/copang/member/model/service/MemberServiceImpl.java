package kr.co.copang.member.model.service;

import kr.co.copang.member.model.dao.MemberDao;
import kr.co.copang.member.model.dto.MemberDto;

public class MemberServiceImpl implements MemberService {
	private MemberDao memberDao;
	
	public MemberServiceImpl() {
		memberDao = new MemberDao();
	}
	
	@Override
    public int register(MemberDto member, String[] businessFields) {
        // 회원 정보를 DB에 저장 
        int result = memberDao.register(member);
        
        // 1. insert된 유저의 USER_NO 가져오기 (조건 : getUserEmail)
        // SELECT USER_NO FROM MEMBER WHERE EMAIL = ?
        if (result > 0) {
            // 1. insert된 유저의 USER_NO 가져오기 (조건 : getUserEmail)
            int userNo = memberDao.getUserNoByEmail(member.getUserEmail());
            member.setUserNo(userNo);
        // 멤버비지니스 타입 테이블에 insert
        for (String field : businessFields) {
        	int businessCode = Integer.parseInt(field); // 문자열을 정수로 변환
        	// member.getUserNo = 0
            memberDao.addBusinessField(member.getUserNo(), businessCode);
        	}
        }
        return result;
    }
	
	@Override
	public int duplicateId(String id) {
		return memberDao.duplicateId(id);
	}
	
	@Override
	public MemberDto login(String id) {
		return memberDao.login(id);
	}
	
	@Override
	public MemberDto searchId(String userName, String userPhone) {
		return memberDao.searchId(userName, userPhone);
	}
	
	@Override
	public MemberDto searchPwd(String userEmail, String userPhone) {
		return memberDao.searchPwd(userEmail, userPhone);
	}
	
	@Override
	public int updatePwd(String userEmail, String newPassword) {
		return memberDao.updatePwd(userEmail, newPassword);
	}
}
