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

import com.bc.heal.pay.service.PayService;
import com.bc.heal.reserve.service.ReserveService;
import com.bc.heal.vo.ApproveResponse;
import com.bc.heal.vo.Member;
import com.bc.heal.vo.ReadyResponse;
import com.bc.heal.vo.Reserve;

@Controller
@RequestMapping("/pay")
@SessionAttributes({"tid","reserve","itemName","location"}) // modelattribute 쓰려면 필요 -> 세션이나 모델에 있는거 찾아옴
public class PayController {

	@Autowired
	private PayService payService;

	@Autowired
	private ReserveService resService;

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
		
		System.out.println(readyResponse.getTid());
		
		if(type.equals("camp")) { // 캠핑장 예약일때
			Reserve reserve = new Reserve(0, "", start, "", readyResponse.getTid(), itemName, totalAmount, loginMember.getNo(), 0, no, 0, 0, 0);
			model.addAttribute("reserve", reserve);
		} else {
			Reserve reserve = new Reserve(0, "", start, "", readyResponse.getTid(), itemName, totalAmount, loginMember.getNo(), no, 0, 0, 0, 0);
			model.addAttribute("reserve", reserve);
		}

		return readyResponse; // 클라이언트에 보냄.(tid,next_redirect_pc_url이 담겨있음.)
	}

	// 카카오페이결제 요청
	@GetMapping("/traffic") // 교통 결제
	public @ResponseBody ReadyResponse payReady(@RequestParam(name = "total_amount") int totalAmount,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, String start,
			String itemName, Model model) {

		// 카카오 결제 준비하기 - 결제요청 service 실행.
		ReadyResponse readyResponse = payService.payReady(loginMember, itemName, totalAmount);
		// 요청처리후 받아온 결재고유 번호(tid)를 모델에 저장
		model.addAttribute("tid", readyResponse.getTid());
		
		return readyResponse; // 클라이언트에 보냄.(tid,next_redirect_pc_url이 담겨있음.)
	}

	// 결제승인요청
	@GetMapping("/completed")
	public String payCompleted(@RequestParam("pg_token") String pgToken, @ModelAttribute("readyResponse") ReadyResponse readyResponse,
			@ModelAttribute("tid") String tid, @ModelAttribute("reserve") Reserve reserve, @ModelAttribute("itemName") String itemName,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, String location, Model model) {
		
		// 카카오 결재 요청하기
		ApproveResponse approveResponse = payService.payApprove(loginMember, itemName, tid, pgToken);
		
		int result = 0;
		result = resService.save(reserve);
		
		if(result > 0) {
			model.addAttribute("reserve", reserve);
			model.addAttribute("msg", "예약이 완료되었습니다.");
			model.addAttribute("location", location);
		} else {
			model.addAttribute("msg", "예약이 실패하였습니다.");
			model.addAttribute("location", location);
		}

		return "common/msg"; // 예약정보 저장
	}

	// 결제 취소시 실행 url
	@GetMapping("/cancel")
	public String payCancel() {
		return "redirect:/carts";
	}

	// 결제 실패시 실행 url
	@GetMapping("/fail")
	public String payFail() {
		return "redirect:/carts";
	}
}
