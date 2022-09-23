package com.bc.heal.review.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.bc.heal.reply.service.ReplyService;
import com.bc.heal.review.service.ReviewService;
import com.bc.heal.vo.Member;
import com.bc.heal.vo.Reply;
import com.bc.heal.vo.Review;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService revService;
	
	@Autowired
	private ReplyService repService;
	
	@GetMapping("/myReview")
	public String myLike(Model model, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		List<Review> revList = new ArrayList<>(); // like 중 최신 5개 가져오기

		revList = revService.selectNew(loginMember.getNo());
		
		// 나의 댓글
		List<Reply> repList = new ArrayList<>();
		
		repList = repService.selectNew(loginMember.getNo());
		
		model.addAttribute("revList", revList);
		model.addAttribute("repList", repList);

		return "/member/myReview";
	}
	
	@GetMapping("/delete")
	public String delete(Model model, int no, HttpServletRequest req) {
		int result = 0;
		
		result = revService.delete(no);
		String location = req.getHeader("Referer");
		
		if(result > 0) {
			model.addAttribute("msg", "삭제에 성공하셨습니다.");
			model.addAttribute("location", location);
		} else {
			model.addAttribute("msg", "삭제에 실패하셨습니다.");
			model.addAttribute("location", location);
		}
		
		return "common/msg";
	}
}
