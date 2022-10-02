package com.bc.heal.train.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bc.heal.train.service.TrainService;
import com.bc.heal.vo.Train;

@Controller
@RequestMapping("/train")
public class TrainController {
	
	@Autowired
	private TrainService service;
	
	@GetMapping("/time") // 출발시간 도착시간 세트로 가져가기 -> ajax
	public List<Train> time(Model model, String start, String end) {
		List<Train> list = new ArrayList<>();
		
		list = service.selectTimeBySta(start, end);
		
		return list;
	}
}
