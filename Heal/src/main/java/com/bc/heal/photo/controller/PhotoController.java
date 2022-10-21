package com.bc.heal.photo.controller;

import java.util.ArrayList;
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
import com.bc.heal.reply.service.ReplyService;
import com.bc.heal.vo.Member;
import com.bc.heal.vo.PageInfo;
import com.bc.heal.vo.Photo;
import com.bc.heal.vo.Reply;

@Controller
@RequestMapping("/photo")
public class PhotoController {

	@Autowired
	private PhotoService service;

	@Autowired
	private MemberService memService;
	
	@Autowired
	private ReplyService repService;

	@GetMapping("/main")
	public String main(Model model, Map<String, String> param) {
		int page = 1;

		PageInfo pageInfo = new PageInfo(page, 5, service.getPhotoCount(param), 12); // 검색어 가지고 개수 가져오기 -> 제목/내용
		List<Photo> list = new ArrayList<>();

		list = service.selectPhotoList(pageInfo, param);
		
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("param", param);

		return "/board/photoMain";
	}
	
	@GetMapping("/view")
	public String view(Model model, int no) {
		Photo photo = service.findByNo(no);
		
		service.addCount(no); // readcount + 1
		
		List<Reply> repList = new ArrayList<>();
		PageInfo pageInfo = new PageInfo(1, 5, repService.getCount(no), 5);
		repList = repService.selectListByPhoto(no, pageInfo);
		
		model.addAttribute("photo", photo);
		model.addAttribute("repList", repList);
		return "/board/photoView";
	}

	@GetMapping("/list")
	public String list(Model model, @RequestParam Map<String, String> param) {
		int page = 1;
		if (param.containsKey("page")) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {
			}
		}

		System.out.println(service.getPhotoCount(param));
		System.out.println(param);
		List<Photo> photoList = new ArrayList<>();
		PageInfo pageInfo = new PageInfo(page, 5, service.getPhotoCount(param), 12); // 검색어 가지고 개수 가져오기 -> 제목/내용
		photoList = service.selectPhotoList(pageInfo, param);
		model.addAttribute("list", photoList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("param", param);

		return "/board/photoMain";
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
				String rootPath = session.getServletContext().getRealPath("resources");
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

	@PostMapping("/myPhoto")
	public String myPhoto(Model model, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		List<Photo> list = new ArrayList<>();

		list = service.selectByMember(loginMember.getNo());

		if (list != null) {
			model.addAttribute("photoList", list);
		}

		return "/member/myPhoto";
	}

	@PostMapping("/delete")
	public String delete(Model model, int no, HttpServletRequest req) { // 이전페이지 필요하면 req
		service.delete(no);

		return "redirect: /photo/main";
	}

	@PostMapping("/update") 
	public String update(@ModelAttribute Photo photo) {
		System.out.println(photo);
		service.update(photo);
		String no = ""+photo.getNo();
		return "redirect: /photo/view?no="+no;
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
