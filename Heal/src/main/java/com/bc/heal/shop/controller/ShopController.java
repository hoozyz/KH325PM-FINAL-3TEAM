package com.bc.heal.shop.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bc.heal.shop.service.ShopService;
import com.bc.heal.vo.Shop;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService service;

	@GetMapping("/main")
	public String main(Model model) throws UnsupportedEncodingException {
		// 초반 db 넣기 처음만 코드 실행
//		List<String> wordList = new ArrayList<>();
//		wordList.add("호텔");
//		wordList.add("캠핑음식");
//		wordList.add("텐트");    
//		wordList.add("캠핑고기");  
//		wordList.add("캠핑테이블"); 
//		wordList.add("캠핑의자");  
//		wordList.add("조명");    
//		wordList.add("그릴");    
//		wordList.add("버너");    
//		wordList.add("팬");     
//		wordList.add("코펠");    
//		wordList.add("아이스박스"); 
//		wordList.add("차량용");   
//		wordList.add("바베큐");   
//		wordList.add("침낭");    
//		wordList.add("장작");
//		wordList.add("입장권");
//		insert(wordList);
		
		
		List<Shop> saleList = new ArrayList<>(); // 여행상품 200개 중 3개
		saleList = service.selectByTrip(); // 리스트 3개
		model.addAttribute("saleList", saleList);
		return "shop/shopMain";
	}

	@GetMapping("/search") // 쇼핑 검색
	public String search(String keyword, Model model) throws UnsupportedEncodingException {
		List<Shop> list = new ArrayList<>();
		
		keyword = URLEncoder.encode(keyword, "UTF-8");
		String shopResponse = shopSearch(keyword);
		String[] fields = { "title", "link", "image", "lprice", "mallName", "productId", "maker", "category1",
				"category2", "category3", "category4" }; // 가져올 정보 키값
		Map<String, Object> shopResult = getResult(shopResponse, fields);

		if (shopResult.size() > 0) {
			List<Map<String, Object>> shopItems = (List<Map<String, Object>>) shopResult.get("result");

			for (Map<String, Object> shopItem : shopItems) {
				String id = (String) shopItem.get("productId");
				String title = (String) shopItem.get("title");
				title = title.replace("<b>", ""); // b태그 없애기
				title = title.replace("</b>", ""); // b태그 없애기
				String link = (String) shopItem.get("link");
				String image = (String) shopItem.get("image");
				int price = Integer.parseInt((String) shopItem.get("lprice"));
				String mallName = (String) shopItem.get("mallName");
				String maker = (String) shopItem.get("maker");
				String cate1 = (String) shopItem.get("category1");
				String cate2 = (String) shopItem.get("category2");
				String cate3 = (String) shopItem.get("category3");
				String cate4 = (String) shopItem.get("category4");

				Shop shop = new Shop(id, title, link, image, price, mallName, maker, cate1, cate2, cate3, cate4);
				list.add(shop);
			}
		}
		
		return "";
	}

	// 네이버 쇼핑 API
	public String shopSearch(String keyword) {
		HttpURLConnection con = null;
		String newsUrl = "https://openapi.naver.com/v1/search/shop.json?display=100&exclude=used:rental:cbshop&query=";
		String result = "";

		try {
			URL url = new URL(newsUrl + keyword);
			con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", "SlmkREwMnVQKNyFUPgtq");
			con.setRequestProperty("X-Naver-Client-Secret", "JxqU7vh8Wm");

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK)
				result = readBody(con.getInputStream());
			else
				result = readBody(con.getErrorStream());

		} catch (Exception e) {
			System.out.println("연결 오류 : " + e);
		} finally {
			con.disconnect();
		}

		return result;
	}

	public String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

	public Map<String, Object> getResult(String response, String[] fields) {
		Map<String, Object> rtnObj = new HashMap<>();

		try {
			JSONParser parser = new JSONParser();
			JSONObject result = (JSONObject) parser.parse(response);

			rtnObj.put("total", (long) result.get("total"));

			JSONArray items = (JSONArray) result.get("items");
			List<Map<String, Object>> itemList = new ArrayList<>();
			Thread.sleep(40);

			for (int i = 0; i < items.size(); i++) {
				JSONObject item = (JSONObject) items.get(i);
				Map<String, Object> itemMap = new HashMap<>();

				for (String field : fields) {
					itemMap.put(field, item.get(field));
				}
				itemList.add(itemMap);
			}

			rtnObj.put("result", itemList);
		} catch (Exception e) {
		}

		return rtnObj;
	}

	public void insert(List<String> wordList) throws UnsupportedEncodingException {
		List<Shop> list = new ArrayList<>();
		for(int i = 0; i < wordList.size(); i++) {
			String keyword = URLEncoder.encode(wordList.get(i), "UTF-8");
			String shopResponse = shopSearch(keyword);
			String[] fields = { "title", "link", "image", "lprice", "mallName", "productId", "maker", "category1", "category2", "category3", "category4"}; // 가져올 정보 키값 
			Map<String, Object> shopResult = getResult(shopResponse, fields);
	
			if (shopResult.size() > 0) {
				List<Map<String, Object>> shopItems = (List<Map<String, Object>>) shopResult.get("result");
				
				for(Map<String, Object> shopItem : shopItems) {
					String id = (String) shopItem.get("productId");
					String title = (String) shopItem.get("title");
					title = title.replace("<b>", ""); // b태그 없애기
					title = title.replace("</b>", ""); // b태그 없애기
					String link = (String) shopItem.get("link");
					String image = (String) shopItem.get("image");
					int price = Integer.parseInt((String) shopItem.get("lprice"));
					String mallName = (String) shopItem.get("mallName");
					String maker = (String) shopItem.get("maker");
					String cate1 = (String) shopItem.get("category1");
					String cate2 = (String) shopItem.get("category2");
					String cate3 = (String) shopItem.get("category3");
					String cate4 = (String) shopItem.get("category4");
					
					Shop shop = new Shop(id, title, link, image, price, mallName, maker, cate1, cate2, cate3, cate4);
					list.add(shop);
				}
			}
		}
		service.insert(list);
		
	}
}
