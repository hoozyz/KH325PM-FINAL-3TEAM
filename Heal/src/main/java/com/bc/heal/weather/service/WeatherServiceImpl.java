package com.bc.heal.weather.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.vo.WeatherCoor;
import com.bc.heal.weather.mapper.WeatherMapper;

@Service
public class WeatherServiceImpl implements WeatherService{
	
	@Autowired
	private WeatherMapper mapper;

	@Override
	public WeatherCoor selectByDong(String dong) {
		return mapper.selectByDong(dong);
	}

}
