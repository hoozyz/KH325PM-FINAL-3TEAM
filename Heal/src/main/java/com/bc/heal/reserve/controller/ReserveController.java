package com.bc.heal.reserve.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.bc.heal.air.service.AirService;
import com.bc.heal.bus.service.BusService;
import com.bc.heal.camp.service.CampService;
import com.bc.heal.hotel.service.HotelService;
import com.bc.heal.reserve.service.ReserveService;
import com.bc.heal.train.service.TrainService;
import com.bc.heal.vo.Air;
import com.bc.heal.vo.Bus;
import com.bc.heal.vo.Camp;
import com.bc.heal.vo.Hotel;
import com.bc.heal.vo.Member;
import com.bc.heal.vo.Reserve;
import com.bc.heal.vo.Train;

@Controller
@RequestMapping("/reserve") // 예약
public class ReserveController {

	@Autowired
	private ReserveService service;

	@Autowired
	private CampService campService;

	@Autowired
	private HotelService hotelService;

	@Autowired
	private BusService busService;

	@Autowired
	private TrainService trainService;

	@Autowired
	private AirService airService;

	@PostMapping("/save")
	public String save(Model model, Reserve reserve, HttpServletRequest req) {
		int result = 0;
		if (reserve == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
		}

		String location = req.getHeader("Referer");

		if (result > 0) {
			model.addAttribute("msg", "예약에 성공하였습니다.");
		} else {
			model.addAttribute("msg", "예약에 실패하였습니다.");
		}

		return location; // 이전 페이지로 보내기
	}

	@GetMapping("/myCamp") // 캠핑장, 숙박업소
	public String camp(Model model, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		List<Reserve> campReserve = new ArrayList<>(); // campno 를 가진 reserve 가져오기
		List<Reserve> hotelReserve = new ArrayList<>();

		campReserve = service.selectCamp(loginMember.getNo());
		hotelReserve = service.selectHotel(loginMember.getNo());

		List<Camp> campList = new ArrayList<>(); // campno를 이용해 list 가져오기
		List<Hotel> hotelList = new ArrayList<>();

		for (int i = 0; i < campReserve.size(); i++) {
			campList.add(campService.findByNo(campReserve.get(i).getCampno()));
		}
		for (int i = 0; i < hotelReserve.size(); i++) {
			hotelList.add(hotelService.findByNo(hotelReserve.get(i).getHotelno()));
		}

		if (!campList.isEmpty() || !hotelList.isEmpty()) {
			model.addAttribute("campReserve", campReserve);
			model.addAttribute("hotelReserve", hotelReserve);
			model.addAttribute("campList", campList);
			model.addAttribute("hotelList", hotelList);
		} else {
			model.addAttribute("msg", "캠핑장 예약내역이 없습니다.");
		}
		return "/member/myCamp";
	}

	@GetMapping("/myTraffic") // 교통
	public String traffic(Model model, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		List<Reserve> busReserve = new ArrayList<>();
		List<Reserve> trainReserve = new ArrayList<>();
		List<Reserve> airReserve = new ArrayList<>();

		busReserve = service.selectBus(loginMember.getNo());
		trainReserve = service.selectTrain(loginMember.getNo());
		airReserve = service.selectAir(loginMember.getNo());

		List<Bus> busList = new ArrayList<>();
		List<Train> trainList = new ArrayList<>();
		List<Air> airList = new ArrayList<>();

		for (int i = 0; i < busReserve.size(); i++) {
			busList.add(busService.findByNo(busReserve.get(i).getBusno()));
		}
		for (int i = 0; i < trainReserve.size(); i++) {
			trainList.add(trainService.findByNo(trainReserve.get(i).getTrainno()));
		}
		for (int i = 0; i < airReserve.size(); i++) {
			airList.add(airService.findByNo(airReserve.get(i).getAirno()));
		}

		if (!busList.isEmpty() || !trainList.isEmpty() || !airList.isEmpty()) {
			model.addAttribute("busReserve", busReserve);
			model.addAttribute("trainReserve", trainReserve);
			model.addAttribute("airReserve", airReserve);
			model.addAttribute("busList", busList);
			model.addAttribute("trainList", trainList);
			model.addAttribute("airList", airList);
		} else {
			model.addAttribute("msg", "교통 예약내역이 없습니다.");
		}
		return "/member/myTraffic";
	}

	@GetMapping("/delete")
	public String deleteReserve(Model model, int no, HttpServletRequest req) {
		int result = 0;

		result = service.delete(no);

		String location = req.getHeader("Referer");

		if (result > 0) {
			model.addAttribute("msg", "삭제에 성공하였습니다.");
		} else {
			model.addAttribute("msg", "삭제에 실패하였습니다.");
		}

		return location;
	}
}
