package com.bc.heal.like.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import com.bc.heal.vo.Review;

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

	
	@PostMapping("/like")
	@ResponseBody
	public Map<String, Object> write(Model model, @RequestParam Map<String, String> param,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String location = req.getHeader("Referer");
		
		Map<String, Object> map = new HashMap<String, Object>();
		Like like = new Like();
		
		int memNo = loginMember.getNo();
		like.setMemberno(memNo);
		
		String type = param.get("camp");
		if (type.equals("hotel")) {
			like.setHotelno(Integer.parseInt(param.get("likeNo")));
		} else if (type.equals("camp")) {
			like.setCampno(Integer.parseInt(param.get("likeNo")));
		} else if (type.equals("festival")) {
			like.setFestivalno(Integer.parseInt(param.get("likeNo")));
		} else if (type.equals("food")) {
			like.setFoodno(Integer.parseInt(param.get("likeNo")));
		} else if (type.equals("park")) {
			like.setParkno(Integer.parseInt(param.get("likeNo")));
		}
		
		System.out.println(like);
		
		int result = 0;
		result = likeService.insertLike(like);
		
		
		for( Entry<String, Object> element : map.entrySet() ){
		    String key = element.getKey();
		    Object value = element.getValue();
		    System.out.println( String.format("키 : "+key+" 값 : "+value));
		}
		
		
		if(result > 0) {
			model.addAttribute("msg", "찜하기.");
			model.addAttribute("location", location);

			
		} else {
			model.addAttribute("msg", "찜 취소.");
			model.addAttribute("location", location);
		}
		
		
		return map;
	}
	
	
	

}
