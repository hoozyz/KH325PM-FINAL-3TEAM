package com.bc.heal.photo.controller;

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

import com.bc.heal.photo.service.PhotoService;
import com.bc.heal.vo.Member;
import com.bc.heal.vo.Photo;
import com.bc.heal.vo.Reserve;

@Controller
@RequestMapping("/photo")
public class PhotoController {

	@Autowired
	private PhotoService service;

	@GetMapping("/myPhoto")
	public String myPhoto(Model model, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		List<Photo> list = new ArrayList<>();

		list = service.selectByMember(loginMember.getNo());

		if (list != null) {
			model.addAttribute("photoList", list);
		}

		return "/member/myPhoto";
	}

	@GetMapping("/delete")
	public String delete(Model model, int no, HttpServletRequest req) { // 이전페이지 필요하면 req
		int result = 0;

		result = service.delete(no);
		String location = req.getHeader("Referer");

		if (result > 0) {
			model.addAttribute("msg", "삭제에 성공하였습니다.");
			model.addAttribute("location", location);
		} else {
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("location", location);
		}

		return "/common/msg";
	}

	@PostMapping("/save")
	public String save(Model model, Photo photo, HttpServletRequest req) {
		int result = 0;
		if (photo == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
		}

		result = service.save(photo);
		String location = req.getHeader("Referer");

		if (result > 0) {
			model.addAttribute("msg", "작성에 성공하였습니다.");
			model.addAttribute("location", location);
		} else {
			model.addAttribute("msg", "작성에 실패하였습니다.");
			model.addAttribute("location", location);
		}

		return "/common/msg";
	}
}
