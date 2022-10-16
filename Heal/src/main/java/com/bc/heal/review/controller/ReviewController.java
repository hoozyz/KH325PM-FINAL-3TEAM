package com.bc.heal.review.controller;

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

import com.bc.heal.camp.service.CampService;
import com.bc.heal.common.util.PageInfo;
import com.bc.heal.festival.service.FestivalService;
import com.bc.heal.food.service.FoodService;
import com.bc.heal.hotel.service.HotelService;
import com.bc.heal.park.service.ParkService;
import com.bc.heal.reply.service.ReplyService;
import com.bc.heal.review.service.ReviewService;
import com.bc.heal.vo.Member;
import com.bc.heal.vo.Reply;
import com.bc.heal.vo.Review;

import oracle.jdbc.proxy.annotation.Post;

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

	@PostMapping("write")
	public String write(Model model, @RequestParam Map<String, String> param,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, HttpServletRequest req) {
		String location = req.getHeader("Referer");
		String memNo = ""+loginMember.getNo();
		param.put("memNo", memNo);
		int result = 0;
		
		result = revService.insert(param);
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

	@GetMapping("/list")
	@ResponseBody
	public Map<String, Object> list(@RequestParam Map<String, String> param) {
		Map<String, Object> map = new HashMap<>();

		int page = Integer.parseInt(param.get("no"));

		PageInfo pageInfo = new PageInfo(page, 5, revService.getCount(), 2);

		List<Review> list = new ArrayList<>();
		String sort = param.get("sort");
		
		if(sort.contains("최신")) {
			sort = "new";
		}
		if(sort.contains("오래")) {
			sort = "old";
		}
		if(sort.contains("좋아")) {
			sort = "like";
		}
		if(sort.contains("별점")) {
			sort = "star";
		}

		int campNo = Integer.parseInt(param.get("camp"));
		list = revService.selectRevCamp(campNo, pageInfo, sort); // 캠프번호, 페이지, 정렬

		map.put("list", list);
		map.put("pageInfo", pageInfo);

		return map;
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
