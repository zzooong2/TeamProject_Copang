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
        
        // businessFields를 DB에 저장하는 로직 추가
        if (result > 0 && businessFields != null) {
            for (String field : businessFields) {
                memberDao.addBusinessField(member.getUserNo(), field);
            }
        }
        
        return result;
    }
}
