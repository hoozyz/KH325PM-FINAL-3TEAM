package com.bc.heal.park.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bc.heal.vo.PageInfo;
import com.bc.heal.park.service.ParkService;
import com.bc.heal.vo.Park;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/park")
public class ParkController {

	@Autowired
	private ParkService service;

	@GetMapping("/parkMain")
	public String park(Model model) {
		return "/park/parkMain";
	}

	@GetMapping("/parkList")
	public String parkList(Model model, @RequestParam Map<String, String> param) {
		
		System.out.println(param);
		int page = 1;
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		
		PageInfo pageInfo = new PageInfo(page, 10, service.getParkCount(param), 10);
		List<Park> list = service.getParkList(pageInfo, param);
		
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		model.addAttribute("pageInfo", pageInfo);
		
		return "/park/parkSearch";
	}

}
