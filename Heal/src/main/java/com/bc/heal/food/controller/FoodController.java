package com.bc.heal.food.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.food.service.FoodService;
import com.bc.heal.vo.Food;

@Controller
@RequestMapping("/near")
public class FoodController {
	
	@Autowired
	private FoodService foodService;
	
	@GetMapping("/nearFood")
	String list(Model model, @RequestParam Map<String, String> param) {
		
		int page = 1;
		if (param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {
			}
		}
		
		int listCount = foodService.getFoodCount(param);
		System.out.println("총 게시글 수  : " + listCount);
		model.addAttribute("listCount", listCount);
		
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 12);
		List<Food> foodList = foodService.getFoodList(pageInfo, param);
		
		System.out.println(foodList);
		
		model.addAttribute("FoodList", foodList);
		model.addAttribute("param", param);
		model.addAttribute("pageInfo", pageInfo);
		
		return "/near/nearFood";
		
	}
}
