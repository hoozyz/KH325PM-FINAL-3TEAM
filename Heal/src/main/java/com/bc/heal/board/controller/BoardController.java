package com.bc.heal.board.controller;

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

import com.bc.heal.board.service.BoardService;
import com.bc.heal.photo.service.PhotoService;
import com.bc.heal.vo.Board;
import com.bc.heal.vo.Member;
import com.bc.heal.vo.PageInfo;
import com.bc.heal.vo.Photo;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private PhotoService photoService;
	
	@GetMapping("/myBoard")
	public String myPost(Model model, 
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		List<Board> list = new ArrayList<>();
		
		list = boardService.selectByMember(loginMember.getNo());
		
		if(list != null) {
			model.addAttribute("boardList", list);
		}
		
		return "/member/myBoard";
	}
	
	@GetMapping("/main") // 포토게시판 최신 3개와 자유게시판 10개
	public String list(Model model, String keyword, int pageNo) { // page를 클릭했을 때 pageNo 가져오기
		int page = 1;
		if(pageNo != 0) {
			page = pageNo;
		}
		
		PageInfo pageInfo = new PageInfo(page, 5, boardService.getBoardCount(keyword), 10); // 검색어 가지고 개수 가져오기 -> 제목/내용 포함
		
		List<Board> boardList = new ArrayList<>();
		
		List<Photo> photoList = new ArrayList<>();
		
		model.addAttribute("photoList", photoList);
		model.addAttribute("boardList", boardList);
		
		return "/board/boardMain";
	}
	
	@GetMapping("/delete")
	public String delete(Model model, int no, HttpServletRequest req) {
		int result = 0;
		
		result = boardService.delete(no);
		String location = req.getHeader("Referer");
		
		if(result > 0) {
			model.addAttribute("msg", "삭제에 성공하였습니다.");
			model.addAttribute("location", location);
		} else {
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("location", location);
		}
		
		return  "/common/msg";
	}
	
	@PostMapping("/save")
	public String save(Model model, Board board, HttpServletRequest req) {
		int result = 0;
		if(board == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
		}
		
		result = boardService.save(board);
		String location = req.getHeader("Referer");
		
		if(result > 0) {
			model.addAttribute("msg", "예약에 성공하였습니다.");
			model.addAttribute("location", location);
		} else {
			model.addAttribute("msg", "예약에 실패하였습니다.");
			model.addAttribute("location", location);
		}
		
		return  "/common/msg";
	}
}
