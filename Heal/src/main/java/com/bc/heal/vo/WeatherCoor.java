package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WeatherCoor { // 날씨 지역 좌표
	private String gu;
	private String dong;
	private String nx;
	private String ny;
}
