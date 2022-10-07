package com.bc.heal.camp.controller;

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

import com.bc.heal.air.service.AirService;
import com.bc.heal.bus.service.BusService;
import com.bc.heal.camp.service.CampService;
import com.bc.heal.common.util.PageInfo;
import com.bc.heal.train.service.TrainService;
import com.bc.heal.vo.Air;
import com.bc.heal.vo.Bus;
import com.bc.heal.vo.Camp;
import com.bc.heal.vo.EndStation;
import com.bc.heal.vo.Train;
import com.bc.heal.vo.Weather;

@Controller
@RequestMapping("/camp")
public class CampController {

	@Autowired
	private CampService campService;

	@Autowired
	private TrainService trainService;

	@Autowired
	private BusService busService;

	@Autowired
	private AirService airService;

	@GetMapping("/campMain")
	public String main(Model model) {
		return "/camp/campMain";
	}

	@GetMapping("/campSearch")
	String search(Model model, @RequestParam Map<String, String> param) {

		int page = 1;
		if (param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {
			}
		}

		int listCount = campService.getCampCount(param);
		System.out.println("총 게시글 수  : " + listCount);
		model.addAttribute("listCount", listCount);

		PageInfo pageInfo = new PageInfo(page, 10, listCount, 8);
		List<Camp> campList = campService.getCampList(pageInfo, param);

		System.out.println(campList);

		model.addAttribute("campList", campList);
		model.addAttribute("param", param);
		model.addAttribute("pageInfo", pageInfo);

		return "/camp/campSearch";
	}

	@GetMapping("/camplist")
	String list(Model model, @RequestParam Map<String, String> param) {

		int page = 1;
		if (param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {
			}
		}

		int listCount = campService.getCampCount(param);
		System.out.println("총 게시글 수  : " + listCount);
		model.addAttribute("listCount", listCount);

		PageInfo pageInfo = new PageInfo(page, 10, listCount, 10);
		List<Camp> campList = campService.getCampList(pageInfo, param);

		System.out.println(campList);

		model.addAttribute("campList", campList);
		model.addAttribute("param", param);
		model.addAttribute("pageInfo", pageInfo);

		return "/camp/camplist";

	}

