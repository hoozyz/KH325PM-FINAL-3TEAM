package com.bc.heal.park.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

	@Controller
	@RequestMapping("/park")
	public class ParkController {
		
		
		@GetMapping("/parkMain")
		public String park(Model model) {
			return "/park/parkMain";
		}
		
}
