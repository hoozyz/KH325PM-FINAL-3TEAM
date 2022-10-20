package com.bc.heal.photo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.bc.heal.photo.service.PhotoService;
import com.bc.heal.vo.Member;
import com.bc.heal.vo.Photo;

@Controller
@RequestMapping("/photo")
public class PhotoController {

	@Autowired
	private PhotoService service;

	@GetMapping("/main")
	public String main(Model model) {
		return "/board/photoMain";
	}

	@PostMapping("/write")
	public String write(Model model, @RequestParam("file") MultipartFile file, @ModelAttribute Photo photo,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, HttpSession session) {

		photo.setMemberno(loginMember.getNo());

		if (file != null && file.isEmpty() == false) {
			String rootPath = session.getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/image";
			String renamedFileName = service.saveFile(file, savePath); // 실제 파일을 저장하는 코드

			System.out.println(renamedFileName);
			if (renamedFileName != null) {
				photo.setOriginalfile(file.getOriginalFilename());
				photo.setRenamefile(renamedFileName);
			}
		}
		System.out.println(photo);
		int result = service.save(photo);

		if (result > 0) {
			model.addAttribute("msg", "게시글 작성에 성공하였습니다.");
		} else {
			model.addAttribute("msg", "게시글 작성에 실패하였습니다.");
		}

		return "/board/photoMain";
	}

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
		} else {
			model.addAttribute("msg", "삭제에 실패하였습니다.");
		}

		return location;
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
		} else {
			model.addAttribute("msg", "작성에 실패하였습니다.");
		}

		return location;
	}

	// 관리자
	@RequestMapping("/admin")
	public String admin(Model model) {
		List<Photo> list = new ArrayList<>();
		if (list.size() > 0) {
			model.addAttribute("list", list);
		} else { // 유저가 없을 때
			model.addAttribute("msg", "자유게시글이 없습니다.");
		}
		return "/admin/board";
	}
}
