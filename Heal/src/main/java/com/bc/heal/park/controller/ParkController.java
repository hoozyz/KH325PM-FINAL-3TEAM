package com.bc.heal.park.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.park.service.ParkService;
import com.bc.heal.vo.Park;
import com.bc.heal.vo.Weather;
import com.bc.heal.weather.service.WeatherService;

@Controller
@RequestMapping("/park")
public class ParkController {

	@Autowired
	private ParkService service;
	
	@Autowired
	private WeatherService weaService;

	@GetMapping("/parkMain")
	public String park(Model model) throws IOException, ParseException {
		
		// 인기공원
		Park famousPark1 = service.findByNo(36228);
		Park famousPark2 = service.findByNo(53216);

		List<Weather> famousWeather = new ArrayList<>();
		famousWeather = weatherApi(weaService.selectByDong("방이1동").getNx(), weaService.selectByDong("방이1동").getNy());
		Weather today = famousWeather.get(0);
		Weather one = famousWeather.get(1);
		Weather two = famousWeather.get(2);
		

		
		model.addAttribute("famousPark1", famousPark1);
		model.addAttribute("famousPark2", famousPark2);
		model.addAttribute("today", today);
		model.addAttribute("one", one);
		model.addAttribute("two", two);

		return "/park/parkMain";
	}

	@GetMapping("/parkList")
	public String parkList(Model model, @RequestParam Map<String, String> param) { 
		
		int page = 1;
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		
		PageInfo pageInfo = new PageInfo(page, 5, service.getParkCount(param), 6);
		List<Park> list = service.getParkList(pageInfo, param);
		int searchCount = service.getParkCount(param);
		
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("searchCount", searchCount);
		return "/park/parkSearch";
	}
	
