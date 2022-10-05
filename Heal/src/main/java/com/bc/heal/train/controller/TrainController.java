package com.bc.heal.train.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bc.heal.train.service.TrainService;
import com.bc.heal.vo.Train;

@Controller
@RequestMapping("/train")
public class TrainController {
	
	@Autowired
	private TrainService service;
	
	@GetMapping("/time") // ajax
	@ResponseBody
	public List<Train> time(Model model, String start, String end, String time) {
		List<Train> list = new ArrayList<>();
		
		if(time == null) {
			list = service.selectTimeBySta(start, end);
		} else { // 출발시간 있을때
			list.add(service.selectByStartTime(start, end, time));
		}
		
		for(int i = 0; i < list.size(); i++) {
			if(i == 0) {
				if(list.get(i).getGeneralprice() == 0) { // 가격이 없을 때
					list.get(i).setGeneralprice(10500);
				}
				
				continue;
			}
			
			if(list.get(i).getGeneralprice() == 0) { // 가격이 없을 때
				list.get(i).setGeneralprice(list.get(i-1).getGeneralprice());
			}
		}
		
		return list;
	}
}
