package com.bc.heal.weather.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.WeatherCoor;

@Mapper
public interface WeatherMapper {
	WeatherCoor selectByDong(String dong);

	WeatherCoor selectByGu(String dong);
}
