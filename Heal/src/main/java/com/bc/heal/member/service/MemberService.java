package com.bc.heal.member.service;

import java.util.List;

import com.bc.heal.vo.Member;

public interface MemberService {
	Member login(String id, String pwd);
		
	int save(Member member);
	
	Member findById(String id);
	
	int delete(int no);

	List<Member> allList();

	Member selectByNo(int no);
}
