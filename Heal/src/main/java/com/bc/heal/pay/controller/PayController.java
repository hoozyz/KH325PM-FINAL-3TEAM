package com.bc.heal.pay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bc.heal.air.service.AirService;
import com.bc.heal.bus.service.BusService;
import com.bc.heal.member.service.MemberService;
import com.bc.heal.pay.service.PayService;
import com.bc.heal.reserve.service.ReserveService;
import com.bc.heal.train.service.TrainService;
import com.bc.heal.vo.Air;
import com.bc.heal.vo.Bus;
import com.bc.heal.vo.Member;
import com.bc.heal.vo.ReadyResponse;
import com.bc.heal.vo.Reserve;
import com.bc.heal.vo.Train;

@Controller
@RequestMapping("/pay")
@SessionAttributes({ "tid", "reserve1", "reserve2", "itemName", "location" }) // modelattribute 쓰려면 필요 -> 세션이나 모델에 있는거 찾아옴
public class PayController {

	@Autowired
	private PayService payService;

	@Autowired
	private ReserveService resService;

	@Autowired
	private AirService airService;

	@Autowired
	private BusService busService;

	@Autowired
	private TrainService trainService;
	
	@Autowired
	private MemberService memService;

	// 카카오페이결제 요청
	@GetMapping("/camp") // 캠핑장, 호텔 결제
	public @ResponseBody ReadyResponse payReady(@RequestParam(name = "total_amount") int totalAmount,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, String start, String day,
			String itemName, String type, int no, Model model, HttpServletRequest req) {

		// 카카오 결제 준비하기 - 결제요청 service 실행.
		ReadyResponse readyResponse = payService.payReady(loginMember, itemName, totalAmount);
		// 요청처리후 받아온 결재고유 번호(tid)를 모델에 저장
		model.addAttribute("tid", readyResponse.getTid());
		model.addAttribute("itemName", itemName);

		String location = req.getHeader("Referer"); // 결제 이전페이지 미리 받기.
		model.addAttribute("location", location);
		loginMember = memService.findById(loginMember.getId());
		System.out.println(loginMember);
		if (type.equals("camp")) { // 캠핑장 예약일때
			Reserve reserve1 = new Reserve(0, "", start, "", readyResponse.getTid(), itemName, totalAmount,
					loginMember.getNo(), 0, no, 0, 0, 0);
			model.addAttribute("reserve1", reserve1);
		} else {
			Reserve reserve1 = new Reserve(0, "", start, "", readyResponse.getTid(), itemName, totalAmount,
					loginMember.getNo(), no, 0, 0, 0, 0);
			model.addAttribute("reserve1", reserve1);
		}
		Reserve reserve2 = new Reserve(-1, "", "", "", "", "", 0, 0, 0, 0, 0, 0, 0);
		model.addAttribute("reserve2", reserve2);

		return readyResponse; // 클라이언트에 보냄.(tid,next_redirect_pc_url이 담겨있음.)
	}