	@GetMapping("/detail")
	public String detail(Model model /* int no */) { // 캠핑장 상세정보, 기차/비행기/버스 도착역 리스트
		Camp camp = campService.findByNo(57); // 테스트 -> 공항있는 캠핑장

		// 리뷰
		
		
		// 날씨
		
		

		// 교통
		String lat = camp.getLat(); // 캠핑장 위도
		String lng = camp.getLng(); // 캠핑장 경도

		String airEnd = ""; // 도착공항
		String trainEnd = ""; // 기차 도착역
		String busEnd = ""; // 버스 도착역

		// 도착역 리스트(위도, 경도 가지고) -> 거리 비교위함
		List<EndStation> trainEndList = new ArrayList<>();
		List<EndStation> busEndList = new ArrayList<>();

		trainEndList = trainService.selectListByEndSta();
		busEndList = busService.selectListByEndSta();

		// 도착역 정하기 -> 거리가 제일 가까운 역 가져오기
		Double distance = 1000d; // 초기값 1000설정 -> 0이면 0보다 작을 수 없어서
		for (int i = 0; i < trainEndList.size(); i++) {
			Double distance1 = distance(Double.parseDouble(lat), Double.parseDouble(lng),
					Double.parseDouble(trainEndList.get(i).getEndlat()),
					Double.parseDouble(trainEndList.get(i).getEndlng()));

			// 앞의 지역 사이 거리보다 작으면 거리 바꾸기
			if (distance1 < distance) {
				distance = distance1;
				trainEnd = trainEndList.get(i).getEndsta(); // 도착역 넣기 -> 마지막에 넣어지는게 제일 가까운 역
			}
		}

		distance = 1000d;
		for (int i = 0; i < busEndList.size(); i++) {
			Double distance1 = distance(Double.parseDouble(lat), Double.parseDouble(lng),
					Double.parseDouble(busEndList.get(i).getEndlat()),
					Double.parseDouble(busEndList.get(i).getEndlng()));

			if (distance1 < distance) {
				distance = distance1;
				busEnd = busEndList.get(i).getEndsta();
			}
		}

		// 도착항공 정하기
		if (camp.getAddr().contains("진주") || camp.getAddr().contains("사천")) {
			airEnd = "진주";
		} else if (camp.getAddr().contains("무안")) {
			airEnd = "무안";
		} else if (camp.getAddr().contains("포항")) {
			airEnd = "포항";
		} else if (camp.getAddr().contains("부산")) {
			airEnd = "부산";
		} else if (camp.getAddr().contains("울산")) {
			airEnd = "울산";
		} else if (camp.getAddr().contains("제주")) {
			airEnd = "제주";
		} else if (camp.getAddr().contains("광주")) {
			airEnd = "광주";
		} else if (camp.getAddr().contains("여수")) {
			airEnd = "여수";
		} else if (camp.getAddr().contains("김포")) {
			airEnd = "깊모";
		}

		// 도착역이랑 캠핑장 위치랑 제일 가까운
		// 비행기는 도착공항이 주소에 들어가면 도착공항 가능
		// 시간표 리스트
		List<Train> trainList = new ArrayList<>();
		List<Bus> busList = new ArrayList<>();
		List<Air> airList = new ArrayList<>();

		// 출발역 리스트
		List<String> trainStartList = new ArrayList<>();
		List<String> busStartList = new ArrayList<>();
		List<String> airStartList = new ArrayList<>();

		// 도착역이 정해진 리스트
		trainList = trainService.selectListByEnd(trainEnd);
		busList = busService.selectListByEnd(busEnd);
		airList = airService.selectListByEnd(airEnd);

		for (int i = 0; i < trainList.size(); i++) {
			if (trainList.get(i).getGeneralprice() == 0) { // 가격이 없을 때
				trainList.get(i).setGeneralprice(trainList.get(i - 1).getGeneralprice());
			}

			if (trainStartList.contains(trainList.get(i).getStartsta()) == false) { // 시작역 겹칠경우 안넣음
				trainStartList.add(trainList.get(i).getStartsta());
			}
		}
		for (int i = 0; i < busList.size(); i++) {
			if (busList.get(i).getNormalprice() == 0) { // 가격이 없을 때 -> 버스는 10500원으로 통일
				busList.get(i).setNormalprice(10500);
			}

			if (busStartList.contains(busList.get(i).getStartsta()) == false) { // 시작역 겹칠경우 안넣음
				busStartList.add(busList.get(i).getStartsta());
			}
		}
		for (int i = 0; i < airList.size(); i++) { // 가격 다 있음
			if (airStartList.contains(airList.get(i).getStartsta()) == false) { // 시작역 겹칠경우 안넣음
				airStartList.add(airList.get(i).getStartsta());
			}
		}

		int airCheck = 1;
		if (airList.isEmpty()) { // 공항 없음
			airCheck = 0;
		}
		Double priceDouble = camp.getPrice() * 1.5;
		int price = priceDouble.intValue();

		model.addAttribute("airEnd", airEnd);
		model.addAttribute("trainEnd", trainEnd);
		model.addAttribute("busEnd", busEnd);
		model.addAttribute("price", price);
		model.addAttribute("airCheck", airCheck);
		model.addAttribute("camp", camp);
		model.addAttribute("trainList", trainList);
		model.addAttribute("busList", busList);
		model.addAttribute("airList", airList);
		model.addAttribute("trainStartList", trainStartList);
		model.addAttribute("busStartList", busStartList);
		model.addAttribute("airStartList", airStartList);

		return "/camp/campDetail";
	}

	// 사이의 거리
	private static double distance(double lat1, double lon1, double lat2, double lon2) {

		double theta = lon1 - lon2;
		double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
				+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));

		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515;

		return dist;
	}

	private static double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}

	private static double rad2deg(double rad) {
		return (rad * 180 / Math.PI);
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

		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		cal.add(Calendar.DATE, 1); // 하루 추가
		String oneDate = sdf.format(cal.getTime()).split("")[0]; // 내일 날짜
		cal.add(Calendar.DATE, 1); // 하루 추가
		String twoDate = sdf.format(cal.getTime()).split("")[0]; // 모레 날짜

		System.out.println(nowTime);

		String date = nowTime.split("")[0]; // 날짜만

		String time = nowTime.split("")[1] + "00"; // 시간중 -> 0900 처럼 만들기

		String urlStr = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?"
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
						today.setTmn(tmn);
					} else if (dateCheck.equals(oneDate)) { // 내일
						tmx = (String) jsonItem.get("fcstValue");
						one.setTmn(tmn);
					} else { // 모레
						tmx = (String) jsonItem.get("fcstValue");
						two.setTmn(tmn);
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
