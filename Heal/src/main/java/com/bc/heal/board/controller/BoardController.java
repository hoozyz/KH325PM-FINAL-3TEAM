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
import com.bc.heal.vo.Board;
import com.bc.heal.vo.Member;
import com.bc.heal.vo.Photo;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/myBoard")
	public String myPost(Model model, 
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		List<Board> list = new ArrayList<>();
		
		list = service.selectByMember(loginMember.getNo());
		
		if(list != null) {
			model.addAttribute("boardList", list);
		}
		
		return "/member/myBoard";
	}
	
	@GetMapping("/delete")
	public String delete(Model model, int no, HttpServletRequest req) {
		int result = 0;
		
		result = service.delete(no);
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
		
		result = service.save(board);
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
