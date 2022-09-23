package com.bc.heal.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Member;

@Mapper
public interface MemberMapper {
	int insertMember(Member member); // save
	Member selectMember(String id); // findById
	int updateMember(Member member);
	int deleteMember(int no);
	List<Member> selectAll();
}
