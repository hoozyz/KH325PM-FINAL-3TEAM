package com.bc.heal;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bc.heal.air.service.AirService;
import com.bc.heal.bus.service.BusService;
import com.bc.heal.shop.service.ShopService;
import com.bc.heal.train.service.TrainService;
import com.bc.heal.vo.Air;
import com.bc.heal.vo.Bus;
import com.bc.heal.vo.Shop;
import com.bc.heal.vo.Train;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private ShopService showService;

	@Autowired
	private AirService airService;

	@Autowired
	private BusService busService;

	@Autowired
	private TrainService trainService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		List<Shop> shopList = new ArrayList<>();
		shopList = showService.selectByMain(); // 3개
		model.addAttribute("shopList", shopList);

		// 도착역
		List<String> trainEndList = new ArrayList<>();
		List<String> busEndList = new ArrayList<>();
		List<String> airEndList = new ArrayList<>();

		trainEndList = trainService.selectEnd();
		busEndList = busService.selectEnd();
		airEndList = airService.selectEnd();

		// 출발역 리스트
		List<String> trainStartList = new ArrayList<>();
		List<String> busStartList = new ArrayList<>();
		List<String> airStartList = new ArrayList<>();

		trainStartList = trainService.selectStart();
		busStartList = busService.selectStart();
		airStartList = airService.selectStart();

		model.addAttribute("trainStartList", trainStartList);
		model.addAttribute("busStartList", busStartList);
		model.addAttribute("airStartList", airStartList);
		model.addAttribute("trainEndList", trainEndList);
		model.addAttribute("busEndList", busEndList);
		model.addAttribute("airEndList", airEndList);

		return "home";
	}

}
