package com.bc.heal.air.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.air.mapper.AirMapper;
import com.bc.heal.vo.Air;

@Service
public class AirServiceImpl implements AirService{

	@Autowired
	private AirMapper mapper;
	
	@Override
	public Air findByNo(int no) {
		return mapper.selectAirByNo(no);
	}

	@Override
	public List<Air> selectListByEnd(String airEnd) {
		return mapper.selectListByEnd(airEnd);
	}

	@Override
	public List<Air> selectTimeBySta(String start, String end) {
		return mapper.selectTimeBySta(start, end);
	}

	@Override
	public Air selectByStartTime(String start, String end, String time) {
		return mapper.selectByStartTime(start, end, time);
	}
	
}
