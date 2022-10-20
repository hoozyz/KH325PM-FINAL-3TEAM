package com.bc.heal.camp.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.bc.heal.air.service.AirService;
import com.bc.heal.bus.service.BusService;
import com.bc.heal.camp.service.CampService;
import com.bc.heal.common.util.PageInfo;
import com.bc.heal.review.service.ReviewService;
import com.bc.heal.shop.service.ShopService;
import com.bc.heal.train.service.TrainService;
import com.bc.heal.vo.Air;
import com.bc.heal.vo.Bus;
import com.bc.heal.vo.Camp;
import com.bc.heal.vo.EndStation;
import com.bc.heal.vo.Review;
import com.bc.heal.vo.Shop;
import com.bc.heal.vo.Train;
import com.bc.heal.vo.Weather;
import com.bc.heal.weather.service.WeatherService;

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

	@Autowired
	private WeatherService weaService;

	@Autowired
	private ReviewService revService;
	
	@Autowired
	private ShopService showService;

	
	@GetMapping("/campMain")
	public String main(Model model) {
		
			List<Shop> shopList = new ArrayList<>();
			shopList = showService.selectByCamp(); // 10개
			model.addAttribute("shopList", shopList);
				
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

		PageInfo pageInfo = new PageInfo(page, 5, listCount, 6);
		List<Camp> campList = campService.getCampList(pageInfo, param);

		model.addAttribute("campList", campList);
		model.addAttribute("param", param);
		model.addAttribute("pageInfo", pageInfo);

		return "/camp/campSearch";
	}

	@GetMapping("/rev")
	@ResponseBody
	public Map<String, Object> list(@RequestParam Map<String, String> param) {
		Map<String, Object> map = new HashMap<>();

		int page = Integer.parseInt(param.get("no"));

		List<Review> list = new ArrayList<>();
		String sort = param.get("sort");

		if (sort.contains("최신")) {
			sort = "new";
		}
		if (sort.contains("오래")) {
			sort = "old";
		}
		if (sort.contains("좋아")) {
			sort = "like";
		}
		if (sort.contains("별점")) {
			sort = "star";
		}

		int campNo = Integer.parseInt(param.get("camp"));
		PageInfo pageInfo = new PageInfo(page, 5, revService.getCountByCamp(campNo), 2);

		list = revService.selectRevCamp(campNo, pageInfo, sort); // 캠프번호, 페이지, 정렬

		map.put("list", list);
		map.put("pageInfo", pageInfo);

		return map;
	}

	@GetMapping("/campDetail")
	public String detail(Model model, int no) { // 캠핑장 상세정보, 기차/비행기/버스 도착역 리스트
		Camp camp = campService.findByNo(no); // 테스트 -> 공항있는 캠핑장

		// 최근 본 캠핑장 -> no 0 인 곳에 차례로 번호 넣기
		List<Camp> lastList = new ArrayList<>(); // 최신 4개 리스트
		lastList.add(camp); // 지금 들어가는게 최신

		Camp zero = campService.findByNo(0); // name, lineintro, intro, aria 순서로 없을 시 넣기 -> name가 최근
		if (zero.getName() == null) { // 초기값
			zero.setName("1337");
		}
		if (zero.getLineintro() == null) {
			zero.setLineintro("17");
		}
		if (zero.getIntro() == null) {
			zero.setIntro("77");
		}
		String threeNo = "";
		String fourNo = "";
		// 4개 넣어놓고 -> name에 최신 한 칸씩 뒤로 옮기기
		String twoNo = zero.getName();
		if (twoNo.equals("" + no)) { // 이미 최신에 현재 캠핑장이 있을 때
			twoNo = zero.getLineintro();
			threeNo = zero.getIntro();
			fourNo = zero.getAria();
		} else {
			threeNo = zero.getLineintro();
			fourNo = zero.getIntro();
		}

		lastList.add(campService.findByNo(Integer.parseInt(twoNo)));
		lastList.add(campService.findByNo(Integer.parseInt(threeNo)));
		lastList.add(campService.findByNo(Integer.parseInt(fourNo)));

		campService.updateCamp("" + no, twoNo, threeNo, fourNo); // update

		model.addAttribute("lastList", lastList);

		// 리뷰
		PageInfo pageInfo = new PageInfo(1, 5, revService.getCountByCamp(no), 2);
		List<Review> revList = new ArrayList<>();
		String sort = "new";
		revList = revService.selectRevCamp(no, pageInfo, sort); // 캠프번호, 페이지, 정렬

		model.addAttribute("revList", revList);
		model.addAttribute("pageInfo", pageInfo);

		// 날씨
		List<Weather> weaList = new ArrayList<>();

		String check = "";
		String[] checkArr;
		String dong = "";
		if (camp.getAddr().contains("면")) {
			check = camp.getAddr().split("면")[0]; // 면 기준 앞에만 자르기
			checkArr = check.split(" ");
			dong = checkArr[checkArr.length - 1];

		} else if (camp.getAddr().contains("읍")) {
			check = camp.getAddr().split("읍")[0];
			checkArr = check.split(" ");
			dong = checkArr[checkArr.length - 1];

		} else if (camp.getAddr().contains("동")) {
			check = camp.getAddr().split("동")[0];
			checkArr = check.split(" ");
			dong = checkArr[checkArr.length - 1];
		}

		try {
			if (dong != null) {
				if (weaService.selectByDong(dong) == null) {
					dong = dong.substring(0, 2);
					weaList = weatherApi(weaService.selectByDong(dong).getNx(), weaService.selectByDong(dong).getNy());
				} else {
					weaList = weatherApi(weaService.selectByDong(dong).getNx(), weaService.selectByDong(dong).getNy());
				}
			}
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

		model.addAttribute("today", today);
		model.addAttribute("one", one);
		model.addAttribute("two", two);

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
			airEnd = "김포";
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
			if (trainList.get(0).getGeneralprice() == 0) {
				trainList.get(i).setGeneralprice(15500);
			}
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