	@GetMapping("/parkDetail")
	public String parkDetail(Model model, @RequestParam("no") int no) {
		Park park = service.findByNo(no);
		
		// 날씨
		List<Weather> weaList = new ArrayList<>();
		
		String check = "";
		String[] checkArr;
		String dong = "";
		if (park.getAddr().contains("면")) {
			check = park.getAddr().split("면")[0]; // 면 기준 앞에만 자르기
			checkArr = check.split(" ");
			dong = checkArr[checkArr.length - 1] + "면";

		} else if (park.getAddr().contains("읍")) {
			check = park.getAddr().split("읍")[0];
			checkArr = check.split(" ");
			dong = checkArr[checkArr.length - 1] + "읍";

		} else if (park.getAddr().contains("동")) {
			check = park.getAddr().split("동")[0];
			checkArr = check.split(" ");
			dong = checkArr[checkArr.length - 1] + "동";
		}

		System.out.println(park.getAddr().split(dong));
		try {
			weaList = weatherApi(weaService.selectByDong(dong).getNx(), weaService.selectByDong(dong).getNy()); 
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Weather today = new Weather(); // 오늘
		Weather one = new Weather(); // 내일
		Weather two = new Weather(); // 모레
		
		today = weaList.get(0);
		one = weaList.get(1);
		two = weaList.get(2);
		
		model.addAttribute("park", park);
		model.addAttribute("today", today);
		model.addAttribute("one", one);
		model.addAttribute("two", two);
		
		return "/park/parkDetail";
	}
	
	
	
	// 날씨 api -> 날짜별 -> 오늘, 내일, 모레 전체 정보 -> date 에는 시간까지 **:** -> ****
	public List<Weather> weatherApi(String nx, String ny) throws IOException, ParseException {
		List<Weather> list = new ArrayList<>(); // 오늘 내일 모레 날씨 담을 리스트
		Weather today = new Weather(); // 오늘
		Weather one = new Weather(); // 내일
		Weather two = new Weather(); // 모레

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH");

		Date now = new Date();
		String nowTime = sdf.format(now);

		String date = nowTime.split(" ")[0]; // 날짜만

		String time = nowTime.split(" ")[1] + "00"; // 시간중 -> 0900 처럼 만들기

		Calendar cal = Calendar.getInstance();
		cal.setTime(now);

		String oneDate = "";
		String twoDate = "";

		if (time.equals("0000") || time.equals("0100") || time.equals("0200")) { // 00시, 01시, 02시 면 전날로 바꿈
			time = "0300";
			oneDate = date;
			
			cal.add(Calendar.DATE, -1);
			date = sdf.format(cal.getTime()).split(" ")[0];
			cal.add(Calendar.DATE, 2);
			twoDate = sdf.format(cal.getTime()).split(" ")[0];
			
		} else {
			cal.add(Calendar.DATE, 1); // 하루 추가
			oneDate = sdf.format(cal.getTime()).split(" ")[0]; // 내일 날짜
			cal.add(Calendar.DATE, 1); // 하루 추가
			twoDate = sdf.format(cal.getTime()).split(" ")[0]; // 모레 날짜
		}
		
		String urlStr = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?"
				+ "serviceKey=1n4THo6i88dAniTj3VQPQLc%2BKj8AhB%2BjrA2WmJxMjKlcpkoi%2BsxoUiHXhe%2Fhrp8NY9BQOoPu1Vdj8UuQH4g2Dg%3D%3D"
				+ "&pageNo=1&numOfRows=1000&dataType=json&base_date=" + date + "&base_time=0200&nx=" + nx + "&ny=" + ny;

		URL url = new URL(urlStr);

		String line = "";
		String result = "";

		BufferedReader br;
		br = new BufferedReader(new InputStreamReader(url.openStream()));
		while ((line = br.readLine()) != null) {
			result = result.concat(line);
		}

		JSONParser parser = new JSONParser();

		JSONObject jsonMain = (JSONObject) parser.parse(result);

		JSONObject jsonResponse = (JSONObject) jsonMain.get("response");

		JSONObject jsonBody = (JSONObject) jsonResponse.get("body");

		JSONObject jsonItems = (JSONObject) jsonBody.get("items");

		JSONArray jsonItemArr = (JSONArray) jsonItems.get("item");

		String pop = "";
		String pcp = "";
		String reh = "";
		String sky = "";
		String tmp = "";
		String tmn = "";
		String tmx = "";

		if (jsonItemArr.size() > 0) {
			for (int i = 0; i < jsonItemArr.size(); i++) {
				JSONObject jsonItem = (JSONObject) jsonItemArr.get(i);

				String category = (String) jsonItem.get("category"); // 구별 코드 가져오기
				String timeCheck = (String) jsonItem.get("fcstTime"); // 기준 시간
				String dateCheck = (String) jsonItem.get("fcstDate"); // 기준 날짜

				if (dateCheck.equals(date) && timeCheck.equals(time)) { // 오늘 -> 현재시간
					if (category.equals("POP")) { // 강수확률
						pop = (String) jsonItem.get("fcstValue");
						today.setPop(pop);
					}
					if (category.equals("PCP")) { // 현재 강수량
						pcp = (String) jsonItem.get("fcstValue");
						today.setPcp(pcp);
					}
					if (category.equals("REH")) { // 습도
						reh = (String) jsonItem.get("fcstValue");
						today.setReh(reh);
					}
					if (category.equals("SKY")) { // 구름상태 -> 0~5 좋음, 6~8 구름많음, 9~10 흐림
						sky = (String) jsonItem.get("fcstValue");
						today.setSky(sky);
					}
					if (category.equals("TMP")) { // 현재기온
						tmp = (String) jsonItem.get("fcstValue");
						today.setTmp(tmp);
					}
				}
				if (dateCheck.equals(oneDate) && timeCheck.equals(time)) { // 내일
					if (category.equals("POP")) { // 강수확률
						pop = (String) jsonItem.get("fcstValue");
						one.setPop(pop);
					}
					if (category.equals("PCP")) { // 현재 강수량
						pcp = (String) jsonItem.get("fcstValue");
						one.setPcp(pcp);
					}
					if (category.equals("REH")) { // 습도
						reh = (String) jsonItem.get("fcstValue");
						one.setReh(reh);
					}
					if (category.equals("SKY")) { // 구름상태 -> 0~5 좋음, 6~8 구름많음, 9~10 흐림
						sky = (String) jsonItem.get("fcstValue");
						one.setSky(sky);
					}
					if (category.equals("TMP")) { // 현재기온
						tmp = (String) jsonItem.get("fcstValue");
						one.setTmp(tmp);
					}
				}
				if (dateCheck.equals(twoDate) && timeCheck.equals(time)) { // 모레
					if (category.equals("POP")) { // 강수확률
						pop = (String) jsonItem.get("fcstValue");
						two.setPop(pop);
					}
					if (category.equals("PCP")) { // 현재 강수량
						pcp = (String) jsonItem.get("fcstValue");
						two.setPcp(pcp);
					}
					if (category.equals("REH")) { // 습도
						reh = (String) jsonItem.get("fcstValue");
						two.setReh(reh);
					}
					if (category.equals("SKY")) { // 구름상태 -> 0~5 좋음, 6~8 구름많음, 9~10 흐림
						sky = (String) jsonItem.get("fcstValue");
						two.setSky(sky);
					}
					if (category.equals("TMP")) { // 현재기온
						tmp = (String) jsonItem.get("fcstValue");
						two.setTmp(tmp);
					}
				}

				if (category.equals("TMN")) { // 최저기온 시간필요없음
					if (dateCheck.equals(date)) { // 오늘
						tmn = (String) jsonItem.get("fcstValue");
						today.setTmn(tmn);
					} else if (dateCheck.equals(oneDate)) { // 내일
						tmn = (String) jsonItem.get("fcstValue");
						one.setTmn(tmn);
					} else { // 모레
						tmn = (String) jsonItem.get("fcstValue");
						two.setTmn(tmn);
					}
				}
				if (category.equals("TMX")) { // 최고기온 시간필요없음
					if (dateCheck.equals(date)) { // 오늘
						tmx = (String) jsonItem.get("fcstValue");
						today.setTmx(tmx);
					} else if (dateCheck.equals(oneDate)) { // 내일
						tmx = (String) jsonItem.get("fcstValue");
						one.setTmx(tmx);
					} else { // 모레
						tmx = (String) jsonItem.get("fcstValue");
						two.setTmx(tmx);
					}
				}
			}
		}

		list.add(today);
		list.add(one);
		list.add(two);

		return list;
	}

}
