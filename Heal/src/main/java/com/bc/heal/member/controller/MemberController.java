package com.bc.heal.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.bc.heal.member.service.MemberService;
import com.bc.heal.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SessionAttributes("loginMember") // loginMember를 Model에서 취급할때 Session값으로 처리하는 파라메터
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("/login")
	public String login(Model model, String userId, String userPwd, HttpServletRequest req) {
		log.info("id : " + userId + ", pw : " + userPwd);
		Member loginMember = service.login(userId, userPwd);
		
		String location = req.getHeader("Referer");

		if (loginMember != null) {
			model.addAttribute("loginMember", loginMember);
			return "redirect:" + location; // 가져가는 정보 없이 전 페이지로 보내기
		} else {
			model.addAttribute("msg", "아이디나 패스워드가 잘못되었습니다.");
			model.addAttribute("location", location);
			return "common/msg";
		}
	}

	@RequestMapping("/logout")
	public String logout(SessionStatus status, HttpServletRequest req) {
		status.setComplete();
		
		String location = req.getHeader("Referer");
		
		return "redirect:" + location;
	}
	
	@PostMapping("/member/enroll")
	public String enroll(Model model, Member member) {
		int result = 0;
		try {
			result = service.save(member);
		} catch (Exception e) {
			result = -1;
		}

		if (result > 0) {
			model.addAttribute("msg", "회원가입에 성공하였습니다.");
			model.addAttribute("location", "/");
		} else {
			model.addAttribute("msg", "회원가입에 실패하였습니다. 다시 시도해주세요.");
			model.addAttribute("location", "/");
		}
		return "common/msg";
	}

	@GetMapping("/member/myInfo")
	public String myInfo() {
		return "member/myInfo";
	}

	@PostMapping("/member/update")
	public String update(Model model, Member member, // member가 새로 바뀐 정보 가진 객체
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		// 세션으로 가지고 있는 로그인 멤버 가지고 오는거
		if (loginMember == null || loginMember.getId().equals(member.getId()) == false) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("location", "/");
			return "common/msg";
		}
		
		member.setNo(loginMember.getNo());
		int result = service.save(member);

		if (result > 0) {
			model.addAttribute("loginMember", service.findById(member.getId())); // DB에 있는 값을 다시 세션으로 업데이트
			model.addAttribute("msg", "회원정보를 수정하였습니다.");
			model.addAttribute("location", "/member/myInfo");
		} else {
			model.addAttribute("msg", "회원정보를 수정을 실패하였습니다.");
			model.addAttribute("location", "/member/myInfo");
		}

		return "common/msg";
	}

	@GetMapping("/member/delete")
	public String delete(Model model, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		int result = service.delete(loginMember.getNo());

		if (result > 0) {
			model.addAttribute("msg", "정상적으로 탈퇴 되었습니다.");
			model.addAttribute("location", "/logout");
		} else {
			model.addAttribute("msg", "회원탈퇴에 실패하였습니다.");
			model.addAttribute("location", "/member/myInfo");
		}

		return "common/msg";
	}
	
	// 관리자 영역
	@RequestMapping("/admin/member") // 유저 탈퇴
	public String delete(Model model) {
		List<Member> memberList = new ArrayList<>(); // 전체 유저 리스트
		memberList = service.allList();
		
		if(memberList.size() > 0) {
			model.addAttribute("memberList", memberList);
			
			return "/admin/member"; // 만들 예정
		} else { // 유저가 없을 때
			model.addAttribute("msg", "회원이 없습니다.");
			model.addAttribute("location", "/admin/member");
			return "common/msg";
		}
	}
	
}
