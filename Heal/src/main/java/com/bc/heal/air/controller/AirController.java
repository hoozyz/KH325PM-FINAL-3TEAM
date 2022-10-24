package com.bc.heal.air.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bc.heal.air.service.AirService;
import com.bc.heal.vo.Air;

@Controller
@RequestMapping("/air")
public class AirController {

	@Autowired
	private AirService service;

	@GetMapping("/time") // 출발시간 도착시간 세트로 가져가기 -> ajax
	@ResponseBody
	public List<Air> time(Model model, String start, String end, String time) {
		List<Air> list = new ArrayList<>();

		if (time == null) {
			list = service.selectTimeBySta(start, end);
		} else { // 출발시간 있을때
			list.add(service.selectByStartTime(start, end, time));
		}

		return list;
	}

	@GetMapping("/start")
	@ResponseBody
	public List<String> start(String start) {
		List<String> list = new ArrayList<>();
		list = service.selectListByStart(start);
		return list;
	}
}
