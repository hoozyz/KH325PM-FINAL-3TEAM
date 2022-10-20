package com.bc.heal.photo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bc.heal.member.service.MemberService;
import com.bc.heal.photo.service.PhotoService;
import com.bc.heal.vo.Board;
import com.bc.heal.vo.Member;
import com.bc.heal.vo.PageInfo;
import com.bc.heal.vo.Photo;
import com.bc.heal.vo.Review;

@Controller
@RequestMapping("/photo")
public class PhotoController {

	@Autowired
	private PhotoService service;
	
	@Autowired
	private MemberService memService;

	@GetMapping("/main")
	public String main(Model model, Map<String, String> param) {
		int page = 1;
		String keyword = "";

		PageInfo pageInfo = null;
		if (param.containsKey("keyword")) {
			try {
				keyword = param.get("keyword");
			} catch (Exception e) {
			}
			pageInfo = new PageInfo(page, 5, service.getPhotoCount(keyword), 12); // 검색어 가지고 개수 가져오기 -> 제목/내용

		} else {
			pageInfo = new PageInfo(page, 5, service.getPhotoCountAll(), 12);
		}
		
		List<Photo> list = new ArrayList<>();

		list = service.selectPhotoList(pageInfo, param);

		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);

		return "/board/photoMain";
	}
	
	@GetMapping("/list")
	public Map<String, Object> list(@RequestParam Map<String, String> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		int page = 1;
		if (param.containsKey("page")) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {
			}
		}

		String keyword = "";

		List<Photo> photoList = new ArrayList<>();
		List<Member> memList = new ArrayList<>();

		PageInfo pageInfo = null;
		if (param.containsKey("keyword")) {
			try {
				keyword = param.get("keyword");
			} catch (Exception e) {
			}
			pageInfo = new PageInfo(page, 5, service.getPhotoCount(keyword), 10); // 검색어 가지고 개수 가져오기 -> 제목/내용
			photoList = service.selectPhotoList(pageInfo, param);
		} else {
			if(param.containsKey("type")) {
				pageInfo = new PageInfo(page, 5, service.getPhotoCountAll(), 5); // 관리자 페이지
				photoList = service.selectPhotoList(pageInfo, param);
				for(int i = 0; i < photoList.size(); i++) {
					memList.add(memService.selectByNo(photoList.get(i).getMemberno()));
				}
				map.put("memList", memList);
			} else {
				pageInfo = new PageInfo(page, 5, service.getPhotoCountAll(), 10);
				photoList = service.selectPhotoList(pageInfo, param);
			}
		}
		
		map.put("list", photoList);
		map.put("pageInfo", pageInfo);
		
		return map;
	}

	@PostMapping("/write")
	public String write(Model model, MultipartHttpServletRequest files, @ModelAttribute Photo photo,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, HttpSession session) {

		photo.setMemberno(loginMember.getNo());
		List<MultipartFile> list = files.getFiles("files");
		String originalNameStr = "";
		String reNameStr = "";
		
		if (!list.isEmpty()) {
			for (int i = 0; i < list.size(); i++) { // 파일 개수만큼 저장하기
				MultipartFile file = list.get(i);
				String rootPath = "D:\\dev\\git\\final\\Heal\\src\\main\\webapp\\resources";
				String savePath = rootPath + "/upload/image/";
				String renamedFileName = service.saveFile(file, savePath); // 실제 파일을 저장하는 코드

				if (renamedFileName != null && i < list.size() - 1) { // 마지막 전까지만 , 넣기
					originalNameStr += file.getOriginalFilename() + ",";
					reNameStr += renamedFileName + ",";
				} else {
					originalNameStr += file.getOriginalFilename();
					reNameStr += renamedFileName;
				}
			}
			photo.setOriginalfile(originalNameStr);
			photo.setRenamefile(reNameStr);
		}
		
		int result = service.save(photo);

		if (result > 0) {
			model.addAttribute("msg", "게시글 작성에 성공하였습니다.");
		} else {
			model.addAttribute("msg", "게시글 작성에 실패하였습니다.");
		}

		return "redirect: /photo/main";
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
