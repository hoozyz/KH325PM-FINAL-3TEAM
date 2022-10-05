package com.bc.heal.pay.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.bc.heal.vo.ApproveResponse;
import com.bc.heal.vo.Member;
import com.bc.heal.vo.ReadyResponse;

@Service
public class PayService {
	
	public ReadyResponse payReady(Member member, String itemName, int totalAmount) { // 숙박 결제 준비

		String user_id = member.getId();
		String order_id = user_id + ", " + itemName;

		// 카카오가 요구한 결제요청request값을 담아줍니다.
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("partner_order_id", order_id);
		parameters.add("partner_user_id", user_id);
		parameters.add("item_name", itemName);
		parameters.add("quantity", String.valueOf(1));
		parameters.add("total_amount", String.valueOf(totalAmount));
		parameters.add("tax_free_amount", "0");
		parameters.add("approval_url", "http://localhost/pay/completed"); // 결제승인시 넘어갈 url
		parameters.add("cancel_url", "http://localhost/pay/cancel"); // 결제취소시 넘어갈 url
		parameters.add("fail_url", "http://localhost/pay/fail"); // 결제 실패시 넘어갈 url

		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
		// 외부url요청 통로 열기.
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/ready";
		// template으로 값을 보내고 받아온 ReadyResponse값 readyResponse에 저장.
		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);
		// 받아온 값 return
		return readyResponse;
	}

	// 결제 승인요청 메서드
	public ApproveResponse payApprove(Member member, String itemName, String tid, String pgToken) {
		String user_id = member.getId();
		String order_id = user_id + ", " + itemName;
		
		// request값 담기.
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("tid", tid);
		parameters.add("partner_order_id", order_id); // 주문명
		parameters.add("partner_user_id", user_id);
		parameters.add("pg_token", pgToken);

		// 하나의 map안에 header와 parameter값을 담아줌.
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

		// 외부url 통신
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/approve";
		// 보낼 외부 url, 요청 메시지(header,parameter), 처리후 값을 받아올 클래스.
		ApproveResponse approveResponse = template.postForObject(url, requestEntity, ApproveResponse.class);

		return approveResponse;
	}

	// header() 셋팅
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK 1714f1012c6401a07dee51c170a8e166");
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		return headers;
	}
}
