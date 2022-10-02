package com.bc.heal.bus.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bc.heal.bus.service.BusService;
import com.bc.heal.vo.Bus;

@Controller
@RequestMapping("/bus")
public class BusController {

	@Autowired
	private BusService service;

	@GetMapping("/time") // 출발시간 도착시간 세트로 가져가기 -> ajax
	@ResponseBody
	public List<String> time(Model model, String start, String end) {
		List<String> list = new ArrayList<>();
		
		Bus bus = service.selectTimeBySta(start, end);
		
		String time = bus.getSchedule(); 
		
		list.add(bus.getWastetime()); // 첫 번째 소요시간 넣기
		if(bus.getNormalprice() == 0) { // 두 번째 가격 넣기
			list.add("10500");
		} else {
			list.add(Integer.toString(bus.getNormalprice()));
		}
		
		int count = 0;
		while(true) { 
			count = time.indexOf(":", count);
			if(count == -1) {
				break;
			}
			
			list.add(time.substring(count - 2, count + 3)); // 5글자씩 자르기
			
			count++;
		}
		
		System.out.println(list);
		
		return list;
	}
}
