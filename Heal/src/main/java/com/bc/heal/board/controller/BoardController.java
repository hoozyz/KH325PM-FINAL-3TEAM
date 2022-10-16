package com.bc.heal.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.bc.heal.board.service.BoardService;
import com.bc.heal.common.util.PageInfo;
import com.bc.heal.photo.service.PhotoService;
import com.bc.heal.vo.Board;
import com.bc.heal.vo.Member;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private PhotoService photoService;

	@GetMapping("/myBoard")
	public String myPost(Model model, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		List<Board> list = new ArrayList<>();

		list = boardService.selectByMember(loginMember.getNo());

		if (list != null) {
			model.addAttribute("boardList", list);
		}

		return "/member/myBoard";
	}

	@GetMapping("/main") // 자유게시판 10개
	public String main(Model model, Map<String, String> param) { // pageNo,
		int page = 1;
		String keyword = "";
		
		PageInfo pageInfo = null;
		if (param.containsKey("keyword")) {
			try {
				keyword = param.get("keyword");
			} catch (Exception e) {
			}
			pageInfo = new PageInfo(page, 5, boardService.getBoardCount(keyword), 10); // 검색어 가지고 개수 가져오기 -> 제목/내용

		} else {
			pageInfo = new PageInfo(page, 5, boardService.getBoardCountAll(), 10);
		}

		List<Board> boardList = new ArrayList<>();

		boardList = boardService.selectBoardList(pageInfo, param);

		model.addAttribute("boardList", boardList);
		model.addAttribute("pageInfo", pageInfo);

		return "/board/boardMain";
	}

	@GetMapping("/list") // AJAX
	@ResponseBody
	public Map<String, Object> list(Model model, @RequestParam Map<String, String> param) {
		int page = 1;
		if (param.containsKey("page")) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {
			}
		}

		String keyword = "";

		PageInfo pageInfo = null;
		if (param.containsKey("keyword")) {
			try {
				keyword = param.get("keyword");
			} catch (Exception e) {
			}
			pageInfo = new PageInfo(page, 5, boardService.getBoardCount(keyword), 10); // 검색어 가지고 개수 가져오기 -> 제목/내용
		} else {
			pageInfo = new PageInfo(page, 5, boardService.getBoardCountAll(), 10);
		}
		
		List<Board> boardList = new ArrayList<>();

		boardList = boardService.selectBoardList(pageInfo, param);
		
		Map<String, Object> map = new HashMap<>();

		map.put("list", boardList);
		map.put("pageInfo", pageInfo);
		return map;
	}
	
	@PostMapping("/update")
	public String update(Model model, Board board, HttpServletRequest req) {
		int result = 0;
		System.out.println(board);
		result = boardService.update(board.getTitle(), board.getCont(), Integer.toString(board.getNo()));
		String location = req.getHeader("Referer");

		if (result > 0) {
			model.addAttribute("msg", "수정에 성공하였습니다.");
			model.addAttribute("location", location);
		} else {
			model.addAttribute("msg", "수정에 실패하였습니다.");
			model.addAttribute("location", location);
		}

		return "/common/msg";
	}
	
	@GetMapping("/view") // ajax
	@ResponseBody
	public Board view(int no) {
		Board board = boardService.selectByNo(no);
		
		// 조회수 증가
		int count = board.getReadcount() + 1;
		boardService.countPlus(count, no);
		
		return board;
	}

	@PostMapping("/delete")
	public String delete(Model model, int no, HttpServletRequest req) {
		int result = 0;

		result = boardService.delete(no);
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

	@PostMapping("/write")
	public String write(Model model, Board board, HttpServletRequest req, 
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		int result = 0;
		if (board == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
		}
		
		board.setId(loginMember.getId());
		board.setMemberno(loginMember.getNo());
		
		result = boardService.save(board);
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
