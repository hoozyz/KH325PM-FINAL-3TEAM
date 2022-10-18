package com.bc.heal.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bc.heal.member.mapper.MemberMapper;
import com.bc.heal.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public Member login(String id, String pwd) {
		Member member = this.findById(id);
		if(member == null) {
			return null;
		}
		
		if(id.equals("admin")) { // admin 테스트용
			return member;
		}
		
		if(member != null && pwd.equals(member.getPwd())) {
			return member;
		} else {
			return null;
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class) // 실패하면 롤백
	public int save(Member member) {
		int result = 0;
		if(member.getNo() == 0) { // 회원정보 없으면
			result = mapper.insertMember(member);
		} else {
			result = mapper.updateMember(member);
		}
		
		return result;
	}
	
	@Override
	public Member findById(String id) {
		return mapper.selectMember(id);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delete(int no) {
		return mapper.deleteMember(no);
	}

	@Override
	public List<Member> allList() {
		return mapper.selectAll();
	}

	@Override
	public Member selectByNo(int no) {
		return mapper.selectByNo(no);
	}
}
