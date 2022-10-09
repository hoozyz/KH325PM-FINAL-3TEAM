package com.bc.heal.hotel.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.hotel.service.HotelService;
import com.bc.heal.vo.Hotel;

@Controller
@RequestMapping("/near")
public class HotelController {
	
	@Autowired
	private HotelService hotelService;
	
	@GetMapping("/nearHotel")
	String list(Model model, @RequestParam Map<String, String> param) {
		
		int page = 1;
		if (param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {
			}
		}
		
		int listCount = hotelService.getHotelCount(param);
		System.out.println("총 게시글 수  : " + listCount);
		model.addAttribute("listCount", listCount);
		
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 12);
		List<Hotel> hotelList = hotelService.getHotelList(pageInfo, param);
		
		System.out.println(hotelList);
		
		model.addAttribute("HotelList", hotelList);
		model.addAttribute("param", param);
		model.addAttribute("pageInfo", pageInfo);
			
		return "/near/nearHotel";
	}	
}
