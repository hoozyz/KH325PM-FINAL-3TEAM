package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Weather { // 일간 -> 오늘 내일 모레 따로 객체 생성
	private String pop; // 강수확률
	private String pcp; // 현재 강수량
	private String reh; // 습도
	private String sky; // 하늘상태 -> 0~5 좋음, 6~8 구름많음, 9~10 흐림
	private String tmp; // 현재기온
	private String tmn; // 최저기온
	private String tmx; // 최고기온
}
