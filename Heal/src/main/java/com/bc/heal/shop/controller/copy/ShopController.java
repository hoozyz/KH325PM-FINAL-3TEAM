package com.bc.heal.shop.controller.copy;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	
	@GetMapping("/shopMain")
	public String shopMain(Model model) {
		return "/shop/shopMain";
	}
	
	
	
}
