package com.bc.heal.air.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bc.heal.air.service.AirService;
import com.bc.heal.train.service.TrainService;
import com.bc.heal.vo.Air;

@Controller
@RequestMapping("/air")
public class AirController {

	@Autowired
	private AirService service;
	
	@GetMapping("/time") // 출발시간 도착시간 세트로 가져가기 -> ajax
	public List<Air> time(Model model, String start, String end) {
		List<Air> list = new ArrayList<>();
		
		list = service.selectTimeBySta(start, end);
		
		return list;
	}

}