	@GetMapping("/traffic") // 교통 결제
	public @ResponseBody ReadyResponse payReady(@RequestParam(name = "total_amount") int totalAmount,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, String start, String end,
			String time, String date, String count, String type, String itemName, String str, Model model, HttpServletRequest req) {

		String location = req.getHeader("Referer"); // 결제 이전페이지 미리 받기.
		model.addAttribute("location", location);

		Reserve reserve2 = new Reserve(-1, "", "", "", "", "", 0, 0, 0, 0, 0, 0, 0);
		// 오는편 예매
		if(type.equals("airRound")) { // 왕복일 때
			Air air = airService.selectByStartTime(start, end, time);
			// 오는 표 예약정보
			reserve2 = new Reserve(0, "", date, time, "", count, totalAmount, 
					loginMember.getNo(), 0, 0, air.getNo(), 0, 0);
			totalAmount = totalAmount + Integer.parseInt(str.split(",")[4]); // 가격 2개 더하기
			itemName = itemName + str.split(",")[3];
			String start1 = start; // start 넣어놓기
			start = end; // 출발역 도착역 바꾸기
			end = start1;
			date = str.split(",")[0];
			time = str.split(",")[1];
			count = str.split(",")[2];
		}
		if(type.equals("trainRound")) { // 왕복일 때
			Train train = trainService.selectByStartTime(start, end, time);
			reserve2 = new Reserve(0, "", date, time, "", count, totalAmount, 
					loginMember.getNo(), 0, 0, 0, 0, train.getNo());
			totalAmount = totalAmount + Integer.parseInt(str.split(",")[4]); // 가격 2개 더하기
			itemName = itemName + str.split(",")[3];
			String start1 = start; // start 넣어놓기
			start = end; // 출발역 도착역 바꾸기
			end = start1;
			date = str.split(",")[0];
			time = str.split(",")[1];
			count = str.split(",")[2];
		}
		if(type.equals("busRound")) { // 왕복일 때
			Bus bus = busService.selectTimeBySta(start, end);
			reserve2 = new Reserve(0, "", date, time, "", count, totalAmount, 
					loginMember.getNo(), 0, 0, 0, bus.getNo(), 0);
			totalAmount = totalAmount + Integer.parseInt(str.split(",")[4]); // 가격 2개 더하기
			itemName = itemName + str.split(",")[3];
			String start1 = start; // start 넣어놓기
			start = end; // 출발역 도착역 바꾸기
			end = start1;
			date = str.split(",")[0];
			time = str.split(",")[1];
			count = str.split(",")[2];
		}

		// 카카오 결제 준비하기 - 결제요청 service 실행.
		ReadyResponse readyResponse = payService.payReady(loginMember, itemName, totalAmount);
		// 요청처리후 받아온 결재고유 번호(tid)를 모델에 저장
		model.addAttribute("tid", readyResponse.getTid());
		model.addAttribute("itemName", itemName);
		
		if(str.contains("Round")) { // 왕복일 때
			totalAmount = Integer.parseInt(str.split(",")[4]); // 가는편 가격
			reserve2.setTid(readyResponse.getTid()); // 왕복일 때만 오는편 가능
		}
		model.addAttribute("reserve2", reserve2);
		// reserve1 은 가는거 , reserve2 는 오는거
		// 아래는 가는편 예매
		if (type.contains("air")) {
			Air air = airService.selectByStartTime(start, end, time);
			Reserve reserve1 = new Reserve(0, "", date, time, readyResponse.getTid(), count, totalAmount,
					loginMember.getNo(), 0, 0, air.getNo(), 0, 0);

			model.addAttribute("reserve1", reserve1);
		}
		if (type.contains("train")) {
			Train train = trainService.selectByStartTime(start, end, time);
			Reserve reserve1 = new Reserve(0, "", date, time, readyResponse.getTid(), count, totalAmount,
					loginMember.getNo(), 0, 0, 0, 0, train.getNo());

			model.addAttribute("reserve1", reserve1);
		}
		if (type.contains("bus")) {
			Bus bus = busService.selectTimeBySta(start, end);
			Reserve reserve1 = new Reserve(0, "", date, time, readyResponse.getTid(), count, totalAmount,
					loginMember.getNo(), 0, 0, 0, bus.getNo(), 0);

			model.addAttribute("reserve1", reserve1);
		}
		
		return readyResponse; // 클라이언트에 보냄.(tid,next_redirect_pc_url이 담겨있음.)
	}

	// 결제승인요청
	@GetMapping("/completed")
	public String payCompleted(@RequestParam("pg_token") String pgToken,
			@ModelAttribute("readyResponse") ReadyResponse readyResponse, @ModelAttribute("tid") String tid,
			@ModelAttribute("reserve1") Reserve reserve1, @ModelAttribute("reserve2") Reserve reserve2, @ModelAttribute("itemName") String itemName,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, String location,
			Model model) {

		// 카카오 결제 요청하기
		payService.payApprove(loginMember, itemName, tid, pgToken);

		int result = 0;
		if(reserve2.getNo() != -1) { // 예약 2번째 -> 오는편이 있을때
			result = resService.save(reserve2);
			reserve1.setPrice(reserve1.getPrice() / 2);
		}
		System.out.println(reserve1);
		result += resService.save(reserve1); // 가는편이 먼저보이게

		if (result > 0) {
			model.addAttribute("msg", "예약이 완료되었습니다.");
			model.addAttribute("location", location);
		} else {
			model.addAttribute("msg", "예약이 실패하였습니다.");
			model.addAttribute("location", location);
		}

		return "common/msg"; // 예약정보 저장
	}

}
