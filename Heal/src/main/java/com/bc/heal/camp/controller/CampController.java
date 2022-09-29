package com.bc.heal.camp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/camp")
public class CampController {
	
	
	@GetMapping("/detail")
	public String detail(Model model) {
		return "/camp/campDetail";
	}
}
