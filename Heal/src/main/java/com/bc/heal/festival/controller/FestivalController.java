package com.bc.heal.festival.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.festival.service.FestivalService;
import com.bc.heal.vo.Festival;

@Controller
@RequestMapping("/festival")
public class FestivalController {
	
	@Autowired
	private FestivalService service;
	
	@GetMapping("/festivalMain")
	public String main(Model model) {
		return "/festival/festivalMain";
	}

	@GetMapping("/festivalSearch")
	public String search(Model model, @RequestParam Map<String, String> param) {
		for(String mapkey : param.keySet()) {
			System.out.println("key:"+mapkey+",value:"+param.get(mapkey));
		}

		int page = 1;
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		
		int listCount = service.getFestivalCount(param);
		System.out.println("총 게시글 수  : " + listCount);
		model.addAttribute("listCount", listCount);
		
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 10);
		List<Festival> list = service.getFestivalList(pageInfo, param);
		
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		model.addAttribute("pageInfo", pageInfo);
		
		return "/festival/festivalSearch";
	}
	
	@GetMapping("/list") 
	@ResponseBody
	public Map<String, Object> list(Model model, @RequestParam Map<String, String> param) {
		PageInfo pageInfo = null;
		int page = 1;
		if (param.containsKey("page")) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {
			}
		}
		
		pageInfo = new PageInfo(page, 5, service.getFestivalCount(param), 10); 

		List<Festival> list = new ArrayList<>();
		list = service.getFestivalList(pageInfo, param);
		
		Map<String, Object> map = new HashMap<>();

		map.put("list", list);
		map.put("param", param);
		map.put("pageInfo", pageInfo);
		return map;
	}
	
	
	
}
