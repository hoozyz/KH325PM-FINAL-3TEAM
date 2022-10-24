package com.bc.heal.like.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.bc.heal.festival.service.FestivalService;
import com.bc.heal.food.service.FoodService;
import com.bc.heal.hotel.service.HotelService;
import com.bc.heal.like.service.LikeService;
import com.bc.heal.park.service.ParkService;
import com.bc.heal.vo.Like;
import com.bc.heal.vo.Member;

@Controller
@RequestMapping("/like")
public class LikeController {

	@Autowired
	private LikeService likeService;
	
	@Autowired
	private CampService campService;
	
	@Autowired
	private HotelService hotelService;
	
	@Autowired
	private FestivalService fesService;
	
	@Autowired
	private FoodService foodService;
	
	@Autowired
	private ParkService parkService;

	@GetMapping("/myLike")
	public String myLike(Model model, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		List<Like> likeList = new ArrayList<>(); // like 중 최신 5개 가져오기
		List<Object> allList = new ArrayList<>(); // 찜들 담을 list -> Object로 모든 객체 다 담을 수 있게 함

		likeList = likeService.selectNew(loginMember.getNo());

		for (int i = 0; i < likeList.size(); i++) {
			if (likeList.get(i).getCampno() != 0) { // 캠핑에 관한 찜일때
				allList.add(campService.findByNo(likeList.get(i).getCampno()));
			}
			if (likeList.get(i).getHotelno() != 0) {
				allList.add(hotelService.findByNo(likeList.get(i).getHotelno()));
			}
			if (likeList.get(i).getFestivalno() != 0) {
				allList.add(fesService.findByNo(likeList.get(i).getFestivalno()));
			}
			if (likeList.get(i).getFoodno() != 0) {
				allList.add(foodService.findByNo(likeList.get(i).getFoodno()));
			}
			if (likeList.get(i).getParkno() != 0) {
				allList.add(parkService.findByNo(likeList.get(i).getParkno()));
			}
		}
		
		model.addAttribute("likeList", likeList);
		model.addAttribute("allList", allList);

		return "/member/myLike";
	}
	
	@GetMapping("/delete")
	public String delete(Model model, int no, HttpServletRequest req) {
		String location = req.getHeader("Referer");
		
		likeService.deleteLike(no);
		model.addAttribute("location", location);
		return "common/msg";
	}

	
	@PostMapping("/like")
	@ResponseBody
	public int write(Model model, @RequestParam Map<String, String> param,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int memNo = loginMember.getNo();
		int no = 0;
		
		if(param.containsKey("no")) {
			no = Integer.parseInt(param.get("no"));
			likeService.deleteLike(no);
		} else { // 찜하기
			no = likeService.selectNo(memNo, param);
		}
		return no;
	}
	
	
	

}
