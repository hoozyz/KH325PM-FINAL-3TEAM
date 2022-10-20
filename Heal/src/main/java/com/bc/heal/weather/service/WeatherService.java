package com.bc.heal.weather.service;

import com.bc.heal.vo.WeatherCoor;

public interface WeatherService {
	WeatherCoor selectByDong(String dong);

	WeatherCoor selectByGu(String dong);
}
