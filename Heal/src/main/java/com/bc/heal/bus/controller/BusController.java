package com.bc.heal.bus.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bc.heal.bus.service.BusService;
import com.bc.heal.vo.Bus;

@Controller
@RequestMapping("/bus")
public class BusController {

	@Autowired
	private BusService service;
	
	@GetMapping("/time") // 출발시간 도착시간 세트로 가져가기 -> ajax
	public List<String> time(Model model, String start, String end) {
		List<String> list = new ArrayList<>();
		
		Bus bus = service.selectTimeBySta(start, end);
		
		String time = bus.getSchedule().replace("(우등)", "").replace("/", ""); // 시간 일자로 나열
		
		int count = 0;
		while(true) { // 5글자씩 잘라서 시간 리스트에 넣기
			list.add(time.substring(count, count + 5));
			
			count = count + 5;
					
			if(count + 2 > time.length()) {
				break;
			}
		}
		
		return list;
	}
}
