package com.bc.heal.review.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@PostMapping("/write")
	public String write(Model model, Review rev, String type,  @Param("no") int no,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, HttpServletRequest req) {
		String location = req.getHeader("Referer");
		
		int memNo = loginMember.getNo();
		
		if (type.equals("hotel")) {
			rev.setHotelno(no);
		} else if (type.equals("camp")) {
			rev.setCampno(no);
		} else if (type.equals("festival")) {
			rev.setFestivalno(no);
		} else if (type.equals("food")) {
			rev.setFoodno(no);
		} else if (type.equals("park")) {
			rev.setParkno(no);
		}
		rev.setMemberno(memNo);
		
		
		
		int result = 0;
		result = revService.insertReview(rev);
		
		if(result > 0) {
			model.addAttribute("msg", "작성에 성공하셨습니다.");
			model.addAttribute("location", location);
		} else {
			model.addAttribute("msg", "작성에 실패하셨습니다.");
			model.addAttribute("location", location);
		}
		return "common/msg";
	}
	
	
	

	@GetMapping("/delete")
	public String delete(Model model, int no, HttpServletRequest req) {
		int result = 0;

		result = revService.delete(no);
		String location = req.getHeader("Referer");

		if (result > 0) {
			model.addAttribute("msg", "삭제에 성공하셨습니다.");
			model.addAttribute("location", location);
		} else {
			model.addAttribute("msg", "삭제에 실패하셨습니다.");
			model.addAttribute("location", location);
		}

		return "common/msg";
	}

	@GetMapping("/like")
	@ResponseBody
	public int like(int no, int check) {
		int like = revService.getLike(no);
		if (check == 1) {
			like = like + 1;
		} else if (check == 0) {
			like = like - 1;
		}

		revService.setLike(no, like);

		return like;
	}

}
